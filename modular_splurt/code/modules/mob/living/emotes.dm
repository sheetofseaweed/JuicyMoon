//Main code edits
/datum/emote/living/audio_emote/laugh/run_emote(mob/user, params)
	. = ..()

	// Check parent return
	if(!.)
		return

	// Define carbon user
	var/mob/living/carbon/carbon_user = user

	// Check if carbon user exists
	if(!istype(carbon_user))
		return

	// Check for subraces
	if(ishumanbasic(carbon_user) || iscatperson(carbon_user) || isinsect(carbon_user) || isjellyperson(carbon_user))
		return

	// Define default laugh type
	// Defaults to male
	var/laugh_sound = 'sound/voice/human/manlaugh1.ogg'

	// Check gender
	switch(user.gender)
		// Female
		if(FEMALE)
			// Set laugh sound
			laugh_sound = 'sound/voice/human/womanlaugh.ogg'

		/*
		 * Please add more gendered laughs
		 *
		// Male
		if(MALE)
			// Set laugh sound
			laugh_sound = 'sound/voice/human/laugh_male.ogg'

		// Non-binary
		if(PLURAL)
			// Set laugh sound
			laugh_sound = 'sound/voice/human/laugh_nonbinary.ogg'

		// Object
		if(NEUTER)
			// Set laugh sound
			laugh_sound = 'sound/voice/human/laugh_object.ogg'
		*/

		// Other
		else
			// Set laugh sound
			laugh_sound = pick('sound/voice/human/manlaugh1.ogg', 'sound/voice/human/manlaugh2.ogg')

	// Play laugh sound
	playsound(carbon_user, laugh_sound, 50, 1)

// Living variant
/datum/emote/living/audio
	// List of mob types that can run emote
	mob_type_allowed_typecache = list(/mob/living)

	// Default type
	// Can be EMOTE_AUDIBLE, EMOTE_VISIBLE, EMOTE_BOTH, or EMOTE_OMNI
	emote_type = EMOTE_AUDIBLE

	// Placeholder variables
	// These should NOT appear in-game
	message = "makes an indescribable noise"
	var/emote_sound = 'sound/arcade/Boom.ogg'

	// Default time before using another audio emote
	emote_cooldown = 1 SECONDS

	// Default volume of the emote
	var/emote_volume = 50

	// Default range modifier
	var/emote_range = -1
	var/emote_distance_multiplier = SOUND_DEFAULT_DISTANCE_MULTIPLIER
	var/emote_distance_multiplier_min_range = SOUND_DEFAULT_MULTIPLIER_EFFECT_RANGE

	// Default pitch variance
	var/emote_pitch_variance = 1

	// Default audio falloff settings
	var/emote_falloff_exponent = SOUND_FALLOFF_EXPONENT
	var/emote_falloff_distance = SOUND_DEFAULT_FALLOFF_DISTANCE

	// Default frequency
	var/emote_frequency = null

	// Default channel
	var/emote_channel = 0

	// Should the emote consider atmospheric pressure?
	var/emote_check_pressure = TRUE

	// Should the emote ignore walls?
	var/emote_ignore_walls = FALSE

	// Default wet and dry settings (???)
	var/emote_wetness = -10000
	var/emote_dryness = 0

// Check if audio emote can run
/datum/emote/living/audio/can_run_emote(mob/living/user, status_check)
	. = ..()

	// Check parent return
	if(!.)
		return FALSE

	// Allow use
	return TRUE

// Run audio emote
/datum/emote/living/audio/run_emote(mob/user, params)
	. = ..()

	// Check parent return
	if(!.)
		return

	// Check if user is miming
	if(user?.mind?.miming)
		// Do nothing
		return

	if(user?.is_muzzled() && !muzzle_ignore)
		return

	// Play sound
	// Accepts all possible parameters
	playsound(user.loc, emote_sound, emote_volume, emote_pitch_variance, emote_range, emote_falloff_exponent, emote_frequency, emote_channel, emote_check_pressure, emote_ignore_walls, emote_falloff_distance, emote_wetness, emote_dryness, emote_distance_multiplier, emote_distance_multiplier_min_range)

/datum/emote/living/surrender/run_emote(mob/user, params, type_override, intentional)
	// Set message with pronouns
	message = "puts [user.p_their()] hands on [user.p_their()] head and falls to the ground, [user.p_they()] surrender[user.p_s()]!"

	// Return normally
	. = ..()

