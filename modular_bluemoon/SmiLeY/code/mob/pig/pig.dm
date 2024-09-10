/mob/living/simple_animal/pet/dog/corgi/pig
	name = "Pig"
	real_name = "Pig"
	desc = "A pig."
	icon = 'icons/mob/animal.dmi'
	icon_state = "pig"
	icon_living = "pig"
	icon_dead = "pig_dead"
	speak = list("Oink!")
	speak_emote = list("oinks")
	emote_hear = list("oinks.")
	emote_see = list("oinks.")
	speak_chance = 5
	turns_per_move = 1
	see_in_dark = 3
	maxHealth = 50
	health = 50
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/pig = 6)
	density = TRUE
	mob_size = MOB_SIZE_LARGE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	gold_core_spawnable = FRIENDLY_SPAWN
	held_icon = "pig"
	faction = list("neutral")

/mob/living/simple_animal/pet/dog/corgi/pig/update_corgi_fluff()
	name = real_name
	desc = initial(desc)
	speak = list("Oink!")
	speak_emote = list("oinks")
	emote_hear = list("oinks.")
	emote_see = list("oinks.")
	set_light(0)

	if(inventory_head?.dog_fashion)
		var/datum/dog_fashion/DF = new inventory_head.dog_fashion(src)
		DF.apply(src)

	if(inventory_back?.dog_fashion)
		var/datum/dog_fashion/DF = new inventory_back.dog_fashion(src)
		DF.apply(src)

/obj/item/reagent_containers/food/snacks/meat/slab/pig
	name = "Сало"
	icon_state = "salo"
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/plain/pig
	slice_path = /obj/item/reagent_containers/food/snacks/meat/rawcutlet/plain/salo
	tastes = list("pig meat" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/rawcutlet/plain/salo
	name = "Кусочек Сала"
	icon_state = "salo_slice"
