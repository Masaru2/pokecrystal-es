INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/reena_callee", ROMX

ReenaAnswerPhoneText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh. Hi, <PLAYER>."
	line "Was gibt's?"
	done

ReenaAnswerPhoneDayText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, hi, <PLAYER>,"
	line "was gibt's?"
	done

ReenaAnswerPhoneNiteText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, hi, <PLAYER>,"
	line "was gibt's?"
	done

ReenaGreetText::
	text "Du bist lahm! Auf,"
	line "antworte mir!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "!"
	done

ReenaGreetDayText::
	text "Du bist lahm! Auf,"
	line "antworte mir!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "!"
	done

ReenaGreetNiteText::
	text "Du bist lahm! Auf,"
	line "antworte mir!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "!"
	done

ReenaGenericText::
	text "Heh, wie geht es"
	line "deinen #MON?"

	para "Was? Gut?"
	line "Verstehe…"

	para "Meinen #MON?"

	para "Es geht ihnen sehr"
	line "gut! Was stellst"

	para "du denn für"
	line "Fragen?"
	done