// SPLURT emotes
/datum/emote/living/tilt
	key = "tilt"
	key_third_person = "tilts"
	message = "tilts their head."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/squint
	key = "squint"
	key_third_person = "squints"
	message = "squints their eyes." // i dumb
	emote_type = EMOTE_VISIBLE

/datum/emote/living/ruffle
	key = "ruffle"
	key_third_person = "ruffles"
	message = "ruffles their wings for a moment."

/datum/emote/living/audio/cackle
	key = "cackle"
	key_third_person = "cackles"
	message = "cackles hysterically!"
	message_mime = "cackles silently!"
	emote_sound = 'modular_splurt/sound/voice/cackle_yeen.ogg'
	emote_cooldown = 5 SECONDS

/datum/emote/living/audio/chirp
	key = "chirp"
	key_third_person = "chirps"
	message = "chirps!"
	message_mime = "chirps silently!"
	emote_sound = 'modular_splurt/sound/voice/chirp.ogg'

/datum/emote/living/audio/caw
	key = "caw"
	key_third_person = "caws"
	message = "caws!"
	message_mime = "caws silently!"
	emote_sound = 'modular_splurt/sound/voice/caw.ogg'

/datum/emote/living/audio/bleat
	key = "bleat"
	key_third_person = "bleats"
	message = "bleats loudly!"
	message_mime = "bleats silently!"
	emote_sound = 'modular_splurt/sound/voice/bleat.ogg'
	emote_cooldown = 3 SECONDS

/*
SPLURT теперь обрабатывают все это дело в /mob/living/proc/moan() -> весь код снизу теперь не имеет смысла.

/datum/emote/living/carbon/moan/run_emote(mob/user, params, type_override, intentional) //I can't not port this shit, come on.
	if(user.stat != CONSCIOUS)
		return
	var/sound
	var/miming = user.mind ? user.mind.miming : 0
	if(!user.is_muzzled() && !miming)
		sound = pick('modular_splurt/sound/voice/moan_m1.ogg', 'modular_splurt/sound/voice/moan_m2.ogg', 'modular_splurt/sound/voice/moan_m3.ogg')
		if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
			sound = pick('modular_splurt/sound/voice/moan_f1.ogg', 'modular_splurt/sound/voice/moan_f2.ogg', 'modular_splurt/sound/voice/moan_f3.ogg', 'modular_splurt/sound/voice/moan_f4.ogg', 'modular_splurt/sound/voice/moan_f5.ogg', 'modular_splurt/sound/voice/moan_f6.ogg', 'modular_splurt/sound/voice/moan_f7.ogg')
		if(isalien(user))
			sound = 'sound/voice/hiss6.ogg'
		playlewdinteractionsound(user.loc, sound, 50, 1, 4, 1.2)
		message = "moans!"
	else if(miming)
		message = "acts out a moan."
	else
		message = "makes a very loud noise."
	. = ..()
*/

/datum/emote/living/audio/chitter2
	key = "chitter2"
	key_third_person = "chitters2"
	message = "chitters."
	message_mime = "chitters silently!"
	emote_sound = 'modular_splurt/sound/voice/moth/mothchitter2.ogg'

/datum/emote/living/audio/blink2
	key = "blink2"
	key_third_person = "blinks2"
	message = "blinks."
	message_mime = "blinks expressively."
	emote_sound = 'modular_splurt/sound/voice/blink.ogg'
	emote_cooldown = 0

/datum/emote/living/audio/wtune
	key = "whistletune"
	key_third_person = "whistletunes"
	message = "насвистывает мелодию."
	message_mime = "делает вид, что насвистывает что-то ртом."
	emote_sound = 'modular_splurt/sound/voice/wtune1.ogg'
	emote_cooldown = 6 SECONDS // Uses longest sound's time.

/datum/emote/living/audio/wtune/run_emote(mob/user, params)
	// Set random emote sound
	emote_sound = pick('modular_splurt/sound/voice/wtune1.ogg', 'modular_splurt/sound/voice/wtune2.ogg')

	// Return normally
	. = ..()

/datum/emote/living/audio/fiufiu
	key = "wolfwhistle"
	key_third_person = "wolfwhistles"
	message = "wolf-whistles!" // i am not creative
	message_param = "audibly approves %t's appearance."
	message_mime = "makes an expression as if <i>inappropriately</i> whistling."
	emote_sound = 'modular_splurt/sound/voice/wolfwhistle.ogg'
	emote_cooldown = 3 SECONDS

