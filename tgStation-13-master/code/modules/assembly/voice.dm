/obj/item/device/assembly/voice
	name = "voice analyzer"
	desc = "A small electronic device able to record a voice sample, and send a signal when that sample is repeated."
	icon_state = "voice"
	m_amt = 500
	g_amt = 50
	origin_tech = "magnets=1"
	flags = HEAR
	var/listening = 0
	var/recorded	//the activation message

/obj/item/device/assembly/voice/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq)
	if(listening)
		recorded = raw_message
		listening = 0
		say("Activation message is '[recorded]'.")
	else
		if(findtext(raw_message, recorded))
			pulse(0)

/obj/item/device/assembly/voice/activate()
	if(secured)
		if(!holder)
			listening = !listening
			say("[listening ? "Now" : "No longer"] recording input.")

/obj/machinery/vending/say_quote(text)
	return "beeps, \"[text]\""

/obj/item/device/assembly/voice/attack_self(mob/user)
	if(!user)	return 0
	activate()
	return 1


/obj/item/device/assembly/voice/toggle_secure()
	. = ..()
	listening = 0
