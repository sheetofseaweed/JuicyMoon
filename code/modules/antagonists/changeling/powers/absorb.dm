/datum/action/changeling/absorbDNA
	name = "Absorb DNA material"
	desc = "Absorb the DNA material of our victim. Requires us to grab them."
	button_icon_state = "absorb_dna"
	dna_cost = 0
	req_human = TRUE
	//Hornyfied by Gardelin0

/datum/action/changeling/absorbDNA/can_sting(mob/living/carbon/user)
	if(!..())
		return

	var/datum/antagonist/changeling/changeling = user.mind.has_antag_datum(/datum/antagonist/changeling)
	if(changeling.isabsorbing)
		to_chat(user, "<span class='warning'>We are already absorbing!</span>")
		return

	if(!user.pulling || !iscarbon(user.pulling))
		to_chat(user, "<span class='warning'>We must be grabbing a creature to absorb them!</span>")
		return
	if(user.grab_state <= GRAB_PASSIVE)
		to_chat(user, "<span class='warning'>We must have a tighter grip to absorb this creature!</span>")
		return

	var/mob/living/carbon/target = user.pulling
	return changeling.can_absorb_dna(target)



/datum/action/changeling/absorbDNA/sting_action(mob/user)
	var/datum/antagonist/changeling/changeling = user.mind.has_antag_datum(/datum/antagonist/changeling)
	var/mob/living/carbon/human/target = user.pulling
	changeling.isabsorbing = 1
	for(var/i in 1 to 3)
		switch(i)
			if(1)
				to_chat(user, "<span class='notice'>This creature is compatible. We must hold still...</span>")
			if(2)
				user.visible_message("<span class='warning'>[user] extends a proboscis with a horny intent!</span>", "<span class='notice'>We extend a proboscis with a horny intent. We must feed!</span>")
			if(3)
				if(target.has_penis())
					user.visible_message("<span class='danger'>[user] обволакивает член [target] с помощью хоботка!</span>", "<span class='notice'> Мы обволакиваем член [target] с помощью хоботка.</span>")
				if(target.has_vagina())
					user.visible_message("<span class='danger'>[user] вторгается в промежность [target] с помощью хоботка!</span>", "<span class='notice'> Мы вторгаемся в промежность [target] с помощью хоботка.</span>")
				to_chat(target, "<span class='userdanger'> Вы чувствуете резкую волну удовольствия!</span>")
				target.emote("moan")

		SSblackbox.record_feedback("nested tally", "changeling_powers", 1, list("Absorb DNA", "[i]"))
		if(!do_mob(user, target, 50))
			to_chat(user, "<span class='warning'>Our absorption of [target]'s DNA material has been interrupted!</span>")
			changeling.isabsorbing = 0
			return

	SSblackbox.record_feedback("nested tally", "changeling_powers", 1, list("Absorb DNA", "4"))
	user.visible_message("<span class='danger'>[user] sucks the fluids from [target]'s genitals!</span>", "<span class='notice'>We have absorbed [target]'s DNA material.</span>")
	to_chat(target, "<span class='userdanger'>Your DNA material is absorbed by the changeling!</span>")

	if(!changeling.has_dna(target.dna))
		changeling.add_new_profile(target)
		changeling.trueabsorbs++

	if(user.nutrition < NUTRITION_LEVEL_WELL_FED)
		user.adjust_nutrition(target.nutrition, NUTRITION_LEVEL_WELL_FED)
	if(get_thirst(user) < THIRST_LEVEL_QUENCHED)
		user.adjust_thirst(target.thirst, THIRST_LEVEL_QUENCHED)

	// Absorb a lizard, speak Draconic.
	user.copy_languages(target, LANGUAGE_ABSORB)

	if(target.mind && user.mind)//if the victim and user have minds
//ambition start
		to_chat(user, "<i>[target.mind.show_memory()]</i>") //I can read your mind, kekeke. Output all their notes.
//ambition end

		//Some of target's recent speech, so the changeling can attempt to imitate them better.
		//Recent as opposed to all because rounds tend to have a LOT of text.
		var/list/recent_speech = list()

		var/list/say_log = target.logging[LOG_SAY]

		if(LAZYLEN(say_log) > LING_ABSORB_RECENT_SPEECH)
			recent_speech = say_log.Copy(say_log.len-LING_ABSORB_RECENT_SPEECH+1,0) //0 so len-LING_ARS+1 to end of list
		else
			for(var/spoken_memory in say_log)
				if(recent_speech.len >= LING_ABSORB_RECENT_SPEECH)
					break
				recent_speech[spoken_memory] = say_log[spoken_memory]

		if(recent_speech.len)
			changeling.antag_memory += "<B>Some of [target]'s speech patterns, we should study these to better impersonate [target.ru_na()]!</B><br>"
			to_chat(user, "<span class='boldnotice'>Some of [target]'s speech patterns, we should study these to better impersonate [target.ru_na()]!</span>")
			for(var/spoken_memory in recent_speech)
				changeling.antag_memory += "\"[recent_speech[spoken_memory]]\"<br>"
				to_chat(user, "<span class='notice'>\"[recent_speech[spoken_memory]]\"</span>")
			changeling.antag_memory += "<B>We have no more knowledge of [target]'s speech patterns.</B><br>"
			to_chat(user, "<span class='boldnotice'>We have no more knowledge of [target]'s speech patterns.</span>")


		var/datum/antagonist/changeling/target_ling = target.mind.has_antag_datum(/datum/antagonist/changeling)
		if(target_ling && !target_ling.hostile_absorbed)//If the target was a changeling, suck out their extra juice and objective points!
			to_chat(user, "<span class='boldnotice'>[target] was one of us. We have absorbed their power.</span>")
			target_ling.remove_changeling_powers()
			changeling.geneticpoints += round(target_ling.geneticpoints/2)
			changeling.maxgeneticpoints += round(target_ling.geneticpoints/2)
			target_ling.geneticpoints = 0
			target_ling.can_respec = 0
			changeling.chem_storage += round(target_ling.chem_storage/2)
			changeling.chem_charges += min(target_ling.chem_charges, changeling.chem_storage)
			target_ling.chem_charges = 0
			target_ling.hostile_absorbed = TRUE
			target_ling.chem_storage = 0
			changeling.absorbedcount += (target_ling.absorbedcount)
			target_ling.stored_profiles.len = 1
			target_ling.absorbedcount = 0


	changeling.chem_charges=min(changeling.chem_charges+10, changeling.chem_storage)

	changeling.isabsorbing = 0
	changeling.can_respec = 1

	target.cum()
	return TRUE
