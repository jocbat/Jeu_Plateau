note
	description: "Summary description for {PIECE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PIECE

feature

	current_location : LOCATION[like Current]

	put(empl : like current_location)
	-- ajouter la piece courante à l'emplacement empl
	deferred
	end

	remove
	-- retirer la piece de l'emplacement 'current_location'
	deferred
	end

	is_putable(empl : like current_location) : BOOLEAN
	-- Peut-on mettre la pièce courante sur cet emplacement ?
	deferred
	end

end