/datum/emote/living/audio/weh2
	key = "weh2"
	key_third_person = "wehs2"
	message = "let out a weh!"
	message_mime = "acts out a weh!"
	emote_sound = 'modular_splurt/sound/voice/weh2.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/weh3
	key = "weh3"
	key_third_person = "wehs3"
	message = "let out a weh!"
	message_mime = "acts out a weh!"
	emote_sound = 'modular_splurt/sound/voice/weh3.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/weh4
	key = "weh4"
	key_third_person = "wehs4"
	message = "let out a surprised weh!"
	message_mime = "acts out a surprised weh!"
	emote_sound = 'modular_splurt/sound/voice/weh_s.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/waa
	key = "waa"
	key_third_person = "waas"
	message = "let out a waa!"
	message_mime = "acts out a waa!"
	emote_sound = 'modular_splurt/sound/voice/waa.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/living/audio/bark2
	key = "bark2"
	key_third_person = "barks2"
	message = "barks!"
	message_mime = "acts out a bark!"
	emote_sound = 'modular_splurt/sound/voice/bark_alt.ogg'

/datum/emote/living/audio/yap
	key = "yap"
	key_third_person = "yaps"
	message = "yaps!"
	message_mime = "acts out a yap!"
	emote_sound = 'modular_splurt/sound/voice/yap.ogg'

/datum/emote/living/audio/yip
	key = "yip"
	key_third_person = "yips"
	message = "yips!"
	message_mime = "acts out a yip!"
	emote_sound = 'modular_splurt/sound/voice/yip.ogg'

/datum/emote/living/audio/bork
	key = "bork"
	key_third_person = "borks"
	message = "borks!"
	message_mime = "acts out a bork!"
	emote_sound = 'modular_splurt/sound/voice/bork.ogg'

/datum/emote/living/audio/woof
	key = "woof"
	key_third_person = "woofs"
	message = "woofs!"
	message_mime = "acts out a woof!"
	emote_sound = 'modular_splurt/sound/voice/woof.ogg'

/datum/emote/living/audio/woof/alt
	key = "woof2"
	key_third_person = "woofs2"
	emote_sound = 'modular_splurt/sound/voice/woof2.ogg'

/datum/emote/living/audio/howl
	key = "howl"
	key_third_person = "howls"
	message = "howls!"
	message_mime = "acts out a howl!"
	emote_sound = 'modular_splurt/sound/voice/wolfhowl.ogg'
	emote_cooldown = 5 SECONDS
	emote_volume = 100
	emote_range = MEDIUM_RANGE_SOUND_EXTRARANGE
	emote_falloff_exponent = 1
	emote_distance_multiplier_min_range = 12

/datum/emote/living/audio/howl/run_emote(mob/user, params)
	if (HAS_TRAIT(user, TRAIT_AWOO))
		var/mob/living/carbon/M = user
		var/datum/quirk/awoo/quirk_target = locate() in M.roundstart_quirks
		quirk_target.last_awoo = world.time
		quirk_target.chance = quirk_target.default_chance
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "to_awoo", /datum/mood_event/to_awoo)
	. = ..()

/datum/emote/living/mlem
	key = "mlem"
	key_third_person = "mlems"
	message = "sticks their tongue for a moment. Mlem!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/pant
	key = "pant"
	key_third_person = "pants"
	message = "pants!"

/datum/emote/living/pant/run_emote(mob/user, params, type_override, intentional)
	var/list/pants = list(
		"pants!",
		"pants like a dog.",
		"lets out soft pants.",
		"pulls [user.p_their()] tongue out, panting."
	)
	message = pick(pants)
	. = ..()

/datum/emote/living/audio/yippee
	key = "yippee"
	key_third_person = "yippees"
	message = "lets out a yippee!"
	message_mime = "acts out a yippee!"
	emote_sound = 'modular_splurt/sound/voice/yippee.ogg'
	emote_cooldown = 10 SECONDS

/datum/emote/living/audio/mewo
	key = "mewo"
	key_third_person = "mewos"
	message = "mewos!"
	message_mime = "mewos silently!"
	emote_sound = 'modular_splurt/sound/voice/mewo.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/ara_ara
	key = "ara"
	key_third_person = "aras"
	message = "coos with sultry surprise~..."
	message_mime = "exudes a sultry aura~"
	emote_sound = 'modular_splurt/sound/voice/ara-ara.ogg'
	emote_cooldown = 5 SECONDS

/datum/emote/living/audio/ara_ara/alt
	key = "ara2"
	emote_sound = 'modular_splurt/sound/voice/ara-ara2.ogg'
	emote_cooldown = 5 SECONDS

