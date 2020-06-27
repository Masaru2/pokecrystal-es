INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/tully_callee", ROMX

TullyAnswerPhoneText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Oh, guten Morgen,"
	line "<PLAY_G>."
	done

TullyAnswerPhoneDayText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Diese Stimme…"
	line "<PLAY_G>, richtig?"
	done

TullyAnswerPhoneNiteText::
	text "Hallo, hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Das muss"
	line "<PLAY_G> sein!"
	done

TullyGreetText::
	text "Hallo!"
	line "@"
	text_ram wStringBuffer3
	text " hier…"

	para "Guten Morgen! Das"
	line "Wetter ist toll!"
	done

TullyGreetDayText::
	text "Hallo! Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ein perfekter Tag"
	line "zum Angeln!"
	done

TullyGreetNiteText::
	text "Hallo! Hier ist"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Die perfekte Nacht"
	line "zum Angeln!"
	done

TullyGenericText::
	text "Wie läuft es mit"
	line "deinem Abenteuer?"

	para "Ich kann mich über"
	line "das Angeln nicht"
	cont "beschweren!"
	done
