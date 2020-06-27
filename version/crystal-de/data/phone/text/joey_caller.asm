INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/joey_caller", ROMX

JoeyMonLookingSharperText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "sieht entschlos-"
	cont "sener aus!"

	para "Ich bezweifle,"
	line "dass du auch so"

	para "ein cooles #MON"
	line "in deinem Team"
	cont "hast!"
	done

JoeyDefeatedMonText::
	text "Hossa, neulich"
	line "besiegte ich ein"

	para "@"
	text_ram wStringBuffer4
	text_start
	line "in der Wildnis."

	para "Es war ein Kinder-"
	line "spiel. Nun, wir"

	para "sind eben so"
	line "stark."
	done

JoeyLostAMonText::
	text "Oh, ich sah ein"
	line "wildes @"
	text_ram wStringBuffer4
	text "!"

	para "Ich wollte es zu-"
	line "erst fangen, aber"

	para "ich besann mich"
	line "eines Besseren und"

	para "beschloss, mit"
	line "meinem Ein und"
	cont "Alles zu arbeiten."
	done

JoeyBattleRematchText::
	text "Treffen wir uns"
	line "für einen Kampf!"

	para "Ich verspreche, es"
	line "wird anders!"

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Ruf an, wenn du in"
	line "der Nähe bist."
	done

JoeyHangUpText::
	text "Gut, bis später!"
	done

JoeyDevisingStrategiesText::
	text "Ich experimentiere"
	line "gerade mit den"

	para "Attacken von"
	line "@"
	text_ram wStringBuffer4
	text ", um"

	para "eine Strategie"
	line "zu finden."

	para "Finde ich eine"
	line "gute, dann müssen"
	cont "wir kämpfen!"
	done

JoeyReminderText::
	text "Was hält dich auf,"
	line "<PLAYER>!"

	para "Lass uns endlich"
	line "anfangen!"

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done
