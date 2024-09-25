// Boiled Noodles
/datum/crafting_recipe/food/boilednoodles
	name = "cooked noodles"
	reqs = list(
		/datum/reagent/water/salt = 10,
		/datum/reagent/consumable/sodiumchloride = 2,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/spaghetti/rawnoodles = 1
	)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/boilednoodles
	category = CAT_SPAGHETTI

/datum/crafting_recipe/food/rice_dough
	name = "Rice dough"
	reqs = list(
		/datum/reagent/consumable/flour = 10,
		/datum/reagent/consumable/rice = 10,
		/datum/reagent/water = 10
	)
	result = /obj/item/reagent_containers/food/snacks/rice_dough
	category = CAT_FOOD
