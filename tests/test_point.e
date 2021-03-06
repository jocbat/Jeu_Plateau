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

	test_translater
	note
		testing:  "covers/{POINT}.translater"
	local
		point : POINT
	do
		create point.make (12, -5)
		point.translate (10, -9)
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

	test_is_rotation_of
	do
		-- TODO !!
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

	test_is_rotation180_of_true_case
	note
		testing:  "covers/{POINT}.is_rotation180_of"
	local
		p1 : POINT
		p2 : POINT
		center : POINT
	do
		create p1.make (1, 1)
		create p2.make (1, -1)
		assert ("Deux points images par rotation de 180 degr�s",
					p1.is_rotation180_of (p2))
	end

	test_is_rotation180_of_wrong_case
	note
		testing:  "covers/{POINT}.is_rotation180_of"
	local
		p1 : POINT
		p2 : POINT
		center : POINT
	do
		create p1.make (1, 1)
		create p2.make (4, 2)
		assert ("Deux points images par rotation de 180 degr�s",
					not p1.is_rotation180_of (p2))
	end

	test_is_rotation270_of_true_case
	note
		testing:  "covers/{POINT}.is_rotation270_of"
	local
		p1 : POINT
		p2 : POINT
		center : POINT
	do
		create p1.make (0, -2)
		create p2.make (2, 0)
		assert ("Deux points images par rotation de 180 degr�s",
					p2.is_rotation270_of (p1))
	end

	test_is_rotation270_of_wrong_case
	note
		testing:  "covers/{POINT}.is_rotation270_of"
	local
		p1 : POINT
		p2 : POINT
		center : POINT
	do
		create p1.make (1, 1)
		create p2.make (1, 0)
		assert ("Deux points images par rotation de 180 degr�s",
					not p2.is_rotation270_of (p1))
	end

	test_center_point_rotation90
	note
		testing:  "covers/{POINT}.center_point_rotation90"
	local
		p1 : POINT
		p2 : POINT
		expected_center : POINT
		center : POINT
	do
		create p1.make (0, 1)
		create p2.make (1, 0)
		create expected_center.make (0, 0)
		center := p1.center_point_rotation90 (p2)
		assert("La rotation de centre (0,0) et d'angle 90 degr�s envoit (1,0) sur (0,1)",
			center.is_equal (expected_center))
	end


	test_center_point_rotation180
	note
		testing:  "covers/{POINT}.center_point_rotation180"
	local
		p1 : POINT
		p2 : POINT
		center : POINT
		expected_center : POINT
	do
		create p1.make (2, 2)
		create p2.make (-2, -2)
		create expected_center.make (0, 0)
		center := p1.center_point_rotation180(p2)
		print(center.abscisse)
		print(" ")
		print(center.ordonnee)


		assert("La rotation de centre (0,0) et d'angle 180 degr�s envoit (-2, -2) sur (2, 2)",
			center.is_equal (expected_center))
	end

	test_center_point_rotation270
	note
		testing:  "covers/{POINT}.center_point_rotation270"
	local
		p1 : POINT
		p2 : POINT
		center : POINT
	do
		create p1.make (0, 3)
		create p2.make (3, 0)
		center := p1.center_point_rotation90 (p2)
	end

	test_vector_translation
	note
		testing:  "covers/{POINT}.vector_translation"
	local
		p1 : POINT
		p2 : POINT
		translation_vector : TUPLE[x : INTEGER; y : INTEGER]
	do
		create p1.make (12, 3)
		create p2.make (2, 0)
		translation_vector := p1.translation_vector (p2)

	end

	test_symetriser_horizontalement
	note
		testing:  "covers/{POINT}.symetriser_horizontalement"
	local
		p1 : POINT
		point_line : POINT
		p1_image : POINT
		expected_image : POINT
	do
		create p1.make (12, 3)
		create point_line.make (-1, 1)
		create expected_image.make (12, -1)
		p1.symmetrize_horizontally (point_line)
		assert("L'image de (12,3) par la symetrie axiale passant par (-1,1) est (12,-1)",
				p1.is_equal (expected_image))

	end


	test_symetriser_verticalement
	note
		testing:  "covers/{POINT}.symetriser_verticalement"
	local
		p1 : POINT
		point_line : POINT
		p1_image : POINT
		expected_image : POINT
	do
		create p1.make (12, 3)
		create point_line.make (-1, 1)
		create expected_image.make (-14, 3)
		p1.symmetrize_vertically (point_line)
		assert("L'image de (12,3) par la symetrie axiale passant par (-1,1) est (-14, 3)",
				p1.is_equal (expected_image))

	end

	test_symetriser_premiere_diagonale
	note
		testing:  "covers/{POINT}.symetriser_premiere_diagonale"
	local
		p1 : POINT
		point_line : POINT
		p1_image : POINT
		expected_image : POINT
	do
		create p1.make (5, 2)
		create point_line.make (2, 1)
		create expected_image.make (3, 4)
		p1.symmetrize_first_diagonal (point_line)
		assert("L'image de (5,2) par la symetrie axiale passant par (2,1) est (3, 4)",
				p1.is_equal (expected_image))

	end

	--symetriser_deuxieme_diagonale
	test_symetriser_deuxieme_diagonale
	note
		testing:  "covers/{POINT}.symetriser_deuxieme_diagonale"
	local
		p1 : POINT
		point_line : POINT
		p1_image : POINT
		expected_image : POINT
	do
		create p1.make (3, 2)
		create point_line.make (2, 1)
		create expected_image.make (1, 0)
		p1.symmetrize_second_diagonal (point_line)
		assert("L'image de (3,2) par la symetrie axiale passant par (2,1) est (1, 0)",
				p1.is_equal (expected_image))

	end

	test_is_symmetrized_horizontally_of_true_case
	note
		testing:  "covers/{POINT}.is_symmetrized_horizontally_of"
	local
		current_point : POINT
		other_point : POINT
		point_of_axe : POINT
	do
		create current_point.make (6, 1)
		create other_point.make (6, 3)
		create point_of_axe.make (3, 2)
		assert("(6,1) est l'image par symetrie axiale horizontale passant par (3,2) de (6,3)",
				current_point.is_symmetrized_horizontally_of (point_of_axe, other_point))

	end

	test_is_symmetrized_horizontally_of_wrong_case
	note
		testing:  "covers/{POINT}.is_symmetrized_horizontally_of"
	local
		current_point : POINT
		other_point : POINT
		point_of_axe : POINT
	do
		create current_point.make (6, 1)
		create other_point.make (7, 2)
		create point_of_axe.make (3, 2)
		assert("(6,1) n'est pas l'image par symetrie axiale horizontale passant par (3,2) de (7,2)",
				not current_point.is_symmetrized_horizontally_of (point_of_axe, other_point))

	end


	test_is_symmetrized_vertically_of_true_case
	note
		testing:  "covers/{POINT}.is_symmetrized_vertically_of"
	local
		current_point : POINT
		other_point : POINT
		point_of_axe : POINT
	do
		create current_point.make (6, 1)
		create other_point.make (2, 1)
		create point_of_axe.make (4, -1)
		assert("(6,1) est l'image par symetrie axiale verticale passant par (4,-1) de (2,1)",
				current_point.is_symmetrized_vertically_of (point_of_axe, other_point))

	end

	test_is_symmetrized_vertically_of_wrong_case
	note
		testing:  "covers/{POINT}.is_symmetrized_vertically_of"
	local
		current_point : POINT
		other_point : POINT
		point_of_axe : POINT
	do
		create current_point.make (6, 1)
		create other_point.make (2, 1)
		create point_of_axe.make (3, -1)
		assert("(6,1) n'est pas l'image par symetrie axiale verticale passant par (3,-1) de (2,1)",
				not current_point.is_symmetrized_vertically_of (point_of_axe, other_point))

	end

	test_is_symmetrized_first_diagonal_of_true_case
	note
		testing:  "covers/{POINT}.is_symmetrized_first_diagonal_of"
	local
		current_point : POINT
		other_point : POINT
		point_of_axe : POINT
	do
		create current_point.make (6, 4)
		create other_point.make (3, 7)
		create point_of_axe.make (2, 3)
		assert("(6,4) est l'image par symetrie axiale parall�le � la premi�re diagonale passant par (2,3) de (3,7)",
				current_point.is_symmetrized_first_diagonal_of (point_of_axe, other_point))

	end

	test_is_symmetrized_first_diagonal_of_wrong_case
	note
		testing:  "covers/{POINT}.is_symmetrized_first_diagonal_of"
	local
		current_point : POINT
		other_point : POINT
		point_of_axe : POINT
	do
		create current_point.make (6, 4)
		create other_point.make (7, 8)
		create point_of_axe.make (2, 3)
		assert("(6,4) n'est pas l'image par symetrie axiale parall�le � la premi�re diagonale passant par (2,3) de (7,8)",
				not current_point.is_symmetrized_first_diagonal_of (point_of_axe, other_point))

	end

	test_is_symmetrized_second_diagonal_of_true_case
	note
		testing:  "covers/{POINT}.is_symmetrized_second_diagonal_of"
	local
		current_point : POINT
		other_point : POINT
		point_of_axe : POINT
	do
		create current_point.make (-3, 5)
		create other_point.make (-6, 2)
		create point_of_axe.make (-2, 1)
		assert("(-3,5) est l'image par symetrie axiale parall�le � la deuxi�me diagonale passant par (-2,1) de (-6,2)",
				current_point.is_symmetrized_second_diagonal_of (point_of_axe, other_point))

	end

	test_is_symmetrized_second_diagonal_of_wrong_case
	note
		testing:  "covers/{POINT}.is_symmetrized_second_diagonal_of"
	local
		current_point : POINT
		other_point : POINT
		point_of_axe : POINT
	do
		create current_point.make (-3, 5)
		create other_point.make (1, 8)
		create point_of_axe.make (-2, 1)
		assert("(-3,5) est l'image par symetrie axiale parall�le � la deuxi�me diagonale passant par (-2,1) de (1,8)",
				not current_point.is_symmetrized_second_diagonal_of (point_of_axe, other_point))

	end

end


