INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/chad_callee", ROMX

ChadAnswerPhoneText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAY_G>!"
	line "Guten Morgen!"
	done

ChadAnswerPhoneDayText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAY_G>,"
	line "guten Tag!"
	done

ChadAnswerPhoneNiteText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAY_G>,"
	line "guten Abend!"
	done

ChadGreetText::
	text "Hi, <PLAY_G>,"
	line "guten Morgen!"

	para "@"
	text_ram wStringBuffer3
	text " hier."
	line "Wie geht es dir?"
	done

ChadGreetDayText::
	text "Hi, <PLAY_G>,"
	line "guten Tag!"

	para "@"
	text_ram wStringBuffer3
	text " hier."
	line "Wie geht es dir?"
	done

ChadGreetNiteText::
	text "Hi, <PLAY_G>,"
	line "guten Abend!"

	para "@"
	text_ram wStringBuffer3
	text " hier."
	line "Wie geht es dir?"
	done

ChadGenericText::
	text "Wie geht es deinen"
	line "#MON?"

	para "Du kennst PROF."
	line "EICH, also geht es"
	cont "deinen #MON"
	cont "gut!"

	para "Meinen #MON"
	line "geht es auch gut."

	para "Aber ich möchte ja"
	line "auch ein #MON-"
	cont "Professor werden,"

	para "also ist das keine"
	line "Überraschung."
	done
