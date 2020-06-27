INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/unknown_callee", ROMX

UnknownGenericText::
	text "Wie geht es deinen"
	line "#MON?"

	para "Meine #MON sind"
	line "zu dynamisch."

	para "Besonders"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Sieht es einen"
	line "Trainer, will es"
	cont "kämpfen."

	para "Das wird mir lang-"
	line "sam zu viel!"
	done

UnknownTougherThanEverText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist so stark, wie"
	cont "nie zuvor."

	para "Es ist sogar"
	line "stärker als ich!"
	done
