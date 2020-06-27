INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/joey_callee", ROMX

JoeyAnswerPhoneText::
	text_ram wStringBuffer3
	text ", hallo!"

	para "Oh, <PLAYER>?"
	line "Geht es dir gut?"
	done

JoeyAnswerPhoneDayText::
	text_ram wStringBuffer3
	text ", hallo!"

	para "Oh, <PLAYER>?"
	line "Geht es dir gut?"
	done

JoeyAnswerPhoneNiteText::
	text_ram wStringBuffer3
	text ", hallo!"

	para "Oh, <PLAYER>?"
	line "Geht es dir gut?"
	done

JoeyGreetText::
	text "Yo, <PLAYER>!"
	line "Wie geht es dir?"

	para "Ich, @"
	text_ram wStringBuffer3
	text ","
	line "hast du Zeit?"
	done

JoeyGreetDayText::
	text "Yo, <PLAYER>!"
	line "Wie steht's?"

	para "@"
	text_ram wStringBuffer3
	text ", hallo!"
	line "Hast du Zeit?"
	done

JoeyGreetNiteText::
	text "Yo, <PLAYER>!"
	line "Wie geht es dir?"

	para "@"
	text_ram wStringBuffer3
	text ", hallo,"
	line "hast du Zeit?"
	done

JoeyGenericText::
	text "Wie geht es deinen"
	line "#MON?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist nicht zu hal-"
	cont "ten, wie immer."

	para "Es ist mein Ein"
	line "und Alles. Ich"

	para "werde mit ihm ein"
	line "toller Trainer"
	cont "sein!"
	done
