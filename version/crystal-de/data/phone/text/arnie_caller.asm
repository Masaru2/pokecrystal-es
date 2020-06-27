INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/arnie_caller", ROMX

ArnieMonIsSoCuteText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist immer dabei!"

	para "Es ist so süß!"
	line "Ich liebe es!"
	done

ArnieDefeatedMonText::
	text "Themawechsel! Ich"
	line "sah zum ersten Mal"
	cont "ein @"
	text_ram wStringBuffer4
	text "."

	para "Es war einfach zu"
	line "besiegen."
	done

ArnieLostAMonText::
	text "Ich fragte mich,"
	line "ob du zufällig ein"
	cont "@"
	text_ram wStringBuffer4
	text " hast?"

	para "Ich kann keines"
	line "fangen. Was ist"

	para "wohl seine"
	line "Schwäche?"
	done

ArnieBattleRematchText::
	text "Heh, lass unsere"
	line "#MON kämpfen!"

	para "Ich verliere weder"
	line "im Kampf noch im"

	para "Käferturnier"
	line "gegen dich!"

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

ArnieHangUpText::
	text "Lass uns erneut"
	line "plaudern?"
	done

ArnieSwarmText::
	text "Bin ich froh, dass"
	line "ich dich noch"
	cont "erwische!"

	para "Ein ganzer Schwarm"
	line "@"
	text_ram wStringBuffer4
	text " ist"

	para "hier aufgetaucht:"
	line "@"
	text_ram wStringBuffer5
	text "!"

	para "Das musst du dir"
	line "ansehen!"
	done

ArnieHaventSeenRareMonText::
	text "In letzter Zeit"
	line "hatte ich kein"

	para "Glück, seltene"
	line "#MON zu sehen…"

	para "Aber ich weiß,"
	line "dass sie da sind!"
	done

ArnieReminderText::
	text "Heh, wo bist du"
	line "jetzt?"

	para "Lass uns kämpfen."
	line "Ich warte hier:"
	cont "@"
	text_ram wStringBuffer5
	text "!"
	done

ArnieHurryText::
	text "Hallo? Kommst du"
	line "oder nicht?"

	para "Du verpasst YANMA"
	line "zu sehen!"

	para "Komm sofort zu"
	line "ROUTE 35!"
	done
