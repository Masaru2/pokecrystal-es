INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/beth_callee", ROMX

BethAnswerPhoneText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>."
	line "Guten Morgen."
	done

BethAnswerPhoneDayText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh. Hi, <PLAY_G>."
	done

BethAnswerPhoneNiteText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Oh, <PLAY_G>."
	line "Guten Abend."
	done

BethGreetText::
	text "Guten Morgen,"
	line "<PLAY_G>!"

	para "Ich, @"
	text_ram wStringBuffer3
	text "."
	line "Bist du wach?"
	done

BethGreetDayText::
	text "Hi, <PLAY_G>!"
	line "Ich, @"
	text_ram wStringBuffer3
	text "."

	para "Hast du Zeit zum"
	line "Reden?"
	done

BethGreetNiteText::
	text "Hi, <PLAY_G>."
	line "Guten Abend."

	para "Ich, @"
	text_ram wStringBuffer3
	text "."

	para "Ich hoffe, du"
	line "warst noch wach."
	done

BethGenericText::
	text "Gehörst du zu den"
	line "Menschen, die oft"

	para "in #MON-CENTER"
	line "gehen?"

	para "Ich gehe täglich."
	line "Sich um das Wohl-"
	cont "ergehen seiner"

	para "#MON zu küm-"
	line "mern, gehört zu"
	cont "den Grundlagen"

	para "eines #MON"
	line "-Trainers."
	done
