INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const TRAINERHOUSEB1F_RECEPTIONIST
	const TRAINERHOUSEB1F_CHRIS


SECTION "maps/TrainerHouseB1F", ROMX

TrainerHouseB1F_MapScripts::
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

TrainerHouseReceptionistScript:
	turnobject PLAYER, UP
	opentext
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .FoughtTooManyTimes
	writetext TrainerHouseB1FIntroText
	promptbutton
	special TrainerHouse
	iffalse .GetCal3Name
	gettrainername STRING_BUFFER_3, CAL, CAL2
	sjump .GotName

.GetCal3Name:
	gettrainername STRING_BUFFER_3, CAL, CAL3
.GotName:
	writetext TrainerHouseB1FYourOpponentIsText
	promptbutton
	writetext TrainerHouseB1FAskWantToBattleText
	yesorno
	iffalse .Declined
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	writetext TrainerHouseB1FGoRightInText
	waitbutton
	closetext
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	opentext
	writetext TrainerHouseB1FCalBeforeText
	waitbutton
	closetext
	special TrainerHouse
	iffalse .NoSpecialBattle
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CAL2
	startbattle
	reloadmapafterbattle
	iffalse .End
.NoSpecialBattle:
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CAL3
	startbattle
	reloadmapafterbattle
.End:
	applymovement PLAYER, Movement_ExitTrainerHouseBattleRoom
	end

.Declined:
	writetext TrainerHouseB1FPleaseComeAgainText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

.FoughtTooManyTimes:
	writetext TrainerHouseB1FSecondChallengeDeniedText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

Movement_EnterTrainerHouseBattleRoom:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	turn_head RIGHT
	step_end

Movement_ExitTrainerHouseBattleRoom:
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Movement_TrainerHouseTurnBack:
	step RIGHT
	turn_head LEFT
	step_end

TrainerHouseB1FIntroText:
	text "Hi. Willkommen in"
	line "unserer"
	cont "ÜBUNGSHALLE."

	para "Einmal pro Tag"
	line "kannst du gegen"
	cont "einen Trainer"
	cont "kämpfen."
	done

TrainerHouseB1FYourOpponentIsText:
	text_ram wStringBuffer3
	text " ist"
	line "heute dein Gegner."
	done

TrainerHouseB1FAskWantToBattleText:
	text "Möchtest du"
	line "kämpfen?"
	done

TrainerHouseB1FGoRightInText:
	text "Geh bitte einfach"
	line "weiter."

	para "Du darfst sofort"
	line "anfangen."
	done

TrainerHouseB1FPleaseComeAgainText:
	text "Nur die Trainer,"
	line "die kämpfen dür-"
	cont "fen, haben"
	cont "Zutritt."
	done

TrainerHouseB1FSecondChallengeDeniedText:
	text "Es tut mir Leid,"
	line "das wäre für dich"

	para "heute der zweite"
	line "Kampf. Es ist aber"

	para "nur ein Kampf pro"
	line "Tag erlaubt."
	done

TrainerHouseB1FCalBeatenText:
	text "Ich habe verloren…"
	line "Mist…"
	done

TrainerHouseB1FCalBeforeText:
	text "Ich bin nur"
	line "hergereist, um"
	cont "gegen dich zu"
	cont "kämpfen."
	done

TrainerHouseB1F_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  4, TRAINER_HOUSE_1F, 3

	db 1 ; coord events
	coord_event  7,  3, SCENE_DEFAULT, TrainerHouseReceptionistScript

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 11, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
