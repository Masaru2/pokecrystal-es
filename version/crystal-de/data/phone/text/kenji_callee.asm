INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/kenji_callee", ROMX

KenjiAnswerPhoneText::
	text "Ich, @"
	text_ram wStringBuffer3
	text "…"

	para "<PLAYER>! Schöner"
	line "Morgen, oder?"
	done

KenjiAnswerPhoneDayText::
	text "Ich, @"
	text_ram wStringBuffer3
	text "…"

	para "<PLAYER>! Schönes"
	line "Wetter, oder?"
	done

KenjiAnswerPhoneNiteText::
	text "Ich, @"
	text_ram wStringBuffer3
	text "…"

	para "<PLAYER>! Schöner"
	line "Mondschein, oder?"
	done

KenjiGreetText::
	text "Heh, <PLAYER>!"
	line "@"
	text_ram wStringBuffer3
	text ", hallo!"
	done

KenjiGreetDayText::
	text "Heh, <PLAYER>!"
	line "@"
	text_ram wStringBuffer3
	text ", hallo!"
	done

KenjiGreetNiteText::
	text "Heh, <PLAYER>!"
	line "@"
	text_ram wStringBuffer3
	text ", hallo!"
	done
