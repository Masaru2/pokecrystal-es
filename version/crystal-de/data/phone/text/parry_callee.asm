INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/parry_callee", ROMX

ParryAnswerPhoneText::
	text "Jepp!"
	line "Ich, @"
	text_ram wStringBuffer3
	text "!"

	para "Hah, und da ist"
	line "<PLAY_G>!"
	done

ParryAnswerPhoneDayText::
	text "Jepp!"
	line "@"
	text_ram wStringBuffer3
	text " hier!"

	para "Hah, und da ist"
	line "<PLAY_G>!"
	done

ParryAnswerPhoneNiteText::
	text "Jepp!"
	line "Ich, @"
	text_ram wStringBuffer3
	text "!"

	para "Hah, und da ist"
	line "<PLAY_G>!"
	done

ParryGreetText::
	text "<PLAY_G>, ich,"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "Hattest du ein"
	line "großes Frühstück?"
	done

ParryGreetDayText::
	text "<PLAY_G>, ich,"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "Hattest du ein"
	line "gutes Mittagessen?"
	done

ParryGreetNiteText::
	text "<PLAY_G>, ich,"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "Hattest du ein"
	line "großes Abendessen?"
	done

ParryGenericText::
	text "Sehen deine #-"
	line "MON gut aus?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "und ich, wir sehen"

	para "hervorragend aus!"
	line "Hahaha!"
	done
