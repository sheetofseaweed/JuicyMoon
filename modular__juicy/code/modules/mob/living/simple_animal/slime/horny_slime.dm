/mob/living/simple_animal/slime/proc/eatSlot(mob/living/M, slot)
	var/obj/item/W = M.get_item_by_slot(slot)
	if(W)
		qdel(W)
		playsound(loc, "sound/effects/blobattack.ogg", 40, 1, -1)
		visible_message("<span class='danger'>\The [src]</b> разъедает одежду \the [M]!</span>", \
				"<span class='userdanger'>\The [src]</b> разъедает одежду \the [M]!</span>", null, COMBAT_MESSAGE_RANGE)
		return TRUE
	return FALSE
