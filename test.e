note
	description: "Summary description for {TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST
inherit
	LINKED_LIST[TEST]
create
	make

feature
	x : INTEGER
	y : INTEGER
--
	setX(valeur : INTEGER)
	do
		x := valeur
	end

	setY(valeur : INTEGER)
	do
		y:=valeur
	end

end
