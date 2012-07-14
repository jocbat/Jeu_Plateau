note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_POINT

inherit
	EQA_TEST_SET

feature -- Test routines

	test_make
		note
			testing:  "covers/{POINT}.make"
		local
			point : POINT
		do
			create point.make (12, -5)
		end

	test_translater
		note
			testing:  "covers/{POINT}.translater"
		local
			point : POINT
		do
			create point.make (12, -5)
			point.translater (10, -9)
		end

	test_rotation_90
	note
		testing:  "covers/{POINT}.rotation_90"
	local
		point : POINT
		centre : POINT
	do
		create point.make (1, 2)
		create centre.make (0, 0)
		point.rotation_90 (centre)
		print(point.abscisse)
		print(" ")
		print(point.ordonnee)
	end


end