/datum/emote/living/audio/facemetacarpus
	key = "facehand" // Facepalm was taken
	key_third_person = "facepalms"
	// Message is generated from metacarpus_type below. You shouldn't see this!
	message = "creates an error in the code." // Hear a slapping sound
	muzzle_ignore = TRUE // Not a spoken emote
	restraint_check = TRUE // Uses your hands
	emote_sound = 'modular_splurt/sound/effects/slap.ogg'
	// Defines appendage type for generated message
	var/metacarpus_type = "palm" // Default to hands
	emote_cooldown = 0

/datum/emote/living/audio/facemetacarpus/run_emote(mob/user, params)
	// Randomly pick a message using metacarpus_type for hand
	message = pick(list(
			"places [usr.p_their()] [metacarpus_type] across [usr.p_their()] face.",
			"lowers [usr.p_their()] face into [usr.p_their()] [metacarpus_type].",
			"face[metacarpus_type]s",
		))

	// Return normally
	. = ..()

/datum/emote/living/audio/facemetacarpus/paw
	key = "facepaw" // For furries
	key_third_person = "facepaws"
	metacarpus_type = "paw"

/datum/emote/living/audio/facemetacarpus/claw
	key = "faceclaw" // For scalies and avians
	key_third_person = "faceclaws"
	metacarpus_type = "claw"

/datum/emote/living/audio/facemetacarpus/wing
	key = "facewing" // For avians, harpies or just anyone with wings
	key_third_person = "facewings"
	metacarpus_type = "wing"

/datum/emote/living/audio/facemetacarpus/hoof
	key = "facehoof" // For horse enthusiasts
	key_third_person = "facehoofs"
	metacarpus_type = "hoof"

/datum/emote/living/audio/poyo
	key = "poyo"
	key_third_person = "poyos"
	message = "%SAYS, \"Poyo!\""
	message_mime = "acts out an excited motion!"
	emote_sound = 'modular_splurt/sound/voice/barks/poyo.ogg'
	// No cooldown var required

/datum/emote/living/audio/poyo/run_emote(mob/user, params)
	var/datum/dna/D = user.has_dna()
	var/say_mod = (D ? D.species.say_mod : "says")
	message = replacetextEx(message, "%SAYS", say_mod)

	// Return normally
	. = ..()

/datum/emote/living/audio/merowr
	key = "merowr"
	key_third_person = "merowrs"
	message = "merowrs!"
	message_mime = "acts out a merowr!"
	emote_sound = 'modular_splurt/sound/voice/merowr.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/hoot
	key = "hoot"
	key_third_person = "hoots"
	message = "hoots!"
	message_mime = "acts out a hoot!"
	emote_sound = 'modular_splurt/sound/voice/hoot.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/wurble
	key = "wurble"
	key_third_person = "wurbles"
	message = "wurbles!"
	message_mime = "acts out a wurbling!"
	emote_sound = 'modular_splurt/sound/voice/wurble.ogg'
	emote_cooldown = 4 SECONDS

/datum/emote/living/audio/warble
	key = "warble"
	key_third_person = "warbles"
	message = "warbles!"
	message_mime = "acts out a warbling!"
	emote_sound = 'modular_splurt/sound/voice/warble.ogg'

// At the moment of adding it I just realized there's Tesh test-merge going on, so I've added numeral in case if that gets merged in the long run.
/datum/emote/living/audio/trill2
	key = "trill2"
	key_third_person = "trills2"
	message = "trills!"
	message_mime = "acts out a trilling!"
	emote_sound = 'modular_splurt/sound/voice/trill.ogg'

/datum/emote/living/audio/rattlesnek
	key = "rattle"
	key_third_person = "rattles"
	message = "rattles!"
	message_mime = "acts like a rattling snake."
	emote_sound = 'modular_splurt/sound/voice/rattle.ogg'
	emote_cooldown = 5 SECONDS

/datum/emote/living/audio/rpurr
	key = "rpurr"
	key_third_person = "rpurrs"
	message = "purrs like raptor!"
	message_mime = "acts like a purring raptor."
	emote_sound = 'modular_splurt/sound/voice/raptor_purr.ogg'
	emote_cooldown = 2 SECONDS

/datum/emote/living/audio/bawk
	key = "bawk"
	key_third_person = "bawks"
	message = "bawks!"
	message_mime = "acts like a bawking chicken."
	emote_sound = 'modular_splurt/sound/voice/bawk.ogg'

