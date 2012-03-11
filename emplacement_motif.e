note
	description: "Summary description for {EMPLACEMENT_MOTIF}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EMPLACEMENT_MOTIF
inherit
	EMPLACEMENT
	undefine is_equal,copy end

	LINKED_LIST[EMPLACEMENT_MOTIF]

create
	make_with_one_point,make_with_many_points

feature
	make_with_one_point(x : INTEGER; y : INTEGER)
	do
		make
		abscisse := x
		ordonnee := y
		extend (current)
	end

	make_with_many_points
	do
		make

	end

feature
	abscisse : INTEGER

	ordonnee : INTEGER

feature
	poser(p : PIECE)
	do
	end

	retirer(p : PIECE)
	do
	end

	vider
	do
	end

	est_posable(p : PIECE) : BOOLEAN
	do
	end

end
