/obj/item/reagent_containers/food/snacks/salad/yakisoba_katsu
	name = "yakisoba katsu"
	desc = "Breaded and deep fried meat on a bed of fried noodles. Delicious, if unconventional."
	icon = 'modular__juicy/icons/obj/items/food/salad.dmi'
	icon_state = "yakisoba_katsu"
	list_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/nutriment = 8
	)
	tastes = list("fried noodles" = 1, "meat" = 1, "breadcrumbs" = 1, "veggies" = 1)
	foodtypes = MEAT | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL
