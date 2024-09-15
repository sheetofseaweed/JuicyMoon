/obj/structure/tentacle_lair/moving_tentacle
	gender = PLURAL
	name = "moving tentacles"
	desc = "A cluster of living moving tentacles."
	anchored = TRUE
	density = FALSE
	layer = MID_TURF_LAYER
	plane = FLOOR_PLANE
	icon = 'modular__juicy/icons/obj/tentacle_lair/tentacle_floor_decals.dmi'
	icon_state = "moving_1"
	max_integrity = 50

/obj/structure/tentacle_lair/moving_tentacle/Initialize()
	. = ..()
	icon_state = pick("moving_1", "moving_2", "moving_3", "moving_4")

/obj/structure/tentacle_lair/moving_tentacle/Crossed(AM as mob|obj)
	var/mob/living/carbon/C = AM
	if(isturf(src.loc))
		if(isliving(AM))
			if(C.client && C.client?.prefs.mobsexpref == "Yes")
				if(prob(33))
					if(tearSlot(C, ITEM_SLOT_FEET))
						visible_message("<span class='danger'>\The [src]</b> хватают \the [C] за ноги, стягивая обувь!</span>", \
										"<span class='userdanger'>\The [src]</b> хватают \the [C] за ноги, стягивая обувь!</span>", null, COMBAT_MESSAGE_RANGE)
						return

				else if(prob(15))
					C.Knockdown(50)
					C.Stun(50)
					visible_message("<span class='danger'>\The [src]</b> сбивают \the [C] с ног!</span>", \
									"<span class='userdanger'>\The [src]</b> сбивают \the [C] с ног!</span>", null, COMBAT_MESSAGE_RANGE)

					tearSlot(C, ITEM_SLOT_OCLOTHING)
					tearSlot(C, ITEM_SLOT_ICLOTHING)
					tearSlot(C, ITEM_SLOT_SHIRT)
					tearSlot(C, ITEM_SLOT_UNDERWEAR)
					visible_message("<span class='danger'>\The [src]</b> сдирают одежду с \the [C]!</span>", \
									"<span class='userdanger'>\The [src]</b> сдирают одежду \the [C]!</span>", null, COMBAT_MESSAGE_RANGE)
					return

				while(C.lying && prob(10))
					if(activate_after(src, rand(5,15)))
						C.Knockdown(50)
						C.Stun(50)
						visible_message("<span class='danger'>\The [src]</b> удерживают \the [C], не давая встать!</span>", \
							"<span class='userdanger'>\The [src]</b> удерживают \the [C], не давая встать!</span>", null, COMBAT_MESSAGE_RANGE)


	..()

/obj/structure/tentacle_lair/moving_tentacle/proc/tearSlot(mob/living/M, slot)
	var/obj/item/W = M.get_item_by_slot(slot)
	if(W)
		M.dropItemToGround(W)
		playsound(loc, "sound/items/poster_ripped.ogg", 30, 1, -1)
		return TRUE
	return FALSE
