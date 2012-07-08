note
	description: "Abstraction d'un emplacement pour une pièce (ex : pièce d'échiquier)"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	LOCATION[reference G -> PIECE]

feature
	put(p : G)
	-- ajouter une piece
	do
		put_piece := p
	ensure
		put_piece = p
	end

	-- piece mise sur l'emplacement
	put_piece : detachable G

	empty
	-- vider l'emplacement (retirer la piece s'il y en a une)
	do
		put_piece := Void
	ensure
		put_piece = Void
	end

	is_putable(p : G) : BOOLEAN
	-- Peut-on mettre cette pièce sur cet emplacement ?
	deferred
	end

end
