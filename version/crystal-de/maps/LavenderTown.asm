INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER


SECTION "maps/LavenderTown", ROMX

LavenderTown_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	return

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd pokecentersign

LavenderMartSignText:
	jumpstd martsign

LavenderTownPokefanMText:
	text "Ein recht beein-"
	line "druckendes"
	cont "Gebäude, nicht?"

	para "Das ist der RADIO-"
	line "TURM von KANTO."
	done

LavenderTownTeacherText:
	text "In KANTO werden"
	line "viele, gute Radio-"
	cont "programme"
	cont "gesendet."
	done

LavenderTownGrampsText:
	text "Die Leute kommen"
	line "von überall her,"

	para "um den Seelen"
	line "dahingegangener"
	cont "#MON Respekt"
	cont "zu erweisen."
	done

LavenderTownYoungsterText:
	text "Mit einer #-"
	line "FLÖTE weckst du"
	cont "schlafende"
	cont "#MON."

	para "Jeder Trainer muss"
	line "das wissen!"
	done

LavenderTownSignText:
	text "LAVANDIA"

	para "Die Liebliche"
	line "Lilafarbene Stadt"
	done

KantoRadioStationSignText:
	text "KANTO RADIO-"
	line "STATION"

	para "Deine Lieblings-"
	line "programme zu jeder"
	cont "Tages- und Nacht-"
	cont "zeit!"
	done

VolunteerPokemonHouseSignText:
	text "WAISENHAUS für"
	line "#MON"
	cont "von LAVANDIA"
	done

SoulHouseSignText:
	text "RUHESTÄTTE"

	para "Mögen die Seelen"
	line "der #MON hier"
	cont "in Frieden Ruhen"
	done

LavenderTown_MapEvents::
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5,  5, LAVENDER_POKECENTER_1F, 1
	warp_event  5,  9, MR_FUJIS_HOUSE, 1
	warp_event  3, 13, LAVENDER_SPEECH_HOUSE, 1
	warp_event  7, 13, LAVENDER_NAME_RATER, 1
	warp_event  1,  5, LAVENDER_MART, 2
	warp_event 13, 11, SOUL_HOUSE, 1
	warp_event 14,  5, LAV_RADIO_TOWER_1F, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 11,  3, BGEVENT_READ, LavenderTownSign
	bg_event 15,  7, BGEVENT_READ, KantoRadioStationSign
	bg_event  3,  9, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 15, 13, BGEVENT_READ, SoulHouseSign
	bg_event  6,  5, BGEVENT_READ, LavenderPokecenterSignText
	bg_event  2,  5, BGEVENT_READ, LavenderMartSignText

	db 4 ; object events
	object_event 12,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  2, 15, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 14, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event  6, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
