INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_M
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F
	const SAFFRONCITY_FISHER
	const SAFFRONCITY_YOUNGSTER1
	const SAFFRONCITY_YOUNGSTER2
	const SAFFRONCITY_LASS2


SECTION "maps/SaffronCity", ROMX

SaffronCity_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	return

SaffronCityLass1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityLass1Text
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityLass1Text_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityPokefanMText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityPokefanMText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityCooltrainerMScript:
	jumptextfaceplayer SaffronCityCooltrainerMText

SaffronCityCooltrainerFScript:
	jumptextfaceplayer SaffronCityCooltrainerFText

SaffronCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityFisherText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityFisherText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityYoungster1Script:
	jumptextfaceplayer SaffronCityYoungster1Text

SaffronCityYoungster2Script:
	jumptextfaceplayer SaffronCityYoungster2Text

SaffronCityLass2Script:
	jumptextfaceplayer SaffronCityLass2Text

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokecenterSign:
	jumpstd pokecentersign

SaffronCityMartSign:
	jumpstd martsign

SaffronCityLass1Text:
	text "Aqu?? vive una ni??a"
	line "que es experta en"
	cont "imitar a la gente."

	para "Imita incluso a la"
	line "gente con la que"

	para "habla, y te"
	line "confunde."
	done

SaffronCityLass1Text_ReturnedMachinePart:
	text "La COPIONA parec??a"
	line "muy triste."

	para "Hab??a perdido"
	line "su # MU??ECO"
	cont "CLEFAIRY favorito."
	done

SaffronCityPokefanMText:
	text "??Eres de JOHTO?"

	para "Si funcionara el"
	line "MAGNETOTR??N, no"

	para "tardar??as nada en"
	line "volver a casa."
	done

SaffronCityPokefanMText_ReturnedMachinePart:
	text "??Eres de JOHTO?"

	para "Con el MAGNETOTR??N"
	line "enseguida estar??s"
	cont "en casa."
	done

SaffronCityCooltrainerMText:
	text "Iba al GIMNASIO"
	line "a luchar contra"
	cont "entrenadores???"

	para "Y acab?? en el"
	line "viejo GIMNASIO que"
	cont "hay al lado."

	para "??Vaya, qu??"
	line "verg??enza pas??!"
	done

SaffronCityCooltrainerFText:
	text "Es SILPH S.A.,"
	line "famosa por sus"
	cont "art??culos #MON."

	para "En el pasado, el"
	line "TEAM ROCKET quiso"

	para "hacerse con esta"
	line "compa????a por esa"
	cont "misma raz??n."
	done

SaffronCityFisherText:
	text "????am, ??am!"

	para "Dicen que en la"
	line "CENTRAL ENERG??A"

	para "tienen muchos"
	line "problemas."

	para "????am, ??am!"
	done

SaffronCityFisherText_ReturnedMachinePart:
	text "????am, ??am!"

	para "Dicen que hay"
	line "problemas en la"
	cont "CENTRAL ENERG??A."

	para "????am, ??am!"
	line "??Estoy lleno!"
	done

SaffronCityYoungster1Text:
	text "Entrar por primera"
	line "vez en un callej??n"

	para "me pone un poco"
	line "nervioso."
	done

SaffronCityYoungster2Text:
	text "En CIUDAD VERDE"
	line "hay un lugar"

	para "llamado la CASA"
	line "del ENTRENADOR,"

	para "donde se re??ne"
	line "gente de todas"
	cont "partes."
	done

SaffronCityLass2Text:
	text "Nuestra ciudad"
	line "sali?? en un"
	cont "programa de radio."

	para "Est?? bien o??r"
	line "alabanzas sobre tu"

	para "ciudad, pero"
	line "tambi??n da un poco"
	cont "de verg??enza."
	done

SaffronCitySignText:
	text "CIUDAD AZAFR??N"

	para "La brillante y"
	line "dorada tierra del"
	cont "comercio"
	done

SaffronGymSignText:
	text "L??DER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "AZAFR??N: SABRINA"

	para "Maestra de los"
	line "#MON ps??quicos"
	done

FightingDojoSignText:
	text "??Bienvenidos!"
	line "DOJO-KARATE"
	done

SilphCoSignText:
	text "EDIFICIO-OFICINAS"
	line "SILPH S.A."
	done

MrPsychicsHouseSignText:
	text "CASA DEL"
	line "SR. PS??QUICO"
	done

SaffronCityMagnetTrainStationSignText:
	text "ESTACI??N DEL"
	line "MAGNETOTR??N DE"
	cont "CIUDAD AZAFR??N"
	done

SaffronCity_MapEvents::
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  8,  3, SAFFRON_MAGNET_TRAIN_STATION, 2
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  3, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 24, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 25, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 33, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 33, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 22, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 23, ROUTE_8_SAFFRON_GATE, 2

	db 0 ; coord events

	db 8 ; bg events
	bg_event 21,  5, BGEVENT_READ, SaffronCitySign
	bg_event 33,  5, BGEVENT_READ, SaffronGymSign
	bg_event 25,  5, BGEVENT_READ, FightingDojoSign
	bg_event 15, 21, BGEVENT_READ, SilphCoSign
	bg_event 25, 29, BGEVENT_READ, MrPsychicsHouseSign
	bg_event 11,  5, BGEVENT_READ, SaffronCityMagnetTrainStationSign
	bg_event 10, 29, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 26, 11, BGEVENT_READ, SaffronCityMartSign

	db 8 ; object events
	object_event  7, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 19, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerMScript, -1
	object_event 20, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerFScript, -1
	object_event 27, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster1Script, -1
	object_event 35, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster2Script, -1
	object_event 19,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityLass2Script, -1
