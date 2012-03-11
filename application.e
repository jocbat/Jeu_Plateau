note
	description : "JeuConsole application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
      			--case : CASE
      			--liste_finie : FIXED_LIST[PERSONNAGE]
      			--mon_perso : PERSONNAGE
      			--motif : MOTIF[DEPLACEABLE]
      		--	test : TEST
      			test2 : TEST2
      			test2_2 : TEST2
      			test3 : TEST3
      			liste_reels : LINKED_LIST[REAL]
      			emplacement : EMPLACEMENT_MOTIF
      			o1 : ANY
      			o2 : ANY
      			point : POINT
      			centre : POINT



		do
			--my_result := other
			--create centre.make (0,7)
			--print(Void = centre.center_point_rotation90 (centre))
			--create test3.make
			--create test2_2.make
			--test2 := test3

			--test2.do_something (test2_2)
			--print(test3.z)
			--create test
			--test.setx (12)
			--test.sety (263)
		--	print("nb éléments de l'objet test ")
			--print("objet egaux?")

			--print("14 modulo 2 ")
			--print(14 \\ 2)
			--print(" ")

			--create point.make (1, 4)
			--print(point.abscisse)
			--print(" ")
			--print(point.ordonnee)


			--create centre.make (0, 0)
			--point.rotation_90 (centre)
			--point.rotation_90 (centre)
			--point.rotation_90 (centre)
			--point.rotation_90 (centre)
			--print("rotation de 360° par rapport à 0 ")
			--print("Nouvelles coordonnées : ")
			--print(point.abscisse)
			--print(" ")
			--print(point.ordonnee)

			--create liste_reels.make
			--create test.make
			--create test2.make
			--create test3.make
			--print(test.count)
			--test.setx (12)
			--test.setx (56)
			--print("test2 = test3 ?")
			--print(test2.is_equal (test3))
			--o1 := test
			--o2 := test2
			--print(o1.same_type (o2))
 
			--print(o1.is_equal (o2))
			--print("valeur x de test : ")
			--print(test.x)
			--print("nombre d'element de test avant ajout : ")



			--print("ajout de test à test... : ")
			--test.extend (test)

			--print(test.count)
			--print("nombre d'element de test apres ajout : ")
			--print("")
			--print(test.count)
			--print("sdgfg")
			--| Add your code here
		--	print ("Creation d'un personnage%N")
		--	create perso
		--	perso.setage (27)

--			print ("Creation d'une arme%N")
--			create weapon
--
--			print ("Ajout d'une arme au personnage cree%N")
--			perso.setweapon(weapon)
--			print ("Ajout de points de vie au personnage%N")
--			perso.setlife (112)

			--create mon_perso
			--mon_perso.setlife (120)
			--mon_perso.setage (28)

			--create liste_finie.make (13)
			--print(liste_finie.count)
			--liste_finie.extend (mon_perso)
			--print(liste_finie.first.age)
			--liste_finie.array_put (mon_perso,0)
			--print(liste_finie.is_empty)

		--	create  case.make("Sable");


		--	create mon_perso
		--	mon_perso.setlife (120)
		--	mon_perso.setage (28)
		--	case.poser (mon_perso)

		--	print("La nature de la case est : " + case.nature)
		--	print("Le personnage sur la case est : ")
		--	print(case.personnage_pose.age)
		--	print(" ")
		--	print(case.personnage_pose.life)

		print("youhou")
		end


		other : ANY

end
