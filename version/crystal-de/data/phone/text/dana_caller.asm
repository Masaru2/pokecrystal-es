INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/dana_caller", ROMX

DanaTakingPhotosText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "wird immer süßer!"

	para "Ich habe schon"
	line "viele Fotos"
	cont "gemacht!"
	done

DanaDefeatedMonText::
	text "Im Handumdrehen"
	line "war das wilde"
	cont "@"
	text_ram wStringBuffer4
	text " K.O."

	para "Das kommt bestimmt"
	line "davon, dass du mir"

	para "Kampftipps gegeben"
	line "hast."
	done

DanaLostAMonText::
	text "Weißt du? Ein"
	line "wildes @"
	text_ram wStringBuffer4
	text_start

	para "ist mir erneut"
	line "entkommen."

	para "Es war so knapp!"
	line "Wirklich, noch ein"

	para "bisschen mehr und"
	line "ich hätte…"
	done

DanaBattleRematchText::
	text "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Bist du in der"
	line "Nähe, dann lass"

	para "uns kämpfen! Ich"
	line "erwarte dich!"
	done

DanaHangUpText::
	text "Bis dann!"
	done

DanaFoundItemText::
	text "Weißt du?"
	line "Ich habe ein gutes"
	cont "Geschenk für dich!"

	para "Wie versprochen,"
	line "es gehört dir!"

	para "Ich bin sicher,"
	line "du wirst es mögen."

	para "Hole es dir hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

DanaCanYouWaitABitLongerText::
	text "Oh! Du wolltest"
	line "ein Geschenk?"

	para "Ich habe eines,"
	line "aber ich will es"
	cont "behalten."

	para "Gedulde dich noch"
	line "ein wenig!"
	done

DanaReminderText::
	text "Hi! Du hast dein"
	line "Versprechen, gegen"

	para "mich zu kämpfen"
	line "nicht vergessen,"
	cont "oder?"

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

DanaComePickUpText::
	text "Hallo?"

	para "Wenn du nicht bald"
	line "hier auftauchst"

	para "und dein Geschenk"
	line "abholst, gebe ich"
	cont "es jemand anderem."

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done
