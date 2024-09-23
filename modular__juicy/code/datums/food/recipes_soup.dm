// see code/module/crafting/table.dm

////////////////////////////////////////////////SOUP////////////////////////////////////////////////

/datum/crafting_recipe/food/satsuma_black
	name = "Satsuma Black"
	reqs = list(
		/datum/reagent/consumable/nutriment/soup/dashi = 20,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/tofu = 1,
		/obj/item/reagent_containers/food/snacks/boiledspaghetti = 1,
		/obj/item/reagent_containers/food/snacks/sea_weed = 1
		// /obj/item/reagent_containers/food/snacks/canned/squid_ink = 1 = Это банка с чем-то
	)
	result = /obj/item/reagent_containers/food/snacks/soup/satsuma_black
	subcategory = CAT_SOUP

/datum/crafting_recipe/food/homemade_dashi
	reqs = list(
		/datum/reagent/water = 10,
		/datum/reagent/consumable/bonito = 20,
		/obj/item/reagent_containers/food/snacks/sea_weed = 1
		// /obj/item/reagent_containers/food/snacks/canned/squid_ink = 1 = Это банка с чем-то
	)
	result = /datum/reagent/consumable/nutriment/soup/dashi
	category = CAT_SOUP

/datum/crafting_recipe/food/shoyu_ramen
	name = "shōyu ramen"
	reqs = list(
		/datum/reagent/consumable/nutriment/soup/dashi = 20,
		// /datum/reagent/consumable/nutriment/soup/teriyaki = 15, - нету...
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/boilednoodles = 1,
		// /obj/item/reagent_containers/food/snacks/kamaboko_slice = 1, нету
		/obj/item/reagent_containers/food/snacks/meat/cutlet = 1,
		/obj/item/reagent_containers/food/snacks/boiledegg = 1
	)
	result = /obj/item/reagent_containers/food/snacks/soup/shoyu_ramen
	subcategory = CAT_SOUP









/datum/chemical_reaction/food/soup/shoyu_ramen
	required_reagents = list(

	)
	required_ingredients = list(

	)
	results = list(
		/datum/reagent/consumable/nutriment/soup/shoyu_ramen = 30,
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/nutriment/protein = 8,
	)
	percentage_of_nutriment_converted = 0.2







////////////////////////////////////////////////GRINDER////////////////////////////////////////////////
/datum/crafting_recipe
	var/list/machinery
	var/list/steps
	var/non_craftable

/datum/crafting_recipe/food/grinder
	machinery = list(/obj/machinery/reagentgrinder)
	steps = list("Put into grinder and grind")
	category = CAT_MISCFOOD
	non_craftable = TRUE

/datum/crafting_recipe/food/grinder/bonito
	reqs = list(/obj/item/reagent_containers/food/snacks/dried_fish = 1)
	result = /datum/reagent/consumable/bonito