/datum/emote/living/audio/moo
	key = "moo"
	key_third_person = "moos"
	message = "мычит!"
	message_mime = "пытается замычать словно корова!"
	emote_sound = 'modular_splurt/sound/voice/moo.ogg'
	emote_cooldown = 3 SECONDS

/datum/emote/living/audio/coo
	key = "coo"
	key_third_person = "coos"
	message = "coos."
	message_mime = "acts like a cooing pidgeon."
	emote_volume = 30
	emote_sound = 'modular_splurt/sound/voice/coo.ogg'
	emote_cooldown = 0.78 SECONDS

/datum/emote/living/audio/buzzer_correct
	key = "correct"
	key_third_person = "corrects"
	message = "thinks someone is correct."
	message_param = "thinks %t is correct."
	emote_sound = 'modular_splurt/sound/voice/buzzer_correct.ogg'
	emote_cooldown = 0.84 SECONDS

/datum/emote/living/audio/buzzer_incorrect
	key = "incorrect"
	key_third_person = "incorrects"
	message = "thinks someone is incorrect."
	message_param = "thinks %t is incorrect."
	emote_sound = 'modular_splurt/sound/voice/buzzer_incorrect.ogg'
	emote_cooldown = 1.21 SECONDS

/datum/emote/living/audio/ace/
	key = "objection0"
	key_third_person = "objects0"
	message = "<b><i>\<\< OBJECTION!! \>\></i></b>"
	message_param = "<b><i>\<\< %t \>\></i></b>" // Allows for custom objections, but alas only in lowercase.
	message_mime = "points their finger with determination!"
	emote_sound = 'modular_splurt/sound/voice/ace/ace_objection_generic.ogg'
	emote_cooldown = 6.0 SECONDS // This is regardless of sound's length.
	emote_volume = 30

/datum/emote/living/audio/ace/objection
	key = "objection"
	key_third_person = "objects"
	emote_sound = 'modular_splurt/sound/voice/ace/ace_objection_m1.ogg'
	emote_pitch_variance = FALSE // IT BREAKS THESE SOMEHOW

/datum/emote/living/audio/ace/objection/run_emote(mob/user, params)
	switch(user.gender)
		if(MALE)
			emote_sound = pick('modular_splurt/sound/voice/ace/ace_objection_m1.ogg', 'modular_splurt/sound/voice/ace/ace_objection_m2.ogg', 'modular_splurt/sound/voice/ace/ace_objection_m3.ogg')
		if(FEMALE)
			emote_sound = pick('modular_splurt/sound/voice/ace/ace_objection_f1.ogg', 'modular_splurt/sound/voice/ace/ace_objection_f2.ogg')
		else // Both because I am lazy.
			emote_sound = pick('modular_splurt/sound/voice/ace/ace_objection_m1.ogg', 'modular_splurt/sound/voice/ace/ace_objection_m2.ogg', 'modular_splurt/sound/voice/ace/ace_objection_m3.ogg', 'modular_splurt/sound/voice/ace/ace_objection_f1.ogg', 'modular_splurt/sound/voice/ace/ace_objection_f2.ogg')
	. = ..()

/datum/emote/living/audio/ace/hold_it
	key = "holdit"
	key_third_person = "holdsit"
	message = "<b><i>\<\< HOLD IT!! \>\></i></b>"
	emote_sound = 'modular_splurt/sound/voice/ace/ace_holdit_m1.ogg'
	emote_pitch_variance = FALSE // IT BREAKS THESE SOMEHOW

/datum/emote/living/audio/ace/hold_it/run_emote(mob/user, params)
	switch(user.gender)
		if(MALE)
			emote_sound = pick('modular_splurt/sound/voice/ace/ace_holdit_m1.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_m2.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_m3.ogg')
		if(FEMALE)
			emote_sound = pick('modular_splurt/sound/voice/ace/ace_holdit_f1.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_f2.ogg')
		else // Both because I am lazy.
			emote_sound = pick('modular_splurt/sound/voice/ace/ace_holdit_m1.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_m2.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_m3.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_f1.ogg', 'modular_splurt/sound/voice/ace/ace_holdit_f2.ogg')
	. = ..()

/datum/emote/living/audio/ace/take_that
	key = "takethat"
	key_third_person = "takesthat"
	message = "<b><i>\<\< TAKE THAT!! \>\></i></b>"
	emote_sound = 'modular_splurt/sound/voice/ace/ace_takethat_m1.ogg'
	emote_pitch_variance = FALSE // IT BREAKS THESE SOMEHOW

