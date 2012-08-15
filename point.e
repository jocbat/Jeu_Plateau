note
	description: "Summary description for {POINT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	POINT
inherit
	DEPLACEABLE
	redefine is_equal end
create
	make

feature
	make(abs : INTEGER;ord : INTEGER)
	do
		abscisse := abs
		ordonnee := ord
	ensure
		set_abscisse : abscisse = abs
		set_ordonnee : ordonnee = ord
	end

feature
	abscisse : INTEGER
	ordonnee : INTEGER

	square_distance_from(other : like Current) : REAL_64
	do
		Result := (other.abscisse - abscisse)^2 + (other.ordonnee - ordonnee)^2
	ensure then
		positive : Result >= 0
		symmetric : Result = other.square_distance_from (Current)
	end

feature
	is_equal(other : like Current) : BOOLEAN
	do
          Result := (other.abscisse = abscisse) and (other.ordonnee = ordonnee)
	end

	translate(v_abs : INTEGER;v_ord : INTEGER)
	do
		abscisse := abscisse + v_abs
		ordonnee := ordonnee + v_ord
	ensure then
		reverse_translation_abscisse :
			abscisse = old  abscisse + v_abs
		reverse_translation_ordonnee :
			ordonnee = old  ordonnee + v_ord
	end

	rotation_90(centre : POINT)
	local
		v_abs : INTEGER
		v_ord : INTEGER
	do
		v_abs := centre.abscisse + (centre.ordonnee - ordonnee)
		v_ord := centre.ordonnee - (centre.abscisse - abscisse)
		abscisse := v_abs
		ordonnee := v_ord
	ensure then
		-- évaluation des distances à l'aide de la distance canonique
		meme_distance : (old abscisse - centre.abscisse)^2 + (old ordonnee - centre.ordonnee)^2
		= (abscisse - centre.abscisse)^2 + (ordonnee - centre.ordonnee)^2

		-- réciproque du théorème de Pythagore
		angle_droit : (old abscisse - centre.abscisse)^2 + (old ordonnee - centre.ordonnee)^2
		+ (abscisse - centre.abscisse)^2 + (ordonnee - centre.ordonnee)^2
		= (old abscisse - abscisse)^2 + (old ordonnee - ordonnee)^2
	end

feature

	is_isometric(other : like Current) : BOOLEAN
	do
          Result := True
	end

feature
	is_translation_of(other : like Current) : BOOLEAN
	do
          Result := True
	end

	is_rotation_of(other : like Current) : BOOLEAN
	do
          Result := is_rotation90_of (other) or is_rotation180_of (other) or is_rotation270_of (other)
	end

