INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE


SECTION "maps/Route11", ROMX

Route11_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

YoungsterOwenSeenText:
	text "Bei #MON wird"
	line "nicht gemogelt."

	para "Immer fair"
	line "spielen."
	done

YoungsterOwenBeatenText:
	text "Huch? Wie konnte"
	line "das passieren?"
	done

YoungsterOwenAfterBattleText:
	text "Ich habe immer"
	line "fair und ehrenhaft"
	cont "gekämpft."

	para "Ich habe es noch"
	line "nie bedauert."
	done

YoungsterJasonSeenText:
	text "Es juckt und"
	line "sticht, wenn ich"

	para "mit meinen Shorts"
	line "durchs Gras laufe."
	done

YoungsterJasonBeatenText:
	text "Aiyaaah!"
	line "Ich bekam Dresche!"
	done

YoungsterJasonAfterBattleText:
	text "Im Gras werde ich"
	line "mehr #MON"
	cont "fangen."
	done

PsychicHermanSeenText:
	text "…"
	done

PsychicHermanBeatenText:
	text "…"
	done

PsychicHermanAfterBattleText:
	text "…"

	para "Ich verlor, als"
	line "ich meine Augen"
	cont "schloss…"
	done

PsychicFidelSeenText:
	text "Ich kann es sehen…"

	para "Ich kann alles"
	line "über dich sehen…"
	done

PsychicFidelBeatenText:
	text "Deine Stärke"
	line "konnte ich nicht"
	cont "sehen…"
	done

PsychicFidelAfterBattleText:
	text "Deine Überzeugung"
	line "ist stark…"

	para "Du bist stark,"
	line "weil du an deine"
	cont "#MON glaubst."
	done

Route11SignText:
	text "ROUTE 11"
	done

Route11_MapEvents::
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive

	db 5 ; object events
	object_event 22, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 20,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	object_event 28,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	object_event  8,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 32,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
