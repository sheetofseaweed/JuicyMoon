/datum/bank_account/resort
	var/is_resort_account = TRUE

/datum/bank_account/resort/payday(amount_of_paychecks, free = FALSE, starting_money_amount = 800) //It's all hacky as hell, but whatever, we ball.

	if(is_resort_account)
		if(!account_job)
			return
		if(amount_of_paychecks == 1)
			return FALSE
		var/money_to_transfer = starting_money_amount
		adjust_money(money_to_transfer, "Nanotrasen: Shift Payment")
		SSblackbox.record_feedback("amount", "free_income", money_to_transfer)
		SSeconomy.station_target += money_to_transfer
		log_econ("[money_to_transfer] кредит[get_num_string(money_to_transfer)] внесено на аккаунт [src.account_holder] из личных сбережений.")
		return TRUE
	. = ..()
