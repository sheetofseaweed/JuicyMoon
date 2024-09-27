/datum/bank_account/resort
	var/is_resort_account = TRUE

/datum/bank_account/resort/payday(amount_of_paychecks, free = FALSE)
	if(is_resort_account)
		if(amount_of_paychecks == 1)
			return FALSE

	. = ..()
