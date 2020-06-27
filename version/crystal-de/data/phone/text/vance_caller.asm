INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/vance_caller", ROMX

VanceMonHasBecomeTougherText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "wurde stärker."

	para "Wir sind"
	line "abgehoben!"
	done

VanceDefeatedMonText::
	text "Wir können"
	line "@"
	text_ram wStringBuffer4
	text_start
	cont "leicht besiegen!"

	para "…Huh? Du auch?"
	line "Das ist doch toll?"
	done

VanceLostAMonText::
	text "Aber, stell dir"
	line "vor, ein wildes"

	para "@"
	text_ram wStringBuffer4
	text " entkam"
	line "uns nur knapp."

	para "Ich wollte ihm"
	line "nachFLIEGEN…"
	done

VanceBattleRematchText::
	text "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Du weißt, wo wir"
	line "uns zum ersten Mal"
	cont "sahen?"

	para "Willst du kämpfen?"
	line "Ich warte dort."
	done

VanceHangUpText::
	text "O.K., mach's gut!"
	done

VanceLookingForwardText::
	text "Ich freue mich auf"
	line "unseren nächsten"
	cont "Kampf!"
	done

VanceHurryHurryText::
	text "Oh, <PLAY_G>!"
	line "Beeilung!"

	para "@"
	text_ram wStringBuffer5
	text "!"
	line "FLIEGE zu mir!"
	done
