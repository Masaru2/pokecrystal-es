INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/liz_callee", ROMX

LizAnswerPhoneText::
	text "Hallo, @"
	text_ram wStringBuffer3
	text_start
	line "am Apparat."

	para "Oh, <PLAY_G>."
	line "Guten Morgen."
	done

LizAnswerPhoneDayText::
	text "Hallo, @"
	text_ram wStringBuffer3
	text_start
	line "ist dran."

	para "Oh, <PLAY_G>."
	line "Wie geht es dir?"
	done

LizAnswerPhoneNiteText::
	text "Hallo, @"
	text_ram wStringBuffer3
	text_start
	line "am Apparat."

	para "Oh, <PLAY_G>."
	line "Guten Abend."
	done

LizGreetText::
	text "Guten Morgen,"
	line "<PLAY_G>."

	para "@"
	text_ram wStringBuffer3
	text ", hallo!"
	line "Bist du wach?"
	done

LizGreetDayText::
	text "Hi, <PLAY_G>."
	line "@"
	text_ram wStringBuffer3
	text ", hallo!"

	para "Wie ist es dir"
	line "ergangen?"
	done

LizGreetNiteText::
	text "Guten Abend,"
	line "<PLAY_G>."

	para "@"
	text_ram wStringBuffer3
	text ", hallo!"
	line "Bist du wach?"
	done

LizGenericText::
	text "Ich hatte Zeit,"
	line "daher rufe ich an."

	para "Wie geht es deinen"
	line "#MON?"

	para "Ich bringe mein"
	line "@"
	text_ram wStringBuffer4
	text " täglich"

	para "in das #MON-"
	line "CENTER von VIOLA"

	para "CITY, darum geht"
	line "es ihm wunderbar!"

	para "Die Rezeptionistin"
	line "ist eine Freundin!"
	done
