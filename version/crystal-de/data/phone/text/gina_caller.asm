INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/gina_caller", ROMX

GinaGettingInSyncWithMonText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "und ich stimmen"

	para "uns immer besser"
	line "aufeinander ab."
	done

GinaDefeatedMonText::
	text "Wir kämpften gegen"
	line "ein wildes"

	para "@"
	text_ram wStringBuffer4
	text " und"
	line "gewannen knapp."

	para "Wir kommen jetzt"
	line "in Schwung!"
	done

GinaLostAMonText::
	text "Aber, weißt du?"

	para "Ich habe immer"
	line "noch kein"

	para "@"
	text_ram wStringBuffer4
	text_start
	line "gefangen. Das wird"

	para "langsam"
	line "frustrierend…"
	done

GinaBattleRematchText::
	text "Möchtest du mein"
	line "Trainings-Kamerad"
	cont "sein?"

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "…Kannst du mich"
	line "das nächste Mal"

	para "etwas schonender"
	line "behandeln?"
	done

GinaHangUpText::
	text "Tschüss! Wir"
	line "plaudern wieder!"
	done

GinaRocketTakeoverRumorText::
	text "Hast du von TEAM"
	line "ROCKET gehört?"

	para "Sie annektierten"
	line "den RADIOTURM in"
	cont "DUKATIA CITY."

	para "Sind die Menschen"
	line "im TURM in"
	cont "Sicherheit?"
	done

GinaFoundItemText::
	text "Ich habe heute et-"
	line "was Tolles"
	cont "gefunden."

	para "Ich möchte es dir"
	line "geben, darum rufe"
	cont "ich an!"

	para "Du holst es dir"
	line "doch, oder?"

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."
	done

GinaHaventFoundAnythingYetText::
	text "Sorry, ich habe"
	line "noch nichts"

	para "Brauchbares gefun-"
	line "den… ich ver-"
	cont "spreche, dass du"

	para "es haben kannst,"
	line "wenn ich etwas"
	cont "finde!"
	done

GinaReminderText::
	text "Oh, <PLAY_G>!"
	line "Wann kann ich mit"

	para "dir und unserem"
	line "Kampf rechnen?"

	para "Vergiss es nicht,"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

GinaComePickUpText::
	text "Ich werde wirklich"
	line "ungeduldig, ich"

	para "möchte dir endlich"
	line "dein Geschenk"
	cont "geben!"

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done
