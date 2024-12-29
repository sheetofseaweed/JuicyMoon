/obj/structure/snow
	name = "snow"
	desc = "It's just a pile of snow..."
	icon = 'modular_yuicy/icons/turf/snow.dmi'
	icon_state = "snow"
	anchored = TRUE
	density = FALSE
	var/health = 50
	layer = LOW_OBJ_LAYER

/obj/structure/snow/Initialize(mapload)
	. = ..()
	check_overlay()
	for(var/obj/structure/snow/O in range(1, src))
		O.check_overlay()

/obj/structure/snow/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/shovel))
		visible_message("<span class='notice'>[user] starts digging \the [src] with \the [W].</span>")
		if(W.use_tool(src, user, 30, volume = 50))
			for(var/i = 0 to 4)
				new /obj/item/toy/snowball(get_turf(src))
			health -= 5
			health_check()
	return

/obj/structure/snow/attack_hand(mob/user)
	visible_message("<span class='notice'>[user] starts digging \the [src] by his hand.</span>")
	if(do_after(user, 10, target = src))
		new /obj/item/toy/snowball(get_turf(src))
		health -= 2
		health_check()
	return

/obj/structure/snow/proc/health_check()
	if(health <= 0)
		visible_message("<span class='notice'>[src] is cleared.</span>")
		for(var/obj/structure/snow/O in range(1, src))
			O.check_overlay()
		qdel(src)

/obj/structure/snow/proc/check_overlay()
	cut_overlays()
	for(var/direction_to_check in list(1, 2, 4, 8))
		var/turf/T = get_step(src, direction_to_check)
		if(!isspaceturf(T) && !iswallturf(T) && !locate(/obj/structure/snow, T))
			var/image/snow_side = image('modular_yuicy/icons/turf/snow.dmi', "[direction_to_check]")
			snow_side.layer = LOW_OBJ_LAYER
			switch(direction_to_check)
				if(NORTH)
					snow_side.pixel_y += 32
				if(SOUTH)
					snow_side.pixel_y += -32
				if(EAST)
					snow_side.pixel_x += 32
				if(WEST)
					snow_side.pixel_x += -32
			add_overlay(snow_side)
