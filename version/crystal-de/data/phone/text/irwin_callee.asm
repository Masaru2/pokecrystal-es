INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/irwin_callee", ROMX

IrwinAnswerPhoneText::
	text "Hallo? @"
	text_ram wStringBuffer3
	text_start
	line "hier…"

	para "Heh, <PLAY_G>!"
	done

IrwinAnswerPhoneDayText::
	text "Hallo? @"
	text_ram wStringBuffer3
	text_start
	line "hier…"

	para "Wow, <PLAY_G>!"
	done

IrwinAnswerPhoneNiteText::
	text "Hallo? @"
	text_ram wStringBuffer3
	text_start
	line "hier…"

	para "Yippee, <PLAY_G>!"
	done

IrwinGreetText::
	text "Uh, hallo."
	line "<PLAY_G>?"

	para "Dein Freund,"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

IrwinGreetDayText::
	text "Uh, hallo,"
	line "<PLAY_G>?"

	para "Dein Kumpel,"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

IrwinGreetNiteText::
	text "Uh, hallo,"
	line "<PLAY_G>?"

	para "Dein Kamerad,"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done
