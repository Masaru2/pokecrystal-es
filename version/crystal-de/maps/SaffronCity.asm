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
	text "Hier lebt ein"
	line "kleines Mädchen,"

	para "das hervorragend"
	line "Menschen nachahmt."

	para "Sie imitiert sogar"
	line "Menschen, mit"

	para "denen sie sich"
	line "gerade unterhält."

	para "Das ist sehr"
	line "verwirrend."
	done

SaffronCityLass1Text_ReturnedMachinePart:
	text "Die NACHAHMERIN"
	line "sieht unglücklich"

	para "aus. Sie hat ihre"
	line "Lieblings-#-"
	cont "PUPPE - PIEPI -"
	cont "verloren."
	done

SaffronCityPokefanMText:
	text "Du bist von JOHTO"
	line "hergekommen?"

	para "Wenn der MAGNETZUG"
	line "läuft, bist du"
	cont "ganz schnell"
	cont "wieder zu Hause."
	done

SaffronCityPokefanMText_ReturnedMachinePart:
	text "Du kommst aus"
	line "JOHTO?"

	para "Mit dem MAGNETZUG"
	line "bist du ganz"
	cont "schnell wieder"
	cont "zu Hause."
	done

SaffronCityCooltrainerMText:
	text "Ich ging zur PKMN-"
	line "ARENA, weil ich"
	cont "unbedingt kämpfen"
	cont "wollte…"

	para "Wie sich heraus-"
	line "stellte, bin ich"

	para "ausgerechnet in"
	line "der verlassenen"

	para "PKMN-ARENA"
	line "gelandet."

	para "War mir das"
	line "peinlich!"
	done

SaffronCityCooltrainerFText:
	text "Das ist die SILPH"
	line "CO., berühmt für"
	cont "ihre #MON-"
	cont "Artikel."

	para "TEAM ROCKET wollte"
	line "sie wegen dieser"

	para "Waren für sich"
	line "nutzen."
	done

SaffronCityFisherText:
	text "Mampf… Mampf…"

	para "Wie ich höre,"
	line "braut sich da"
	cont "etwas im KRAFTWERK"
	cont "zusammen."

	para "Mampf… Mampf…"
	done

SaffronCityFisherText_ReturnedMachinePart:
	text "Mampf… Mampf…"

	para "Wie ich höre,"
	line "braute sich da"
	cont "etwas im KRAFTWERK"
	cont "zusammen."

	para "Mampf… Mampf…"
	line "Aah, ich bin satt!"
	done

SaffronCityYoungster1Text:
	text "Ich finde es"
	line "unheimlich, wenn"

	para "ich zum ersten Mal"
	line "einen engen Gang"
	cont "betrete."
	done

SaffronCityYoungster2Text:
	text "In VERTANIA CITY"
	line "gibt es ein HAUS"

	para "für TRAINER. Dort"
	line "treffen sich"

	para "Trainer der ganzen"
	line "Welt."
	done

SaffronCityLass2Text:
	text "Über unsere Stadt"
	line "wurde mal im Radio"
	cont "berichtet."

	para "Es ist schön, dass"
	line "für deine Stadt"

	para "geworben wird,"
	line "aber es ist auch"
	cont "ein bisschen"
	cont "peinlich."
	done

SaffronCitySignText:
	text "SAFFRONIA CITY"

	para "Golden Schimmernde"
	line "Stadt des Handels"
	done

SaffronGymSignText:
	text "PKMN-ARENA von"
	line "SAFFRONIA CITY"
	cont "LEITUNG: SABRINA"

	para "Die Meisterin der"
	line "Psycho-#MON!"
	done

FightingDojoSignText:
	text "Willkommen!"
	line "KARATE DOJO"
	done

SilphCoSignText:
	text "SILPH CO."
	line "BÜROGEBÄUDE"
	done

MrPsychicsHouseSignText:
	text "HAUS von"
	line "MR. PSYCHO"
	done

SaffronCityMagnetTrainStationSignText:
	text "SAFFRONIA CITY"
	line "MAGNETZUG-"
	cont "BAHNHOF"
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