/datum/emote/living/audio/ace/take_that/run_emote(mob/user, params)
	switch(user.gender)
		if(MALE)
			emote_sound = pick('modular_splurt/sound/voice/ace/ace_takethat_m1.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_m2.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_m3.ogg')
		if(FEMALE)
			emote_sound = pick('modular_splurt/sound/voice/ace/ace_takethat_f1.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_f2.ogg')
		else // Both because I am lazy.
			emote_sound = pick('modular_splurt/sound/voice/ace/ace_takethat_m1.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_m2.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_m3.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_f1.ogg', 'modular_splurt/sound/voice/ace/ace_takethat_f2.ogg')
	. = ..()

/datum/emote/living/audio/realize
	key = "realize"
	key_third_person = "realizes"
	message = "realizes something."
	emote_sound = 'modular_splurt/sound/voice/ace/ace_realize.ogg'
	emote_cooldown = 1.19 SECONDS

/datum/emote/living/audio/smirk2
	key = "smirk2"
	key_third_person = "smirks2"
	message = "<i>smirks</i>."
	emote_sound = 'modular_splurt/sound/voice/ace/ace_wubs.ogg'
	emote_cooldown = 0.84 SECONDS

/datum/emote/living/audio/meow
	key = "meow"
	key_third_person = "mrowls"
	message = "mrowls!"
	emote_sound = 'modular_citadel/sound/voice/meow1.ogg'
	emote_cooldown = 0.6 SECONDS
	emote_pitch_variance = FALSE

/datum/emote/living/audio/meow2
	key = "meow2"
	key_third_person = "meows"
	message = "meows!"
	emote_sound = 'modular_splurt/sound/voice/catpeople/cat_meow1.ogg'
	emote_cooldown = 0.25 // the longest audio is 1 second but who gives a fuck mrrp mrrp meow
	emote_pitch_variance = FALSE // why would you

/datum/emote/living/audio/meow2/run_emote(mob/user, params)
	emote_sound = pick('modular_splurt/sound/voice/catpeople/cat_meow1.ogg', 'modular_splurt/sound/voice/catpeople/cat_meow2.ogg', 'modular_splurt/sound/voice/catpeople/cat_meow3.ogg') // Credit to Nyanotrasen (https://github.com/Nyanotrasen/Nyanotrasen)
	. = ..()

/datum/emote/living/audio/meow3
	key = "meow3"
	key_third_person = "mews!"
	message = "mews!"
	emote_sound = 'modular_splurt/sound/voice/catpeople/cat_mew1.ogg'
	emote_cooldown = 0.25 // mrrp mrrp meow
	emote_pitch_variance = FALSE

/datum/emote/living/audio/meow3/run_emote(mob/user, params)
	emote_sound = pick('modular_splurt/sound/voice/catpeople/cat_mew1.ogg', 'modular_splurt/sound/voice/catpeople/cat_mew2.ogg') // Credit to Nyanotrasen (https://github.com/Nyanotrasen/Nyanotrasen)
	. = ..()

/datum/emote/living/audio/meow4
	key = "meow4"
	key_third_person = "meows"
	message = "meows!"
	emote_sound = 'modular_citadel/sound/voice/meow1.ogg'
	emote_cooldown = 0.25 // the longest audio is 1 second but who gives a fuck mrrp mrrp meow
	emote_pitch_variance = FALSE // why would you

/datum/emote/living/audio/mrowl
	key = "mrowl"
	key_third_person = "mrowls"
	message = "mrowls."
	emote_sound = 'modular_splurt/sound/voice/mrowl.ogg'
	emote_cooldown = 0.95 SECONDS
	emote_pitch_variance = FALSE

// BLUEMOON CHANGE START divide mrrp by 2 emotes
/datum/emote/living/audio/mrrp
	key = "mrrp"
	key_third_person = "mrrps"
	message = "trills like a cat!"
	emote_sound = 'modular_splurt/sound/voice/catpeople/cat_mrrp1.ogg'
	emote_cooldown = 0.25 // mrrp mrrp meow
	emote_pitch_variance = FALSE

/datum/emote/living/audio/mrrp2
	key = "mrrp2"
	key_third_person = "mrrps"
	message = "trills like a cat!"
	emote_sound = 'modular_splurt/sound/voice/catpeople/cat_mrrp2.ogg'
	emote_cooldown = 0.25 // mrrp mrrp meow
	emote_pitch_variance = FALSE
//BLUEMOON CHANGE END mrrp mrrp meow
