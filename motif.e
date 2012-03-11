note
	description: "Forme décrite par un ensemble de points du plan."
	author: ""
	date: "$Date$"
	revision: "$Revision$"


class
	MOTIF[G -> POINT]
inherit
	LINKED_LIST[G]

	DEPLACEABLE
		undefine is_equal, copy
		redefine translater,rotation_90 end


feature
	translater(v_abs : INTEGER;v_ord : INTEGER)
	do
		from start
		until after
		loop
			item.translater (v_abs, v_ord)
		end
	end

	rotation_90(centre : POINT)
	do
		--do_all (action: PROCEDURE [ANY, TUPLE [G]])
		from start
		until after
		loop
			item.rotation_90 (centre.abscisse,centre.ordonnee)
		end
	end

end
