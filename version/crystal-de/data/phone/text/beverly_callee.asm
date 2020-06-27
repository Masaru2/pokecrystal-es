INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/beverly_callee", ROMX

BeverlyAnswerPhoneText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Guten Morgen,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneDayText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Guten Tag,"
	line "<PLAYER>."
	done

BeverlyAnswerPhoneNiteText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh! Guten Abend,"
	line "<PLAYER>."
	done

BeverlyGreetText::
	text "Hallo, <PLAYER>."
	line "Guten Morgen."

	para "@"
	text_ram wStringBuffer3
	text ", hallo."
	line "Hast du"
	cont "geschlafen?"
	done

BeverlyGreetDayText::
	text "Hi, <PLAYER>."
	line "@"
	text_ram wStringBuffer3
	text ", hallo."

	para "Wie geht es dir?"
	done

BeverlyGreetNiteText::
	text "Hi, <PLAYER>."
	line "@"
	text_ram wStringBuffer3
	text ", hallo!"

	para "Bist du wach?"
	done

BeverlyGenericText::
	text "Sorgst du gut für"
	line "deine #MON?"

	para "Meinem @"
	text_ram wStringBuffer4
	text_start
	line "geht es gut. Es"
	cont "frisst viel."
	done
