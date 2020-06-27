INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CHERRYGROVEGYMSPEECHHOUSE_POKEFAN_M
	const CHERRYGROVEGYMSPEECHHOUSE_BUG_CATCHER


SECTION "maps/CherrygroveGymSpeechHouse", ROMX

CherrygroveGymSpeechHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveGymSpeechHousePokefanMScript:
	jumptextfaceplayer CherrygroveGymSpeechHousePokefanMText

CherrygroveGymSpeechHouseBugCatcherScript:
	jumptextfaceplayer CherrygroveGymSpeechHouseBugCatcherText

CherrygroveGymSpeechHouseBookshelf:
	jumpstd picturebookshelf

CherrygroveGymSpeechHousePokefanMText:
	text "Möchtest du he-"
	line "rausfinden, wie"

	para "gut du als #-"
	line "MON-Trainer bist?"

	para "Dann solltest du"
	line "alle #MON ARE-"
	cont "NEN in JOHTO auf-"
	cont "suchen und ORDEN"
	cont "sammeln."
	done

CherrygroveGymSpeechHouseBugCatcherText:
	text "Wenn ich älter"
	line "bin, werde ich"
	cont "auch ein ARENA-"
	cont "LEITER!"

	para "Ich werde meine"
	line "#MON gegen"

	para "die meiner Freunde"
	line "antreten lassen,"

	para "damit sie stärker"
	line "werden!"
	done

CherrygroveGymSpeechHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 3
	warp_event  3,  7, CHERRYGROVE_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHousePokefanMScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHouseBugCatcherScript, -1
