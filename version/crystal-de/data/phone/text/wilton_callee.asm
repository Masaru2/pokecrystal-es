INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/wilton_callee", ROMX

WiltonAnswerPhoneText::
	text "Hallo, du sprichst"
	line "mit @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAY_G>."
	done

WiltonAnswerPhoneDayText::
	text "Hallo, du sprichst"
	line "mit @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAY_G>,"
	line "nicht wahr?"
	done

WiltonAnswerPhoneNiteText::
	text "Hallo, du sprichst"
	line "mit @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, wenn das nicht"
	line "<PLAY_G> ist."
	done

WiltonGreetText::
	text_ram wStringBuffer3
	text " hier…"

	para "Hast du einen Mo-"
	line "ment Zeit?"
	done

WiltonGreetDayText::
	text_ram wStringBuffer3
	text " hier…"

	para "Kannst du jetzt"
	line "reden?"
	done

WiltonGreetNiteText::
	text_ram wStringBuffer3
	text " hier…"

	para "Entschuldige die"
	line "späte Störung."
	done

WiltonGenericText::
	text "Sind deine #MON"
	line "gewachsen?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist ein bisschen"
	cont "gewachsen."
	done
