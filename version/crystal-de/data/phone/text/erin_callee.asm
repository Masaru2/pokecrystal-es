INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/erin_callee", ROMX

ErinAnswerPhoneText::
	text "Ja, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh. Hi, <PLAY_G>!"
	line "Guten Morgen!"
	done

ErinAnswerPhoneDayText::
	text "Ja, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, hi, <PLAY_G>!"
	line "Juhu!"
	done

ErinAnswerPhoneNiteText::
	text "Ja, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, hi, <PLAY_G>!"
	done

ErinGreetText::
	text "<PLAY_G>!"

	para "@"
	text_ram wStringBuffer3
	text " hier!"
	line "Guten Morgen!"
	done

ErinGreetDayText::
	text "<PLAY_G>!"

	para "@"
	text_ram wStringBuffer3
	text " hier!"
	line "Hart am Arbeiten?"
	done

ErinGreetNiteText::
	text "<PLAY_G>!"

	para "@"
	text_ram wStringBuffer3
	text " hier!"
	line "Bist du wach?"
	done

ErinGenericText::
	text "Trainierst du"
	line "deine #MON?"

	para "Das @"
	text_ram wStringBuffer4
	text_start
	line "von @"
	text_ram wStringBuffer3
	text_start
	cont "sieht gut aus!"
	done
