INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/parry_caller", ROMX

ParryNothingCanMatchText::
	text "Nichts kann es mit"
	line "meinem @"
	text_ram wStringBuffer4
	text_start
	cont "aufnehmen."
	done

ParryDefeatedMonText::
	text "Yo, wir haben ein"
	line "wildes @"
	text_ram wStringBuffer4
	text_start

	para "K.O. geschlagen."
	line "Es war in Ordnung,"

	para "aber ich wollte"
	line "es fangen…"
	done

ParryLostAMonText::
	text "Und gestern, haben"
	line "wir ein wildes"

	para "@"
	text_ram wStringBuffer4
	text_start
	line "gesehen. Wir dis-"
	cont "kutierten, ob wir"
	cont "es fangen sollten."

	para "Dann tauchte ein"
	line "anderer Typ auf"

	para "und fing es!"
	line "Potztausend!"
	done

ParryBattleRematchText::
	text "Du glaubst gegen"
	line "mich kämpfen zu"

	para "wollen. Habe"
	line "ich recht?"

	para "Hier bin ich:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

ParryHangUpText::
	text "O.K., ruf mich"
	line "an!"
	done

ParryBattleWithMeText::
	text "Du kämpfst wieder"
	line "gegen mich, oder?"
	done

ParryHaventYouGottenToText::
	text "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "?"

	para "Hier zu warten ist"
	line "nicht übel, aber"
	cont "ich möchte"
	cont "kämpfen!"
	done
