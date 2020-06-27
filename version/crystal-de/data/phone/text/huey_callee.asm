INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/huey_callee", ROMX

HueyAnswerPhoneText::
	text "Yeah, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Huh? Was ist los,"
	line "<PLAYER>?"
	done

HueyAnswerPhoneDayText::
	text "Yeah, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Huh? Was ist los,"
	line "<PLAYER>?"
	done

HueyAnswerPhoneNiteText::
	text "Yeah, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Huh? Was ist los,"
	line "<PLAYER>?"
	done

HueyGreetText::
	text "Yo, <PLAYER>!"
	line "Bist du wach?"

	para "Ich, @"
	text_ram wStringBuffer3
	text "!"
	line "Wie geht es dir?"
	done

HueyGreetDayText::
	text "Yo, <PLAYER>! Hast"
	line "du heute Zeit?"

	para "Ich, @"
	text_ram wStringBuffer3
	text "!"
	line "Alles klar?"
	done

HueyGreetNiteText::
	text "Yo, <PLAYER>!"
	line "Bist du wach?"

	para "Ich, @"
	text_ram wStringBuffer3
	text "!"
	line "Alles im Lot?"
	done
