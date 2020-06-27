INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/brent_callee", ROMX

BrentAnswerPhoneText::
	text "Ja? @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>. Was"
	line "kann ich für"
	cont "dich tun?"
	done

BrentAnswerPhoneDayText::
	text "Ja? @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>. Was"
	line "kann ich für"
	cont "dich tun?"
	done

BrentAnswerPhoneNiteText::
	text "Ja? @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAYER>. Was"
	line "kann ich für"
	cont "dich tun?"
	done

BrentGreetText::
	text "Hiya, <PLAYER>."
	line "Wie geht es dir?"

	para "Heh! Ich bin's,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

BrentGreetDayText::
	text "Hiya, <PLAYER>,"
	line "wie geht es dir?"

	para "Heh, ich bin's,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

BrentGreetNiteText::
	text "Hiya, <PLAYER>,"
	line "wie geht es dir?"

	para "Heh, ich bin's,"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

BrentGenericText::
	text "Oh ja, ich sah"
	line "dich neulich aus"

	para "einem #MON-"
	line "CENTER kommen."

	para "Du lässt deine"
	line "#MON regelmäßig"

	para "heilen, oder? Ich"
	line "bin beeindruckt."

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist so stark, dass"

	para "es nicht oft in"
	line "ein #MON-CENTER"
	cont "muss. Heheh!"
	done
