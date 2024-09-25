/// Abstract parent for soup reagents.
/// These are the majority result from soup recipes,
/// but bear in mind it will(should) have other reagents along side it.
/datum/reagent/consumable/nutriment/soup
	name = "Soup"
	chemical_flags = NONE
	nutriment_factor = 12 // Slightly less to that of nutriment as soups will come with nutriments in tow

// Satsuma Black
/datum/reagent/consumable/nutriment/soup/satsuma_black
	name = "Satsuma Black Soup"
	description = "A rich, heavy seafood and noodle soup from Mars, employing squid ink to give a strong taste of the sea."
	data = list("seafood" = 1, "tofu" = 1, "noodles" = 1)
	color = "#171221"

/datum/reagent/consumable/nutriment/soup/dashi
	name = "Dashi"
	description = "Made with kombu and katsuobushi, this mother stock forms the basis for a large number of Japanese dishes."
	data = list("umami" = 1)
	color = "#D49D26"

/datum/reagent/consumable/nutriment/soup/shoyu_ramen
	name = "Shōyu Ramen"
	description = "A soy-sauce based ramen, with noodles, fishcake, barbecued meat and a boiled egg."
	data = list("egg" = 1, "fish" = 1, "noodles" = 1, "meat" = 1, "broth" = 1)
	color = "#442621"

/datum/reagent/consumable/nutriment/soup/miso
	name = "Miso Soup"
	description = "The universes best soup! Yum!!!"
	data = list("miso" = 1)
	color = "#E2BD12"
