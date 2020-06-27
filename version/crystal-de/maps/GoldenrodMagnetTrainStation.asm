INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const GOLDENRODMAGNETTRAINSTATION_OFFICER
	const GOLDENRODMAGNETTRAINSTATION_GENTLEMAN


SECTION "maps/GoldenrodMagnetTrainStation", ROMX

GoldenrodMagnetTrainStation_MapScripts::
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

GoldenrodMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToSaffron
	writetext GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText
	waitbutton
	closetext
	end

.MagnetTrainToSaffron:
	writetext GoldenrodMagnetTrainStationOfficerAreYouComingAboardText
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext GoldenrodMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval FALSE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.PassNotInBag:
	writetext GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText
	waitbutton
	closetext
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement
	opentext
	writetext GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText
	waitbutton
	closetext
	end

GoldenrodMagnetTrainStationGentlemanScript:
	jumptextfaceplayer GoldenrodMagnetTrainStationGentlemanText

GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step LEFT
	step DOWN
	step DOWN
	step_end

GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText:
	text "Der Zug ist nicht"
	line "gekommen…"

	para "Ich hab's! Ich"
	line "werde die Passa-"
	cont "giere auf dem"
	cont "Rücken tragen!"

	para "Das wird nicht"
	line "funktionieren."
	done

GoldenrodMagnetTrainStationOfficerAreYouComingAboardText:
	text "Wir werden in Kür-"
	line "ze nach SAFFRONIA"
	cont "CITY abreisen."

	para "Kommst du mit?"
	line ""
	done

GoldenrodMagnetTrainStationOfficerRightThisWayText:
	text "Darf ich deinen"
	line "FAHRSCHEIN sehen?"

	para "O.K. Bitte hier"
	line "entlang."
	done

GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText:
	text "Verzeihung, aber"
	line "du hast keinen"
	cont "FAHRSCHEIN."
	done

GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "Besuche uns"
	line "wieder!"
	done

GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText:
	text "Wir sind in DUKA-"
	line "TIA CITY angekom-"
	cont "men."

	para "Beehre uns bald"
	line "wieder!"
	done

GoldenrodMagnetTrainStationGentlemanText:
	text "Ich bin der PRÄSI-"
	line "DENT."

	para "Mein Traum war es,"
	line "einen Zug zu bau-"
	cont "en, der schneller"

	para "ist als jedes"
	line "#MON."

	para "Dadurch würden"
	line "JOHTO und KANTO"
	cont "näher rücken."
	done

GoldenrodMagnetTrainStation_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 17, GOLDENROD_CITY, 5
	warp_event  9, 17, GOLDENROD_CITY, 5
	warp_event  6,  5, SAFFRON_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, SAFFRON_MAGNET_TRAIN_STATION, 3

	db 1 ; coord events
	coord_event 11,  6, SCENE_DEFAULT, Script_ArriveFromSaffron

	db 0 ; bg events

	db 2 ; object events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationOfficerScript, -1
	object_event 11, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationGentlemanScript, EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
