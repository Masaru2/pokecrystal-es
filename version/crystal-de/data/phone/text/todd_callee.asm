INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/todd_callee", ROMX

ToddAnswerPhoneText::
	text "Ja? Hier spricht"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Heh, <PLAY_G>!"
	done

ToddAnswerPhoneDayText::
	text "Ja? Hier spricht"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Wenn das nicht"
	line "<PLAY_G> ist!"
	done

ToddAnswerPhoneNiteText::
	text "Ja? Hier spricht"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Ah, <PLAY_G>!"
	done

ToddGreetText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "<PLAY_G>, richtig?"
	done

ToddGreetDayText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "<PLAY_G>, was"
	line "machst du gerade?"
	done

ToddGreetNiteText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "<PLAY_G>, ent-"
	line "schuldige die"
	cont "späte Störung."
	done

ToddGenericText::
	text "Wie trainierst du"
	line "deine #MON?"

	para "Ich probiere alles"
	line "Mögliche aus. Ich"

	para "gebe sie in die"
	line "PENSION und stärke"

	para "sie, indem ich"
	line "Items einsetze."
	done
