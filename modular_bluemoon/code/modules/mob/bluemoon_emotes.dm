/datum/emote/living/audio/growl
	key = "growl"
	key_third_person = "growl"
	message = "growl!"
	message_mime = "growl."
	emote_sound = 'sound/voice/growl.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/wurble
	key = "wurble"
	key_third_person = "wurble"
	message = "wurble!"
	message_mime = "wurble."
	emote_sound = 'sound/voice/wurble.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/warble
	key = "warble"
	key_third_person = "warbles"
	message = "warble!"
	message_mime = "warble."
	emote_sound = 'sound/voice/warbles.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/trills
	key = "trills"
	key_third_person = "trills"
	message = "trills!"
	message_mime = "trills."
	emote_sound = 'sound/voice/trills.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/woof
	key = "woof"
	key_third_person = "woofs"
	message = "lets out a woof."
	message_mime = "lets out a woof."
	emote_sound = 'sound/voice/woof.ogg'

/datum/emote/living/audio/anyo
	key = "anyo"
	key_third_person = "anyo"
	message = "lets out a <b>anyo!</b>"
	message_mime = null
	emote_sound = 'sound/voice/anyo.ogg'
	emote_cooldown = 3 SECONDS

/datum/emote/living/real_agony
	key = "realagony"
	key_third_person = "realagony"
	message = "кричит в агонии!"
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 5 SECONDS

/datum/emote/living/real_agony/run_emote(mob/living/user, params) //I can't not port this shit, come on.
	if(user.stat != CONSCIOUS)
		return
	var/sound
	var/miming = user.mind ? user.mind.miming : 0
	if(iscarbon(user))
		var/mob/living/carbon/c = user
		c.reindex_screams()
	if(!user.is_muzzled() && !miming)
		if(issilicon(user))
			sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(iscyborg(user))
				var/mob/living/silicon/robot/S = user
				if(S.cell?.charge < 20)
					to_chat(S, "<span class='warning'>Модуль крика деактивирован. Пожалуйста, перезарядитесь.</span>")
					return
				S.cell.use(200)
		if(ismonkey(user))
			sound = 'modular_citadel/sound/voice/scream_monkey.ogg'
		if(istype(user, /mob/living/simple_animal/hostile/gorilla))
			sound = 'sound/creatures/gorilla.ogg'
		if(ishuman(user))
			user.adjustOxyLoss(10)
			if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
				sound = pick('modular_bluemoon/smiley/sounds/emotes/agony_male_1.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_2.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_3.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_4.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_5.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_6.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_7.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_8.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_male_9.ogg')
			if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
				sound = pick('modular_bluemoon/smiley/sounds/emotes/agony_female_1.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_female_2.ogg',\
						'modular_bluemoon/smiley/sounds/emotes/agony_female_3.ogg')
			if(is_species(user, /datum/species/android) || is_species(user, /datum/species/synth) || is_species(user, /datum/species/ipc))
				sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(is_species(user, /datum/species/skeleton))
				sound = 'modular_citadel/sound/voice/scream_skeleton.ogg'
			if (is_species(user, /datum/species/fly) || is_species(user, /datum/species/insect))
				sound = 'modular_citadel/sound/voice/scream_moth.ogg'
			if(is_species(user, /datum/species/mammal/vox))
				sound = 'modular_bluemoon/kovac_shitcode/sound/species/voxscream.ogg'
		if(isalien(user))
			sound = 'sound/voice/hiss6.ogg'
		LAZYINITLIST(user.alternate_screams)
		if(LAZYLEN(user.alternate_screams))
			sound = pick(user.alternate_screams)
		playsound(user.loc, sound, 75, 1, 4, 1.2)
		message = "кричит в агонии!"
	else if(miming)
		message = "изображает крик агонии."
	else
		message = "издает крайне громкий звук."
	. = ..()

/datum/emote/living/audio/rawr2
	key = "rawr2"
	key_third_person = "rawr2"
	message = "издаёт звук - <b>RAWR!</b>"
	message_mime = "строит грозную мину!"
	emote_sound = 'sound/voice/rawr2.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/living/audio/affirmative
	key = "affirmative"
	key_third_person = "affirmative"
	message = "испускает <b>утвердительный</b> сигнал"
	message_mime = "быстро кивает"
	emote_sound = 'sound/machines/synth_yes.ogg'
	emote_cooldown = 1 SECONDS

/datum/emote/living/audio/negative
	key = "negative"
	key_third_person = "negative"
	message = "испускает <b>отрицательный</b> сигнал"
	message_mime = "быстро мотает головой"
	emote_sound = 'sound/machines/synth_no.ogg'
	emote_cooldown = 1 SECONDS

