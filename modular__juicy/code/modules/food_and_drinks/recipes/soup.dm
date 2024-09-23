/obj/item/reagent_containers/food/snacks/soup/satsuma_black
	name = "Satsuma Black Soup"
	icon = 'modular__juicy/icons/obj/items/food/soup.dmi'
	desc = "A rich, heavy seafood and noodle soup from Mars, employing squid ink to give a strong taste of the sea."
	icon_state = "satsuma_black"
	// bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 11) - незнаю что сюда добавлять
	list_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/soup/satsuma_black = 30)
	tastes = list("seafood" = 1, "tofu" = 1, "noodles" = 1)
	trash = /obj/item/reagent_containers/glass/bowl
	filling_color = "#161513"
	foodtype = SEAFOOD | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/soup/shoyu_ramen
	name = "shōyu ramen"
	icon = 'modular__juicy/icons/obj/items/food/soup.dmi'
	icon_state = "shoyu_ramen"
	foodtype = MEAT | GRAIN | VEGETABLES | SEAFOOD
	list_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/soup/shoyu_ramen = 30)
	tastes = list("egg" = 1, "fish" = 1, "noodles" = 1, "meat" = 1, "broth" = 1)
	trash = /obj/item/reagent_containers/glass/bowl
	filling_color = "#7a5816"
