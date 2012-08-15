note
	description: "D�crit une entit� du plan gaussien que l'on peut d�placer"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DEPLACEABLE

feature
	translate(v_abs : INTEGER;v_ord : INTEGER)
	-- effectue une translation de vecteur (v_abs, v_ord) du point courant
	deferred
	end

	rotation_90(centre : POINT)
	-- op�rer une rotation de 90� dans le sens trigonom�trique de centre 'centre'
	deferred
	end

	rotation_180(centre : POINT)
	-- op�rer une rotation de 180� dans le sens trigonom�trique de centre 'centre'
	do
		rotation_90 (centre)
		rotation_90 (centre)
	end

	rotation_270(centre : POINT)
	-- op�rer une rotation de 270� dans le sens trigonom�trique de centre 'centre'
	do
		rotation_90 (centre)
		rotation_180(centre)
	end

	symmetrize_horizontally(point : POINT)
	-- effectue la sym�trie de Current par rapport � la droite horizontale
	-- dont tous les points ont pour abscisse abscisse_droite
	deferred
	ensure
		-- TODO !! involution of the routine
	end

	symmetrize_vertically(point : POINT)
	-- effectue la sym�trie de Current par rapport � la droite verticale
	-- dont tous les points ont pour ordonnee ordonnee_droite
	deferred
	ensure
		-- TODO !! involution of the routine
	end

	symmetrize_first_diagonal(point : POINT)
	-- effectue la sym�trie de Current par rapport � la droite parall�le
	-- � la premi�re diagonale et passant par 'point'
	deferred
	end

	symmetrize_second_diagonal(point : POINT)
	-- effectue la sym�trie de Current par rapport � la droite parall�le
	-- � la deuxi�me diagonale et passant par 'point'
	deferred
		-- TODO !! involution of the routine
	end


	is_symmetrized_horizontally_of(point : POINT; other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une sym�trie axiale horizontale
	-- passant par point ?
	deferred
	end

	is_symmetrized_vertically_of(point : POINT; other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une sym�trie axiale verticale
	-- passant par point ?
	deferred
	end

	is_symmetrized_first_diagonal_of(point : POINT; other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une sym�trie axiale d'axe parall�le
	-- � la premi�re diagonale et passant par point ?
	deferred
	end

	is_symmetrized_second_diagonal_of(point : POINT; other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une sym�trie axiale d'axe parall�le
	-- � la seconde diagonale et passant par point ?
	deferred
	end


	symmetric_horizontally(point : POINT) : like Current
	--sym�trique de Current par rapport � la droite horizontale
	--passant par point
	deferred
	end

	symmetric_vertically(point : POINT) : like Current
	-- sym�trique de Current par rapport � la droite verticale
	-- passant par point
	deferred
	end

	symmetric_first_diagonal(point : POINT) : like Current
	-- sym�trique de Current par rapport � la droite parall�le � la premiere
	-- diagonale et passant par point
	deferred
	end

	symmetric_second_diagonal(point : POINT) : like Current
	-- sym�trique de Current par rapport � la droite parall�le � la seconde
	-- diagonale et passant par point
	deferred
	end

feature

	is_isometric(other : like Current) : BOOLEAN
	-- est ce que Current repr�sente une entit� isom�trique � 'other' ?
	deferred
	end

feature
	is_translation_of(other : like Current) : BOOLEAN
	-- est ce que Current est le translat� de 'other' ?
	deferred
	end

	is_rotation_of(other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par rotation ?
	deferred
	end

	is_rotation90_of(other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une rotation de 90� ?
	deferred
	end

	is_rotation180_of(other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une rotation de 180� ?
	deferred
	end

	is_rotation270_of(other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une rotation de 270� ?
	deferred
	end

	translation_vector(other : like Current) : TUPLE[x : INTEGER; y : INTEGER]
	-- vecteur permettant d'obtenir Current par translation de 'other'
	require
		existence : is_translation_of(other)
	deferred
	ensure
		opposite_symetry : other.translation_vector (Current).x.is_equal (-Result.x) and
							other.translation_vector (Current).y.is_equal (-Result.y)
	end

	center_point_rotation90(other : like Current) : POINT
	-- quel est le centre de la rotation de 90� dont Current est l'image de 'other' ?
	require
    	existence : is_rotation90_of(other)
	deferred
	end

	center_point_rotation180(other : like Current) : POINT
	-- quel est le centre de la rotation de 180� dont Current est l'image de 'other' ?
	require
    	existence : is_rotation180_of(other)
	deferred
	end

	center_point_rotation270(other : like Current) : POINT
	-- quel est le centre de la rotation de 270� dont Current est l'image de 'other' ?
	require
    	existence : is_rotation270_of(other)
	deferred
	end

	center_point_rotation(other : like Current) : POINT
	-- centre de la rotation dont l'image de 'other' est Current
	require
		existence : is_rotation90_of(other) or is_rotation180_of(other) or is_rotation270_of(other)
	do
		if is_rotation90_of(other) then
            Result := center_point_rotation90 (other)
        end

        if is_rotation180_of(other) then
            Result := center_point_rotation180 (other)
        end

        if is_rotation270_of(other) then
            Result := center_point_rotation270 (other)
        end
	end

end
