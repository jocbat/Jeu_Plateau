note
	description: "Summary description for {EMPLACEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	EMPLACEMENT

feature
	poser(p : PIECE)
	deferred
	end

	retirer(p : PIECE)
	deferred
	end

	piece_posee : PIECE

	vider
	deferred
	end

	est_posable(p : PIECE) : BOOLEAN
	deferred
	end

end
