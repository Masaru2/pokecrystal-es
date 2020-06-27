INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/jose_callee", ROMX

JoseAnswerPhoneText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>?"
	line "Guten Morgen!"
	done

JoseAnswerPhoneDayText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>? Hi!"
	done

JoseAnswerPhoneNiteText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, <PLAY_G>?"
	line "Guten Abend!"
	done

JoseGreetText::
	text "Oh, <PLAY_G>?"

	para "Tüüt! Yeah, ich"
	line "bin's, @"
	text_ram wStringBuffer3
	text "."
	done

JoseGreetDayText::
	text "Oh, <PLAY_G>?"

	para "Tüüt! Yeah, ich"
	line "bin's, @"
	text_ram wStringBuffer3
	text "."
	done

JoseGreetNiteText::
	text "Oh, <PLAY_G>?"

	para "Tüüt! Yeah, ich"
	line "bin's, @"
	text_ram wStringBuffer3
	text "."
	done

JoseGenericText::
	text "Geht es deinen"
	line "#MON gut?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "strotzt vor"
	cont "Energie."

	para "Hebt es ab, kommt"
	line "es für eine Weile"
	cont "nicht wieder."
	done
