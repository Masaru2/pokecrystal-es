INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/wilton_caller", ROMX

WiltonMonHasGrownText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist sehr gewach-"
	cont "sen! Meine Angel-"
	cont "fähigkeiten haben"

	para "sich auch"
	line "verbessert!"
	done

WiltonDefeatedMonText::
	text "Wir besiegten ein"
	line "wildes @"
	text_ram wStringBuffer4
	text "…"

	para "Du weißt, dass mir"
	line "Angeln mehr Spaß"

	para "macht, als wilde"
	line "#MON zu"
	cont "besiegen."
	done

WiltonLostAMonText::
	text "Aber vor geraumer"
	line "Zeit hätten wir"

	para "fast ein wildes"
	line "@"
	text_ram wStringBuffer4
	text_start
	cont "gefangen."

	para "Ich sage dir, es"
	line "war riesig. Oja!"
	done

WiltonBattleRematchText::
	text "Ich angle hier:"
	line "@"
	text_ram wStringBuffer5
	text ","

	para "aber heute beißt"
	line "nichts an."

	para "Komm und vertreib"
	line "meine Langeweile"
	cont "mit einem Kampf."
	done

WiltonHangUpText::
	text "O.K., bis später."
	done

WiltonFoundItemText::
	text "Ich habe beim"
	line "Angeln ein Item"
	cont "gefunden."

	para "Komm hierher:"
	line "@"
	text_ram wStringBuffer5
	text "."
	done

WiltonHaventFoundAnythingText::
	text "Uh, ich habe noch"
	line "nichts Brauch-"
	cont "bares gefunden."

	para "Du musst Geduld"
	line "haben."
	done

WiltonNotBitingText::
	text "Seufz…"
	line "Sie beißen nicht"

	para "wie sonst! Hier:"
	line "@"
	text_ram wStringBuffer5
	text "…"

	para "Komm auf einen"
	line "Kampf vorbei!"
	done

WiltonWantThisText::
	text "Möchtest du das"
	line "Item nicht? Ha!"

	para "Du weißt nicht,"
	line "wo es ist?"

	para "@"
	text_ram wStringBuffer5
	text "…"
	line "Gehe von MAHAGONIA"

	para "CITY nach EBENHOLZ"
	line "CITY!"
	done
