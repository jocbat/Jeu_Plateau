note
	description: "Décrit une entité du plan gaussien que l'on peut déplacer"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred
class
	DEPLACEABLE

feature
	translater(v_abs : INTEGER;v_ord : INTEGER)
	-- effectue une translation de vecteur (v_abs, v_ord) du point courant
	deferred
	end

	rotation_90(centre : POINT)
	-- opérer une rotation de 90° dans le sens trigonométrique de centre 'centre'
	deferred
	end

	rotation_180(centre : POINT)
	-- opérer une rotation de 180° dans le sens trigonométrique de centre 'centre'
	do
		rotation_90 (centre)
		rotation_90 (centre)
	end

	rotation_270(centre : POINT)
	-- opérer une rotation de 270° dans le sens trigonométrique de centre 'centre'
	do
		rotation_90 (centre)
		rotation_180(centre)
	end

	symetriser_horizontalement(point : POINT)
	-- effectue la symétrie de Current par rapport à la droite horizontale
	-- dont tous les points ont pour abscisse abscisse_droite
	deferred
	end

	symetriser_verticalement(point : POINT)
	-- effectue la symétrie de Current par rapport à la droite verticale
	-- dont tous les points ont pour ordonnee ordonnee_droite
	deferred
	end

	symetriser_premiere_diagonale(point : POINT)
	-- effectue la symétrie de Current par rapport à la droite parallèle
	-- à la première diagonale et passant par 'point'
	deferred
	end

	symetriser_deuxieme_diagonale(point : POINT)
	-- effectue la symétrie de Current par rapport à la droite parallèle
	-- à la deuxième diagonale et passant par 'point'
	deferred
	end

feature

	is_isometric(other : like Current) : BOOLEAN
	-- est ce que Current représente une entité isométrique à 'other' ?
	deferred
	end

feature
	is_translation_of(other : like Current) : BOOLEAN
	-- est ce que Current est le translaté de 'other' ?
	deferred
	end

	is_rotation_of(other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par rotation ?
	deferred
	end

	is_rotation90_of(other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une rotation de 90° ?
	deferred
	end

	is_rotation180_of(other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une rotation de 180° ?
	deferred
	end

	is_rotation270_of(other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une rotation de 270° ?
	deferred
	end

	vector_translation(other : like Current) : TUPLE[x : INTEGER; y : INTEGER]
	-- vecteur permettant d'obtenir Current par translation de 'other'
	require
		existence : is_translation_of(other)
	deferred
	end

	center_point_rotation90(other : like Current) : POINT
	-- quel est le centre de la rotation de 90° dont Current est l'image de 'other' ?
	require
    	existence : is_rotation90_of(other)
	deferred
	end

	center_point_rotation180(other : like Current) : POINT
	-- quel est le centre de la rotation de 180° dont Current est l'image de 'other' ?
	require
    	existence : is_rotation180_of(other)
	deferred
	end

	center_point_rotation270(other : like Current) : POINT
	-- quel est le centre de la rotation de 270° dont Current est l'image de 'other' ?
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
