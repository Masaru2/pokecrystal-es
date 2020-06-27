INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/arnie_callee", ROMX

ArnieAnswerPhoneText::
	text "Yeah, hallo. Hier"
	line "ist @"
	text_ram wStringBuffer3
	text "."

	para "…Huh, <PLAY_G>? Yo!"
	done

ArnieAnswerPhoneDayText::
	text "Yo, hallo, du hast"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "…Huh, <PLAY_G>? Yo!"
	done

ArnieAnswerPhoneNiteText::
	text "Yo, hallo, du hast"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "…Huh, <PLAY_G>? Yo!"
	done

ArnieGreetText::
	text "Yeah, hallo?"
	line "@"
	text_ram wStringBuffer3
	text " hier."

	para "Was läuft bei dir,"
	line "<PLAY_G>?"
	done

ArnieGreetDayText::
	text "Yeah, hallo?"
	line "@"
	text_ram wStringBuffer3
	text " hier."

	para "Wo bist du,"
	line "<PLAY_G>?"
	done

ArnieGreetNiteText::
	text "Yeah, hallo?"
	line "@"
	text_ram wStringBuffer3
	text " hier."

	para "Bist du wach,"
	line "<PLAY_G>?"
	done

ArnieGenericText::
	text "Ich wette, deine"
	line "#MON sind viel"
	cont "stärker als zuvor."
	done
