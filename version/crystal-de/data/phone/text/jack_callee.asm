INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/jack_callee", ROMX

JackAnswerPhoneText::
	text "Hallo. Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Guten Morgen,"
	line "<PLAY_G>!"
	done

JackAnswerPhoneDayText::
	text "Hallo. Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Wie geht's"
	line "<PLAY_G>?"
	done

JackAnswerPhoneNiteText::
	text "Hallo. Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Guten Abend,"
	line "<PLAY_G>!"
	done

JackGreetText::
	text "<PLAY_G>,"
	line "guten Morgen!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Wie geht es dir?"
	done

JackGreetDayText::
	text "<PLAY_G>, Tach!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Ist es heute"
	cont "nicht schön?"
	done

JackGreetNiteText::
	text "<PLAY_G>,"
	line "guten Abend!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Hast du Zeit?"
	done

JackGenericText::
	text "Wie geht es deinen"
	line "#MON?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist so neugierig."

	para "Das ist ein Pro-"
	line "blem. Es ist"
	cont "ein wenig wie ich…"
	done
