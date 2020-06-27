INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/gina_callee", ROMX

GinaAnswerPhoneText::
	text "Hallo? Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>!"
	line "Guten Morgen!"
	done

GinaAnswerPhoneDayText::
	text "Hallo? Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>!"
	line "Wie geht es dir?"
	done

GinaAnswerPhoneNiteText::
	text "Hallo? Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>!"
	line "Guten Abend!"
	done

GinaGreetText::
	text "<PLAY_G>?"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Guten Morgen!"
	done

GinaGreetDayText::
	text "<PLAY_G>?"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Hast du Zeit?"
	done

GinaGreetNiteText::
	text "<PLAY_G>?"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Zeit zum Plaudern?"
	done

GinaGenericText::
	text "Sind deine #MON"
	line "noch immer stark?"

	para "Ich trainiere mein"
	line "@"
	text_ram wStringBuffer4
	text_start
	cont "täglich."
	done
