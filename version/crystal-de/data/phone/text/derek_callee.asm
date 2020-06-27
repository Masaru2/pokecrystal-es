INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/derek_callee", ROMX

DerekAnswerPhoneText::
	text "Hi, <PLAY_G>?"

	para "Guten Morgen pika."
	line "Was ist los pika?"
	done

DerekAnswerPhoneDayText::
	text "Hi, <PLAY_G>?"

	para "Guten Tag pika."
	line "Was ist los pika?"
	done

DerekAnswerPhoneNiteText::
	text "Hi, <PLAY_G>?"

	para "Guten Abend pika."
	line "Was ist los pika?"
	done

DerekGreetText::
	text "<PLAY_G> pika,"
	line "guten Morgen!"

	para "@"
	text_ram wStringBuffer3
	text " hier,"
	line "wie pika bist du?"
	done

DerekGreetDayText::
	text "<PLAY_G> pika,"
	line "guten pika Tag!"

	para "@"
	text_ram wStringBuffer3
	text " hier,"
	line "wie pika bist du?"
	done

DerekGreetNiteText::
	text "<PLAY_G> pika,"
	line "guten Abend!"

	para "@"
	text_ram wStringBuffer3
	text " hier."
	line "Warst du wach?"
	done

DerekGenericText::
	text "Das musst du"
	line "hören! Mein lie-"
	cont "benswürdiges"

	para "@"
	text_ram wStringBuffer4
	text " sah"
	line "mich an und"
	cont "lachte!"

	para "Es muss daran lie-"
	line "gen, weil unsere"
	cont "Herzen im Einklang"
	cont "schlagen!"
	done
