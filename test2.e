note
	description: "Summary description for {TEST2}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST2
inherit
	LINKED_LIST[TEST]

create
	make

feature
	x : INTEGER
	y : INTEGER

	setX(valeur : INTEGER)
	do
		x := valeur
	end

	setY(valeur : INTEGER)
	do
		y:=valeur
	end

	do_something(test : TEST2)
	do

	end
end
