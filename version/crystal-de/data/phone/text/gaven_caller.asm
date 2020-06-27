INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/gaven_caller", ROMX

GavenMonGreaterThanImaginedText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "könnte stärker"
	cont "sein, als ich"
	cont "dachte."

	para "Ich bezweifle,"
	line "dass ich ein"

	para "@"
	text_ram wStringBuffer4
	text " sehe,"
	line "das besser als"

	para "meines ist."
	done

GavenDefeatedMonText::
	text "Oh, ich habe vor"
	line "kurzem knapp gegen"

	para "ein @"
	text_ram wStringBuffer4
	text_start
	line "gewonnen."

	para "Ich habe noch nie"
	line "so ein starkes"

	para "@"
	text_ram wStringBuffer4
	text_start
	line "gesehen…"

	para "Du solltest deine"
	line "Verteidigung nicht"

	para "vernachlässigen,"
	line "auch wenn du die-"
	cont "ses #MON öfter"
	cont "siehst."
	done

GavenLostAMonText::
	text "Vor geraumer Zeit,"
	line "versuchte ich ein"

	para "wildes @"
	text_ram wStringBuffer4
	text_start
	line "zu fangen."

	para "Aber es ist mir"
	line "entkommen."

	para "Eine einzige fal-"
	line "sche Entscheidung"

	para "kann über Sieg"
	line "oder Niederlage"

	para "entscheiden…"
	line "Auch du solltest"

	para "vorsichtig sein!"
	done

GavenBattleRematchText::
	text "Auf in den Kampf!"

	para "Hier warte ich:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Ruf an, wenn du in"
	line "der Nähe bist."
	done

GavenHangUpText::
	text "O.K., ich melde"
	line "mich bald!"
	done

GavenHangUpNotThursdayText::
	text "Ich bin davon"
	line "besessen, dich"
	cont "zu besiegen."
	done

GavenReminderText::
	text "<PLAY_G>, wo"
	line "bist du?"

	para "Ich mache dich auf"
	line "@"
	text_ram wStringBuffer5
	text " fertig!"
	done
