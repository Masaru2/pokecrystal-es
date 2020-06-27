INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/gaven_callee", ROMX

GavenAnswerPhoneText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAY_G>!"
	line "Guten Morgen!"
	done

GavenAnswerPhoneDayText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAY_G>!"
	done

GavenAnswerPhoneNiteText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Hi, <PLAY_G>!"
	line "Guten Abend!"
	done

GavenGreetText::
	text "<PLAY_G>,"
	line "guten Morgen!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Wie geht es dir?"
	done

GavenGreetDayText::
	text "Hi, <PLAY_G>!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Alles in Butter?"
	done

GavenGreetNiteText::
	text "<PLAY_G>,"
	line "guten Abend!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Alles paletti?"
	done

GavenGenericText::
	text "Wie geht es deinen"
	line "#MON?"

	para "Meinem @"
	text_ram wStringBuffer4
	text_start
	line "geht es wie immer"
	cont "hervorragend."

	para "Lass uns am Ball"
	line "bleiben und #-"
	cont "MON-CHAMPS werden!"
	done
