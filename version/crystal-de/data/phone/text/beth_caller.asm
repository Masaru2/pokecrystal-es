INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/beth_caller", ROMX

BethExhilaratingRideText::
	text "Erinnerst du dich"
	line "an mein süßes"
	cont "@"
	text_ram wStringBuffer4
	text "?"

	para "@"
	text_ram wStringBuffer4
	text " rennt"
	line "sehr schnell."

	para "Es ist wahrlich"
	line "berauschend auf"

	para "ihm zu reiten,"
	line "wenn es loslegt."
	done

BethDefeatedMonText::
	text "Oh, hast du schon"
	line "je ein @"
	text_ram wStringBuffer4
	text_start
	cont "gesehen?"

	para "Ich habe gerade"
	line "gegen eines"
	cont "gekämpft…"

	para "Es war schneller,"
	line "als ich dachte."

	para "Ich war ein wenig"
	line "perplex."

	para "Natürlich habe ich"
	line "dennoch gewonnen."
	done

BethLostAMonText::
	text "Oh, ich habe"
	line "soeben ein wildes"

	para "@"
	text_ram wStringBuffer4
	text_start
	line "gesehen."

	para "Ich wollte es"
	line "fangen, aber ich"

	para "musste feststel-"
	line "len, dass ich"

	para "keine #BÄLLE"
	line "mehr hatte."

	para "Wenn du deinen"
	line "Item-Bestand nicht"

	para "kennst, kann es"
	line "dir ähnlich erge-"
	cont "hen! Lerne aus"
	cont "meinem Fehler."
	done

BethBattleRematchText::
	text "Willst du kämpfen?"
	line "Dieses Mal gewinne"
	cont "ich!"

	para "Hier erwarte ich"
	line "dich:"

	para "@"
	text_ram wStringBuffer5
	text "."
	line "Komm vorbei, O.K.?"
	done

BethHangUpText::
	text "O.K., bye-bye!"
	done

BethLetsBattleAgainSometimeText::
	text "Lass uns wieder"
	line "mal kämpfen!"
	done

BethReminderText::
	text "Ähm… <PLAY_G>?"
	line "Was ist los?"

	para "Hast du unsere Ab-"
	line "machung vergessen?"

	para "@"
	text_ram wStringBuffer5
	text "."

	para "Genau dort warte"
	line "ich auf dich."
	done
