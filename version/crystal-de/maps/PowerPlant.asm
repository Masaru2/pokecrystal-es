INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUY1
	const POWERPLANT_GYM_GUY2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUY3
	const POWERPLANT_MANAGER
	const POWERPLANT_FOREST


SECTION "maps/PowerPlant", ROMX

PowerPlant_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_POWERPLANT_NOTHING
	scene_script .DummyScene1 ; SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuy2Movement
	turnobject POWERPLANT_GYM_GUY1, DOWN
	turnobject POWERPLANT_GYM_GUY2, DOWN
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOTHING
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantOfficer1AThiefBrokeInText
	waitbutton
	closetext
	end

.MetManager:
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer1HaveToBeefUpSecurityText
	waitbutton
	closetext
	end

PowerPlantGymGuy1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy1SomeoneStoleAPartText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy1GeneratorUpAndRunningText
	waitbutton
	closetext
	end

PowerPlantGymGuy2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy2PowerPlantUpAndRunningText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy2GeneratorIsRunningAgainText
	waitbutton
	closetext
	end

PowerPlantOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantOfficer2ManagerHasBeenSadAndFuriousText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer2ManagerHasBeenCheerfulText
	waitbutton
	closetext
	end

PowerPlantGymGuy4Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy4MagnetTrainConsumesElectricityText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy4WeCanGetMagnetTrainRunningText
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlantManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	promptbutton
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	writetext PowerPlantManagerTakeThisTMText
	promptbutton
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext PowerPlantManagerTM07IsZapCannonText
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext PowerPlantManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd difficultbookshelf

PowerPlantOfficer1ApproachGymGuy2Movement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PowerPlantOfficer1AThiefBrokeInText:
	text "Ein Dieb ist in"
	line "das KRAFTWERK"
	cont "eingebrochen…"

	para "Was geschieht nur"
	line "mit dieser Welt?"
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Ich habe Nachricht"
	line "aus AZURIA CITY."

	para "Eine zwielichtige"
	line "Figur treibt sich"

	para "dort in der"
	line "Umgebung herum."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "Kann ich mit"
	line "deiner Unter-"
	cont "stützung rechnen?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "Wir müssen mehr"
	line "Wachpersonal"
	cont "einstellen."
	done

PowerPlantGymGuy1SomeoneStoleAPartText:
	text "Ein wichtiges Teil"
	line "des Generators"

	para "wurde von dem"
	line "Dieb entwendet."

	para "Ohne dieses Teil"
	line "funktioniert der"
	cont "neue Generator"
	cont "nicht!"
	done

PowerPlantGymGuy1GeneratorUpAndRunningText:
	text "Der Generator"
	line "funktioniert wie-"
	cont "der. Jetzt erzeu-"
	cont "gen wir genügend"
	cont "Energie."
	done

PowerPlantGymGuy2PowerPlantUpAndRunningText:
	text "Das KRAFTWERK"
	line "wurde vor langer"
	cont "Zeit stillgelegt."

	para "Wir haben es"
	line "wieder in Betrieb"

	para "genommen und ver-"
	line "sorgen den MAGNET-"
	cont "ZUG mit Energie."
	done

PowerPlantGymGuy2GeneratorIsRunningAgainText:
	text "Der Generator"
	line "läuft wieder!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "Der DIREKTOR des"
	line "KRAFTWERKs sitzt"
	cont "da vorne."

	para "Seit jemand den"
	line "Generator demo-"
	cont "lierte, ist er"
	cont "traurig und wütend"
	cont "zugleich…"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Seit der Generator"
	line "wieder läuft, ist"

	para "der DIREKTOR"
	line "wieder fröhlich."
	done

PowerPlantGymGuy4MagnetTrainConsumesElectricityText:
	text "Der MAGNETZUG"
	line "verbraucht viel"
	cont "Energie."

	para "Ohne den neuen"
	line "Generator fährt"
	cont "er nicht."
	done

PowerPlantGymGuy4WeCanGetMagnetTrainRunningText:
	text "O.K. Der MAGNET-"
	line "ZUG fährt"

	para "wieder."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "DIREKTOR: Ich, ich"
	line "werde ihm nie"
	cont "verzeihen!"

	para "Wer wagt es,"
	line "meinen Generator"
	cont "zu demolieren?"

	para "Ich habe so lange"
	line "daran gearbeitet!"

	para "Wenn ich den"
	line "erwische, dann"

	para "lernt er meine"
	line "BLITZKANONE"
	cont "kennen!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "DIREKTOR: Das kann"
	line "ich ihm nicht"
	cont "verzeihen!"

	para "Der Schurke kann"
	line "weinen und sich"

	para "entschuldigen, ich"
	line "werde ihn trotzdem"
	cont "bestrafen!"

	para "Uahahaha!"
	done

PowerPlantManagerThatsThePartText:
	text "DIREKTOR: Ah!"
	line "Oh ja!"

	para "Das ist die"
	line "fehlende SPULE"
	cont "meines geliebten"
	cont "Generators! Du"
	cont "hast sie gefunden?"
	done

PowerPlantManagerTakeThisTMText:
	text "Wahah! Danke!"

	para "Als Belohnung gebe"
	line "ich dir diese TM!"
	done

PowerPlantManagerTM07IsZapCannonText:
	text "DIREKTOR: TM07"
	line "enthält BLITZ-"
	cont "KANONE. Eine sehr"

	para "starke Attacke!"
	line "Sie ist nicht sehr"

	para "präzise, aber du"
	line "kannst jemanden"

	para "damit ordentlich"
	line "schmoren!"
	done

PowerPlantManagerMyBelovedGeneratorText:
	text "DIREKTOR: Mein ge-"
	line "liebter Generator!"

	para "Produziere weiter"
	line "viel Energie!"
	done

PowerPlant_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	db 1 ; coord events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, PowerPlantBookshelf
	bg_event  1,  1, BGEVENT_READ, PowerPlantBookshelf

	db 7 ; object events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy1Script, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy4Script, -1
	object_event 14, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
