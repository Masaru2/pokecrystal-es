INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/wade_callee", ROMX

WadeAnswerPhoneText::
	text "Hallo? Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh. Hi, <PLAY_G>!"
	line "Guten Morgen!"
	done

WadeAnswerPhoneDayText::
	text "Hallo? Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, hi, <PLAY_G>!"
	done

WadeAnswerPhoneNiteText::
	text "Hallo? Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, hi, <PLAY_G>!"
	line "Guten Abend!"
	done

WadeGreetText::
	text "<PLAY_G>,"
	line "guten Morgen!"

	para "@"
	text_ram wStringBuffer3
	text ", hallo!"
	line "Schön heute, oder?"
	done

WadeGreetDayText::
	text "<PLAY_G>,"
	line "alles senkrecht?"

	para "@"
	text_ram wStringBuffer3
	text "."
	line "Schön heute, oder?"
	done

WadeGreetNiteText::
	text "Guten Abend,"
	line "<PLAY_G>!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Bist du wach?"
	done

WadeGenericText::
	text "Wie geht es deinen"
	line "#MON?"

	para "Meine #MON"
	line "haben zu viel"

	para "Energie. Das ist"
	line "ein Problem."

	para "Von all meinen"
	line "#MON ist"
	cont "@"
	text_ram wStringBuffer4
	text " am"
	cont "schwierigsten."

	para "Mit ihm zu arbei-"
	line "ten ist ermüdend."
	done
