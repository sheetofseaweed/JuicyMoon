/datum/reagent/consumable/nutriment/liquid_burger
	name = "Liquid Burger"
	description = "All the vitamins, minerals, and carbohydrates the body needs in pure form."
	reagent_state = LIQUID
	nutriment_factor = 25 * REAGENTS_METABOLISM
	color = "#4463a7"

/datum/chemical_reaction/liquid_burger
	name = "Liquid Burger"
	id = /datum/reagent/consumable/nutriment/liquid_burger
	results = list(/datum/reagent/consumable/nutriment/liquid_burger = 5)
	required_reagents = list(/datum/reagent/medicine/synthflesh = 1, /datum/reagent/consumable/space_cola = 1)
	mix_message = "Смесь бурно реагирует, оставляя после себя огромную кучу микро-мини-нано бургеров."

/datum/chemical_reaction/solid_burger
	name = "Solid Burger"
	id = "solid_burger"
	required_reagents = list(/datum/reagent/consumable/nutriment/liquid_burger = 10)
	required_temp = 450
	mix_message = "Смесь бурно реагирует, оставляя после себя огромный сочный бургер."

/datum/chemical_reaction/solid_burger/on_reaction(datum/reagents/holder, multiplier)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to multiplier)
		var/list/burgers = subtypesof(/obj/item/reagent_containers/food/snacks/burger)
		playsound(location, 'sound/effects/phasein.ogg', 100, 1)
		var/random_burger = pick(burgers)
		new random_burger(location)