feature
	is_rotation90_of(other : like Current) : BOOLEAN
	-- Est ce que le point courant est l'image de 'other' par
	-- une rotation de 90° ?
	local
		-- Calcul des coordonnées du centre éventuel de la rotation
		-- On raisonne sur le référenciel dont l'origine est le point courant
		x, y : INTEGER
	do
		-- le centre (x_center, y_center) existe si et seulement si :
		-- x_center := abscisse + (other.abscisse - abscisse + other.ordonnee - ordonnee) / 2
		-- y_center := ordonnee + (other.ordonnee - ordonnee + abscisse - other.abscisse) / 2
		-- sont des entiers
		x := other.abscisse - abscisse + other.ordonnee - ordonnee
		y := other.ordonnee - ordonnee + abscisse - other.abscisse
		Result := (x \\ 2 = 0) and (y \\ 2 = 0)
	end

	is_rotation180_of(other : like Current) : BOOLEAN
	-- Est ce que le point courant est l'image de 'other' par
	-- une rotation de 180° ?
	do
			Result := (((other.ordonnee - ordonnee) \\ 2 = 0) and (other.abscisse - abscisse) \\ 2 = 0)
	end

	is_rotation270_of(other : like Current) : BOOLEAN
	-- Est ce que le point courant est l'image de 'other' par
	-- une rotation de 270° ?
	do
			Result := other.is_rotation90_of (Current)
	end

	center_point_rotation90(other : like Current) : POINT
	-- centre de la rotation de 90°
	-- dont l'image de 'other' est le point courant
    local
    	x_center : REAL_64
    	y_center : REAL_64
    	x : INTEGER
    	y : INTEGER
    	center : POINT

	do
		x_center := abscisse + (other.abscisse - abscisse + other.ordonnee - ordonnee) / 2
		y_center := ordonnee + (other.ordonnee - ordonnee + abscisse - other.abscisse) / 2
		x := x_center.truncated_to_integer
		-- on peut tronquer car la précondition est vérifiée x_center est bien un entier
		y := y_center.truncated_to_integer
		-- on peut tronquer car la précondition est vérifiée y_center est bien un entier
		create center.make (x, y)
		Result := center
	ensure then
		same_distance : square_distance_from(Result) = other.square_distance_from (Result)
		angle_of_90 : other.square_distance_from (Result) + Result.square_distance_from (Current) =
						other.square_distance_from (Current)
	end

	center_point_rotation180(other : like Current) : POINT
	-- centre de la rotation de 90°
	-- dont l'image de 'other' est le point courant
    local
    	x_center : REAL_64
    	y_center : REAL_64
    	x : INTEGER
    	y : INTEGER
    	center : POINT
	do
		x_center := (other.abscisse + abscisse) / 2
		y_center := (other.ordonnee + ordonnee) / 2
		x := x_center.truncated_to_integer
		-- on peut tronquer car la précondition est vérifiée x_center est bien un entier
		y := y_center.truncated_to_integer
		-- on peut tronquer car la précondition est vérifiée y_center est bien un entier
		create center.make (x, y)
		Result := center
	end

	center_point_rotation270(other : like Current) : POINT
	-- centre de la rotation de 180°
	-- dont l'image de 'other' est le point courant
	do
		Result := other.center_point_rotation90 (Current)
	end

	translation_vector(other : like Current) : TUPLE[x : INTEGER; y : INTEGER]
	-- vecteur permettant d'obtenir Current par translation de 'other'
	do
		create Result
		Result.x := abscisse - other.abscisse
		Result.y := ordonnee - other.ordonnee
	end

	symmetrize_horizontally(point : POINT)
	do
		ordonnee := 2 * point.ordonnee - ordonnee
	end

	symmetrize_vertically(point : POINT)
	do
		abscisse := 2 * point.abscisse - abscisse
	end

	symmetrize_first_diagonal(point : POINT)
	local
		temp_abs : INTEGER
		temp_ord : INTEGER
	do
		-- On s'inspire de la maniere de faire si 'point' était le (0,0) (cas simple)
		-- en prenant 'point' comme "nouvel origine"

		temp_abs := point.abscisse + (ordonnee - point.ordonnee)
		temp_ord := point.ordonnee + (abscisse - point.abscisse)
		abscisse := temp_abs
		ordonnee := temp_ord
	end

	symmetrize_second_diagonal(point : POINT)
	local
		temp_abs : INTEGER
		temp_ord : INTEGER
	do
		-- On s'inspire de la maniere de faire si 'point' était le (0,0) (cas simple)
		-- en prenant 'point' comme "nouvel origine"
		temp_abs := point.abscisse - (ordonnee - point.ordonnee)
		temp_ord := point.ordonnee - (abscisse - point.abscisse)
		abscisse := temp_abs
		ordonnee := temp_ord
	end

	is_symmetrized_horizontally_of(point : POINT; other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une symétrie axiale horizontale
	-- passant par point ?
	do
		Result := (other.abscisse = abscisse) and ((ordonnee + other.ordonnee) / 2 = point.ordonnee)
	end

	is_symmetrized_vertically_of(point : POINT; other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une symétrie axiale verticale
	-- passant par point ?
	do
		Result := (other.ordonnee = ordonnee) and ((abscisse + other.abscisse) / 2 = point.abscisse)
	end

	is_symmetrized_first_diagonal_of(point : POINT; other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une symétrie axiale d'axe parallèle
	-- à la première diagonale et passant par point ?
	do
		Result := (other.abscisse - point.abscisse = ordonnee - point.ordonnee)
					and (other.ordonnee - point.ordonnee = abscisse - point.abscisse)
	end

	is_symmetrized_second_diagonal_of(point : POINT; other : like Current) : BOOLEAN
	-- est ce que Current est image de 'other' par une symétrie axiale d'axe parallèle
	-- à la seconde diagonale et passant par point ?
	do
		Result := (abscisse - point.abscisse = - (other.ordonnee - point.ordonnee))
					and (ordonnee - point.ordonnee = - (other.abscisse - point.abscisse))
	end

	symmetric_horizontally(point : POINT) : like Current
	--symétrique de Current par rapport à la droite horizontale
	--passant par point
	do
	end

	symmetric_vertically(point : POINT) : like Current
	-- symétrique de Current par rapport à la droite verticale
	-- passant par point
	do
	end

	symmetric_first_diagonal(point : POINT) : like Current
	-- symétrique de Current par rapport à la droite parallèle à la premiere
	-- diagonale et passant par point
	do
	end

	symmetric_second_diagonal(point : POINT) : like Current
	-- symétrique de Current par rapport à la droite parallèle à la seconde
	-- diagonale et passant par point
	do
	end

feature{NONE}




end
