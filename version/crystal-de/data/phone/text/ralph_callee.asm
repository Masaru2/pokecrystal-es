INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/ralph_callee", ROMX

RalphAnswerPhoneText::
	text "Ja? Ah, <PLAY_G>."

	para "Du bist wenigstens"
	line "so höflich und"

	para "meldest dich mit"
	line "deinem Namen."
	done

RalphAnswerPhoneDayText::
	text "Ja? Ah, <PLAY_G>."

	para "Du bist wenigstens"
	line "so höflich und"

	para "meldest dich mit"
	line "deinem Namen."
	done

RalphAnswerPhoneNiteText::
	text "Ja? Ah, <PLAY_G>."

	para "Du bist wenigstens"
	line "so höflich und"

	para "meldest dich mit"
	line "deinem Namen."
	done

RalphGreetText::
	text "Hier ist Onkel"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

RalphGreetDayText::
	text "Hier ist Onkel"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

RalphGreetNiteText::
	text "Hier ist Onkel"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

RalphGenericText::
	text "Versorgst du deine"
	line "#MON auch gut?"

	para "Behandle sie gut,"
	line "sie sind deine"
	cont "Kameraden!"
	done
