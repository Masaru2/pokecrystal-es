INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/tiffany_callee", ROMX

TiffanyAnswerPhoneText::
	text "Ja? Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>."
	line "Guten Morgen."
	done

TiffanyAnswerPhoneDayText::
	text "Ja? Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>."
	line "Hallo."
	done

TiffanyAnswerPhoneNiteText::
	text "Ja? Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>,"
	line "guten Abend."
	done

TiffanyGreetText::
	text "Spreche ich mit"
	line "<PLAY_G>?"

	para "Guten Morgen. Hier"
	line "ist @"
	text_ram wStringBuffer3
	text "."
	done

TiffanyGreetDayText::
	text "Spreche ich mit"
	line "<PLAY_G>?"

	para "@"
	text_ram wStringBuffer3
	text " hier."
	done

TiffanyGreetNiteText::
	text "Spreche ich mit"
	line "<PLAY_G>?"

	para "Guten Abend. Hier"
	line "ist @"
	text_ram wStringBuffer3
	text "."
	done

TiffanyGenericText::
	text "Sind deine #MON"
	line "in Ordnung?"

	para "Ich hoffe, du"
	line "bringst sie täg-"
	cont "lich in ein"
	cont "#MON-CENTER."

	para "Übertreib es "
	line "nicht."

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist süß und leb-"
	cont "haft, weil ich es"

	para "täglich in ein"
	line "#MON-CENTER"
	cont "bringe."
	done
