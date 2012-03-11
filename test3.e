note
	description: "Summary description for {TEST3}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST3
inherit
	TEST2
	redefine do_something end
create
	make

feature
	z : STRING

	do_something(test : TEST3)
	do
		z := "TEST3"
	end
end
