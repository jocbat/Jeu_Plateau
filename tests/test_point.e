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

	test_is_equal
		note
			testing:  "covers/{POINT}.is_equal"
		local
			point : POINT
			point2 : POINT
		do
			create point.make (12, -5)
			create point2.make (12, -5)
			assert ("les deux points sont �gaux", point.is_equal (point2))
		end

	test_square_distance_from
	note
			testing:  "covers/{POINT}.square_distance_from"
	local
		point1 : POINT
		point2 : POINT
	do
		create point1.make (0, 0)
		create point2.make (1, 1)
		assert ("La distance entre deux points est bien calcul�e",
					point1.square_distance_from(point2) = 2)
	end

	test_is_isometric
		note
			testing:  "covers/{POINT}.is_isometric"
		local
			point : POINT
			point2 : POINT
		do
			create point.make (-9, -6)
			create point2.make (1, -1)
			assert ("Deux points sont isom�triques", point.is_isometric (point2))
		end

	test_is_translation_of
		note
			testing:  "covers/{POINT}.is_translation_of"
		local
			point : POINT
			point2 : POINT
		do
			create point.make (2, -1)
			create point2.make (1, 1)
			assert ("Deux points sont images par une translation", point.is_isometric (point2))
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
	end

	test_is_rotation90_of_true_case
	note
		testing:  "covers/{POINT}.is_rotation90_of"
	local
		current_point : POINT
		antecedent : POINT
	do
		create current_point.make (1,3)
		create antecedent.make (4, 2)
		assert ("Deux points qui sont images par une rotation de 90�",
								current_point.is_rotation90_of (antecedent))

	end

	test_is_rotation90_of_wrong_case
	note
		testing:  "covers/{POINT}.is_rotation90_of"
	local
		current_point : POINT
		antecedent : POINT
	do
		create current_point.make (1, 1)
		create antecedent.make (1, 0)
		assert ("Deux points qui sont images par une rotation de 90�",
								not current_point.is_rotation90_of (antecedent))
	end

	test_center_point_rotation90
	note
		testing:  "covers/{POINT}.center_point_rotation90"
	local
		p1 : POINT
		p2 : POINT
		center : POINT
		origin : POINT
	do
		create p1.make (0, 1)
		create p2.make (1, 0)
		create origin.make (0, 0)
		center := p1.center_point_rotation90 (p2)
	end

end


