INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const FUCHSIACITY_YOUNGSTER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE


SECTION "maps/FuchsiaCity", ROMX

FuchsiaCity_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return

FuchsiaCityYoungster:
	jumptextfaceplayer FuchsiaCityYoungsterText

FuchsiaCityPokefanM:
	jumptextfaceplayer FuchsiaCityPokefanMText

FuchsiaCityTeacher:
	jumptextfaceplayer FuchsiaCityTeacherText

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

NoLitteringSign:
	jumptext NoLitteringSignText

FuchsiaCityPokecenterSign:
	jumpstd pokecentersign

FuchsiaCityMartSign:
	jumpstd martsign

FuchsiaCityFruitTree:
	fruittree FRUITTREE_FUCHSIA_CITY

FuchsiaCityYoungsterText:
	text "Einer der TOP VIER"
	line "war früher einmal"

	para "der ARENALEITER in"
	line "FUCHSANIA CITY."
	done

FuchsiaCityPokefanMText:
	text "KOGAs Tochter ist"
	line "jetzt ARENA-"
	cont "LEITERIN, nachdem"

	para "ihr Vater den TOP"
	line "VIER beigetreten"
	cont "ist."
	done

FuchsiaCityTeacherText:
	text "Schade, dass die"
	line "SAFARI-ZONE"

	para "geschlossen ist…"
	line "Das ist schließ-"
	cont "lich FUCHSANIAs"
	cont "Hauptattraktion."
	done

FuchsiaCitySignText:
	text "FUCHSANIA CITY"

	para "Sieh nur! Die"
	line "Rosarote"
	cont "Lieblichkeit!"
	done

FuchsiaGymSignText:
	text "PKMN-ARENA von"
	line "FUCHSANIA CITY"
	cont "LEITUNG: JANINA"

	para "Die Giftige"
	line "Ninja-Meisterin"
	done

SafariZoneOfficeSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "Bis auf weiteres"
	line "bleibt das BÜRO"

	para "der SAFARI-ZONE"
	line "geschlossen."
	done

WardensHomeSignText:
	text "SAFARI-ZONE"
	line "HAUS DES WÄRTERs"
	done

SafariZoneClosedSignText:
	text "Der WÄRTER ist"
	line "verreist. Deshalb"

	para "ist die SAFARI-"
	line "ZONE"
	cont "geschlossen."
	done

NoLitteringSignText:
	text "Verunreinigung des"
	line "Parks ist"
	cont "verboten."

	para "Hinterlasse"
	line "bitte keinen"
	cont "Abfall."
	done

FuchsiaCity_MapEvents::
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event 22, 13, SAFARI_ZONE_MAIN_OFFICE, 1
	warp_event  8, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, BILLS_BROTHERS_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE_BETA, 3 ; inaccessible
	warp_event 37, 22, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 23, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 35, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 35, ROUTE_19_FUCHSIA_GATE, 2

	db 0 ; coord events

	db 8 ; bg events
	bg_event 21, 15, BGEVENT_READ, FuchsiaCitySign
	bg_event  5, 29, BGEVENT_READ, FuchsiaGymSign
	bg_event 25, 15, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 27, 29, BGEVENT_READ, WardensHomeSign
	bg_event 17,  5, BGEVENT_READ, SafariZoneClosedSign
	bg_event 13, 15, BGEVENT_READ, NoLitteringSign
	bg_event 20, 27, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event  6, 13, BGEVENT_READ, FuchsiaCityMartSign

	db 4 ; object events
	object_event 23, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster, -1
	object_event 13,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event 16, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event  8,  1, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFruitTree, -1
