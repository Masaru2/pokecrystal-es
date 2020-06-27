INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE1_YOUNGSTER
	const ROUTE1_COOLTRAINER_F
	const ROUTE1_FRUIT_TREE


SECTION "maps/Route1", ROMX

Route1_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSchoolboyDanny:
	trainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDannyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

Route1Sign:
	jumptext Route1SignText

Route1FruitTree:
	fruittree FRUITTREE_ROUTE_1

SchoolboyDannySeenText:
	text "Wenn sich zwei"
	line "Trainer begegnen,"
	cont "wollen sie sofort"
	cont "kämpfen."
	done

SchoolboyDannyBeatenText:
	text "Argh… Ich"
	line "habe erneut"
	cont "verloren…"
	done

SchoolboyDannyAfterBattleText:
	text "Es ist ein"
	line "ungeschriebenes"

	para "Gesetz, dass Trai-"
	line "ner kämpfen, wenn"
	cont "sie sich begegnen."
	done

CooltrainerfQuinnSeenText:
	text "Du da!"
	line "Willst du kämpfen?"
	done

CooltrainerfQuinnBeatenText:
	text "Versagt und weg…"
	done

CooltrainerfQuinnAfterBattleText:
	text "Du bist stark."

	para "Du hast offenbar"
	line "hart trainiert."
	done

Route1SignText:
	text "ROUTE 1"

	para "ALABASTIA -"
	line "VERTANIA CITY"
	done

Route1_MapEvents::
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7, 27, BGEVENT_READ, Route1Sign

	db 3 ; object events
	object_event  4, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDanny, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfQuinn, -1
	object_event  3,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
