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
	end

feature
	abscisse : INTEGER
	ordonnee : INTEGER

feature
	translater(v_abs : INTEGER;v_ord : INTEGER)
	do
		abscisse := abscisse + v_abs
		ordonnee := ordonnee + v_ord
	--ensure
	--	reverse_translation_abscisse :
	--		old  abscisse = abscisse - v_abs
	--	reverse_translation_ordonnee :
	--		old  ordonnee = ordonnee - v_ord
	end

	rotation_90(centre : POINT)
	local
		v_abs : INTEGER
		v_ord : INTEGER
	do
		v_abs := centre.abscisse - ordonnee
		v_ord := centre.ordonnee + abscisse
		abscisse := v_abs
		ordonnee := v_ord
	end

feature
	is_equal(other : like Current) : BOOLEAN
	do
          Result := (other.abscisse = abscisse) and (other.ordonnee = ordonnee)
	end

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
	do
			Result := ((other.ordonnee - other.abscisse + ordonnee - abscisse) \\ 2 = 0)
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
		center.make (x, y)
		Result := center
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
		center.make (x, y)
		Result := center
	end

	center_point_rotation270(other : like Current) : POINT
	-- centre de la rotation de 180°
	-- dont l'image de 'other' est le point courant
	do
		Result := other.center_point_rotation90 (Current)
	end

	vector_translation(other : like Current) : TUPLE[x : INTEGER; y : INTEGER]
	-- vecteur permettant d'obtenir Current par translation de 'other'
	do
		Result.x := abscisse - other.abscisse
		Result.y := ordonnee - other.ordonnee
	end

	symetriser_horizontalement(point : POINT)
	do
		ordonnee := 2 * point.ordonnee - ordonnee
	end

	symetriser_verticalement(point : POINT)
	do
		abscisse := 2 * point.abscisse - abscisse
	end


	symetriser_premiere_diagonale(point : POINT)
	do
		-- On s'inspire de la maniere de faire si 'point' était le (0,0) (cas simple)
		-- en prenant 'point' comme "nouvel origine"
		abscisse := point.abscisse + (ordonnee - point.ordonnee)
		ordonnee := point.ordonnee + (abscisse - point.abscisse)

	end

	symetriser_deuxieme_diagonale(point : POINT)
	do
		-- On s'inspire de la maniere de faire si 'point' était le (0,0) (cas simple)
		-- en prenant 'point' comme "nouvel origine"
		abscisse := point.abscisse - (ordonnee - point.ordonnee)
		ordonnee := point.ordonnee - (abscisse - point.abscisse)
	end

feature{NONE}




end
