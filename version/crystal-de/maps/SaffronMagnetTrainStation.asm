INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SAFFRONMAGNETTRAINSTATION_OFFICER
	const SAFFRONMAGNETTRAINSTATION_GYM_GUY
	const SAFFRONMAGNETTRAINSTATION_TEACHER
	const SAFFRONMAGNETTRAINSTATION_LASS


SECTION "maps/SaffronMagnetTrainStation", ROMX

SaffronMagnetTrainStation_MapScripts::
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

SaffronMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToGoldenrod
	writetext SaffronMagnetTrainStationOfficerTrainIsntOperatingText
	waitbutton
	closetext
	end

.MagnetTrainToGoldenrod:
	writetext SaffronMagnetTrainStationOfficerAreYouComingOnBoardText
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext SaffronMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval TRUE
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
	writetext SaffronMagnetTrainStationOfficerYouDontHaveAPassText
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText
	waitbutton
	closetext
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement
	opentext
	writetext SaffronMagnetTrainStationOfficerArrivedInSaffronText
	waitbutton
	closetext
	end

SaffronMagnetTrainStationGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronMagnetTrainStationGymGuyText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronMagnetTrainStationTeacherScript:
	jumptextfaceplayer SaffronMagnetTrainStationTeacherText

SaffronMagnetTrainStationLassScript:
	jumptextfaceplayer SaffronMagnetTrainStationLassText

SaffronMagnetTrainStationOfficerApproachTrainDoorMovement:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step LEFT
	step DOWN
	step DOWN
	step_end

SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

SaffronMagnetTrainStationOfficerTrainIsntOperatingText:
	text "Es tut mir Leid,"
	line "aber der MAGNETZUG"
	cont "ist im Moment"
	cont "nicht in Betrieb."
	done

SaffronMagnetTrainStationOfficerAreYouComingOnBoardText:
	text "Abfahrt nach"
	line "DUKATIA CITY in"
	cont "wenigen Minuten."

	para "Steigst du auch"
	line "ein?"
	done

SaffronMagnetTrainStationOfficerRightThisWayText:
	text "Darf ich bitte"
	line "deinen FAHRSCHEIN"
	cont "sehen?"

	para "Danke sehr. Hier"
	line "lang, bitte."
	done

SaffronMagnetTrainStationOfficerYouDontHaveAPassText:
	text "Es tut mir Leid,"
	line "aber du hast"
	cont "keinen FAHRSCHEIN."
	done

SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "Beehre uns"
	line "bald wieder."
	done

SaffronMagnetTrainStationOfficerArrivedInSaffronText:
	text "Ankunft in"
	line "SAFFRONIA CITY."

	para "Beehre uns"
	line "bald wieder."
	done

SaffronMagnetTrainStationGymGuyText:
	text "Der MAGNETZUG"
	line "ist mit modernster"

	para "Technik ausge-"
	line "stattet und"

	para "erreicht durch die"
	line "Nutzung von Elek-"
	cont "trizität und"

	para "Magneten unglaub-"
	line "liche Geschwin-"
	cont "digkeit."

	para "Ohne Elektrizität"
	line "allerdings…"
	done

SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart:
	text "Puh…"

	para "Wie oft bin ich"
	line "von KANTO nach"

	para "JOHTO und zurück"
	line "gefahren?"
	done

SaffronMagnetTrainStationTeacherText:
	text "Bevor der MAGNET-"
	line "ZUG-BAHNHOF erbaut"

	para "wurde, stand dort"
	line "ein Haus."

	para "Ein kleines"
	line "Mädchen, NACH-"
	cont "AHMERIN genannt,"
	cont "lebte dort."
	done

SaffronMagnetTrainStationLassText:
	text "Hi. Hast du einen"
	line "FAHRSCHEIN? Ich"

	para "habe einen. Jeder"
	line "in SAFFRONIA, der"

	para "mit dem MAGNETZUG"
	line "fährt, hat einen."
	done

SaffronMagnetTrainStation_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	db 1 ; coord events
	coord_event 11,  6, SCENE_DEFAULT, Script_ArriveFromGoldenrod

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event 10, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuyScript, -1
	object_event  6, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationTeacherScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  6, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationLassScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
