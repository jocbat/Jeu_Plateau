note
	description: "Abstraction d'un emplacement pour une pi�ce (ex : pi�ce d'�chiquier)"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	LOCATION[G -> PIECE]

feature
	put(p : G)
	-- ajouter une piece
	deferred
	end

	puted_piece : G

	empty
	-- vider l'emplacement (retirer la piece s'il y en a une)
	deferred
	end

	is_putable(p : G) : BOOLEAN
	-- Peut-on mettre cette pi�ce sur cet emplacement ?
	deferred
	end

end
