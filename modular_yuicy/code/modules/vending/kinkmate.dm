/obj/machinery/vending/kink/Initialize()
	var/list/extra_products = list(
		/obj/item/restraints/handcuffs/cable/silk_ribbon/red = 5,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/yellow = 5,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/blue = 5,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/green = 5,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/pink = 5,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/orange = 5,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/cyan = 5,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/white = 5,
		/obj/item/restraints/handcuffs/cable/rope = 5,
		/obj/item/restraints/handcuffs/cable/belts/black = 5,
		/obj/item/restraints/handcuffs/cable/belts/brown = 5,
		/obj/item/restraints/handcuffs/cable/belts/red = 5,

	)
	var/list/extra_contraband = list()
	var/list/extra_premium = list()

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
