// Boiled Noodles
/obj/item/reagent_containers/food/snacks/spaghetti/boilednoodles
	name = "cooked noodles"
	desc = "Cooked fresh to order."
	icon = 'modular__juicy/icons/obj/items/food/martian.dmi'
	icon_state = "cooked_noodles"
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 3
	)
	tastes = list("rice" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/spaghetti/rawnoodles
	name = "fresh noodles"
	desc = "Rice noodles, made fresh. Remember, there is no secret ingredient."
	icon = 'modular__juicy/icons/obj/items/food/martian.dmi'
	icon_state = "raw_noodles"
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 3
	)
	tastes = list("rice" = 1)
	foodtype = GRAIN

// Rice Dough
/obj/item/reagent_containers/food/snacks/rice_dough
	name = "rice dough"
	desc = "A piece of dough made with equal parts rice flour and wheat flour, for a unique flavour."
	icon = 'modular__juicy/icons/obj/items/food/martian.dmi'
	icon_state = "rice_dough"
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 6
	)
	tastes = list("rice" = 1)
	foodtype = GRAIN



// /obj/item/food/rice_dough/make_bakeable()
// 	AddComponent(/datum/component/bakeable, /obj/item/food/bread/reispan, rand(30 SECONDS, 45 SECONDS), TRUE, TRUE)

// /obj/item/food/rice_dough/make_processable()
// 	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/spaghetti/rawnoodles, 6, 3 SECONDS, table_required = TRUE)

// /obj/item/reagent_containers/food/snacks/dough
// 	name = "dough"
// 	desc = "A piece of dough."
// 	icon = 'icons/obj/food/food_ingredients.dmi'
// 	icon_state = "dough"
// 	cooked_type = /obj/item/reagent_containers/food/snacks/store/bread/plain
// 	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
// 	w_class = WEIGHT_CLASS_NORMAL
// 	tastes = list("dough" = 1)
// 	foodtype = GRAIN


// // Dough + rolling pin = flat dough
// /obj/item/reagent_containers/food/snacks/dough/attackby(obj/item/I, mob/user, params)
// 	if(istype(I, /obj/item/kitchen/rollingpin))
// 		if(isturf(loc))
// 			new /obj/item/reagent_containers/food/snacks/flatdough(loc)
// 			to_chat(user, "<span class='notice'>You flatten [src].</span>")
// 			qdel(src)
// 		else
// 			to_chat(user, "<span class='warning'>You need to put [src] on a surface to roll it out!</span>")
// 	else
// 		..()

// /obj/item/reagent_containers/food/snacks/flatdough/attackby(obj/item/I, mob/user, params)
// 	if(istype(I, /obj/item/kitchen/unrollingpin))
// 		if(isturf(loc))
// 			new /obj/item/reagent_containers/food/snacks/dough(loc)
// 			to_chat(user, "<span class='notice'>You unflatten [src].</span>")
// 			qdel(src)
// 		else
// 			to_chat(user, "<span class='warning'>You need to put [src] on a surface to undo the rolling!</span>")
// 	else
// 		..()
