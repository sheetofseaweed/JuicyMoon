/obj/item/reagent_containers/food/snacks/soup/satsuma_black
	name = "Satsuma Black Soup"
	icon = 'modular__juicy/icons/obj/items/food/soup.dmi'
	desc = "A rich, heavy seafood and noodle soup from Mars, employing squid ink to give a strong taste of the sea."
	icon_state = "satsuma_black"
	// bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 11) - незнаю что сюда добавлять
	list_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/soup/satsuma_black = 30)
	tastes = list("seafood" = 1, "tofu" = 1, "noodles" = 1)
	trash = /obj/item/reagent_containers/glass/bowl
	filling_color = "#161513"
	foodtype = SEAFOOD | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/soup/shoyu_ramen
	name = "shōyu ramen"
	desc = "A soy-sauce based ramen, with noodles, fishcake, barbecued meat and a boiled egg."
	icon = 'modular__juicy/icons/obj/items/food/soup.dmi'
	icon_state = "shoyu_ramen"
	list_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/soup/shoyu_ramen = 30)
	tastes = list("egg" = 1, "fish" = 1, "noodles" = 1, "meat" = 1, "broth" = 1)
	filling_color = "#7a5816"
	foodtype = MEAT | GRAIN | VEGETABLES | SEAFOOD

/obj/item/reagent_containers/food/snacks/soup/secret_noodle_soup
	name = "secret Noodle Soup"
	desc = "Made to a secret family recipe (that's in several cookbooks). What is the secret ingredient, you ask? Well, let's just say it could be anything..."
	icon = 'modular__juicy/icons/obj/items/food/soup.dmi'
	icon_state = "secret_noodle_soup"
	list_reagents = list(
		/datum/reagent/consumable/nutriment/soup/secret_noodle_soup = 30,
		/datum/reagent/consumable/nutriment/protein = 6)
	tastes = list("noodles" = 1, "chicken" = 1, "aromatic broth" = 1)
	trash = /obj/item/reagent_containers/glass/bowl
	color = "#D9BB79"
	foodtype = MEAT | VEGETABLES | GRAIN

/obj/item/reagent_containers/food/snacks/soup/new_osaka_sunrise
	name = "new Osaka Sunrise Soup"
	desc = "A bright, flavourful miso soup with tofu that commonly forms part of a traditional Martian breakfast, at least in the capital."
	icon = 'modular__juicy/icons/obj/items/food/soup.dmi'
	icon_state = "new_osaka_sunrise"
	tastes = list("miso" = 1, "tofu" = 1, "onion" = 1, "eggplant" = 1)
	list_reagents = list(
		/datum/reagent/consumable/nutriment/soup/new_osaka_sunrise = 30,
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/nutriment/protein = 2)
	trash = /obj/item/reagent_containers/glass/bowl
	color = "#EAB26E"
	foodtype = VEGETABLES | BREAKFAST

/obj/item/reagent_containers/food/snacks/soup/miso
	name = "Miso Soup"
	desc = "The universes best soup! Yum!!!"
	icon = 'modular__juicy/icons/obj/items/food/soup.dmi'
	icon_state = "misosoup"
	tastes = list("miso" = 1)
	list_reagents = list(
		/datum/reagent/consumable/nutriment/soup/miso = 30,
		/datum/reagent/water = 10)
	trash = /obj/item/reagent_containers/glass/bowl
	color = "#EAB26E"
	foodtype = VEGETABLES | BREAKFAST


