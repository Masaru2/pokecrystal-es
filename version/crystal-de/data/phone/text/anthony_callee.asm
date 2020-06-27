INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/anthony_callee", ROMX

AnthonyAnswerPhoneText::
	text "Yo, @"
	text_ram wStringBuffer3
	text " der"
	line "WANDERER ist dran."

	para "Ah, <PLAYER>!"
	done

AnthonyAnswerPhoneDayText::
	text "Yo, @"
	text_ram wStringBuffer3
	text " der"
	line "WANDERER ist dran."

	para "Ah, <PLAYER>,"
	line "nicht wahr?"
	done

AnthonyAnswerPhoneNiteText::
	text "Yo, @"
	text_ram wStringBuffer3
	text " der"
	line "WANDERER ist dran."

	para "Ah, <PLAYER>,"
	line "nicht wahr?"
	done

AnthonyGreetText::
	text "Ah, <PLAYER>!"

	para "Yo, @"
	text_ram wStringBuffer3
	text " der"
	line "WANDERER ist dran."
	done

AnthonyGreetDayText::
	text "Heh, ist das nicht"
	line "<PLAYER>?"

	para "Ich, @"
	text_ram wStringBuffer3
	text ","
	line "der WANDERER!"
	done

AnthonyGreetNiteText::
	text "<PLAYER>, bist du"
	line "noch wach?"

	para "Ich, @"
	text_ram wStringBuffer3
	text ","
	line "der WANDERER!"
	done

AnthonyGenericText::
	text "Sind deine #MON"
	line "immer noch wild?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "und ich, wir"

	para "strotzen vor Ener-"
	line "gie. Wir wandern"

	para "täglich in den"
	line "Bergen, um so"

	para "Energie abzubauen."
	done
