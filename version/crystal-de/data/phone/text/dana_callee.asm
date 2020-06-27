INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/dana_callee", ROMX

DanaAnswerPhoneText::
	text "Hi, @"
	text_ram wStringBuffer3
	text_start
	line "am Apparat."

	para "Heh! Ist das nicht"
	line "<PLAY_G>!"
	done

DanaAnswerPhoneDayText::
	text "Hi, @"
	text_ram wStringBuffer3
	text_start
	line "am Apparat."

	para "Ich weiß! Du bist"
	line "<PLAY_G>!"
	done

DanaAnswerPhoneNiteText::
	text "Hi, @"
	text_ram wStringBuffer3
	text_start
	line "am Apparat."

	para "<PLAY_G>?"
	line "Was ist los?"
	done

DanaGreetText::
	text "Uh, <PLAY_G>?"

	para "Ich bin's!"
	line "Ich, @"
	text_ram wStringBuffer3
	text "!"
	done

DanaGreetDayText::
	text "Uh, <PLAY_G>?"

	para "Ich bin's!"
	line "Ich, @"
	text_ram wStringBuffer3
	text "!"
	done

DanaGreetNiteText::
	text "Uh, <PLAY_G>?"

	para "Ich bin's!"
	line "Ich, @"
	text_ram wStringBuffer3
	text "!"
	done

DanaGenericText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "strotzt vor Ener-"
	cont "gie, das macht mir"
	cont "ein wenig Angst."

	para "Wie geht es deinen"
	line "#MON?"
	done
