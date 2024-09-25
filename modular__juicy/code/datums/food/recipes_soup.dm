// see code/module/crafting/table.dm

////////////////////////////////////////////////SOUP////////////////////////////////////////////////

/datum/crafting_recipe/food/satsuma_black
	name = "Satsuma Black"
	reqs = list(
		/datum/reagent/consumable/nutriment/soup/dashi = 20,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/tofu = 1,
		/obj/item/reagent_containers/food/snacks/spaghetti/boilednoodles = 1,
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
		/obj/item/reagent_containers/food/snacks/spaghetti/boilednoodles = 1,
		// /obj/item/reagent_containers/food/snacks/kamaboko_slice = 1, нету
		/obj/item/reagent_containers/food/snacks/meat/cutlet = 1,
		/obj/item/reagent_containers/food/snacks/boiledegg = 1
	)
	result = /obj/item/reagent_containers/food/snacks/soup/shoyu_ramen
	subcategory = CAT_SOUP

/datum/crafting_recipe/food/secret_noodle_soup
	name = "secret noodle soup"
	reqs = list(
		/datum/reagent/consumable/nutriment/soup/dashi = 30,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/meat/cutlet/chicken = 1,
		/obj/item/reagent_containers/food/snacks/spaghetti/boilednoodles = 1,
		/obj/item/reagent_containers/food/snacks/grown/mushroom/chanterelle = 1
	)
	result = /obj/item/reagent_containers/food/snacks/soup/secret_noodle_soup
	subcategory = CAT_SOUP

/datum/crafting_recipe/food/new_osaka_sunrise
	name = "new Osaka Sunrise Soup"
	reqs = list(
		/datum/reagent/consumable/nutriment/soup/miso = 15,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/grown/herbs = 1,
		/obj/item/reagent_containers/food/snacks/grown/eggplant = 1,
		/obj/item/reagent_containers/food/snacks/onion_slice = 1,
		/obj/item/reagent_containers/food/snacks/tofu = 1
	)
	result = /obj/item/reagent_containers/food/snacks/soup/new_osaka_sunrise
	subcategory = CAT_SOUP

// Miso soup
/datum/crafting_recipe/food/miso
	name = "Miso Soup"
	reqs = list(
		/datum/reagent/water = 50,
		/obj/item/reagent_containers/food/snacks/soydope = 2,
		/obj/item/reagent_containers/food/snacks/tofu = 2
	)
	result = /obj/item/reagent_containers/food/snacks/soup/miso
	subcategory = CAT_SOUP
