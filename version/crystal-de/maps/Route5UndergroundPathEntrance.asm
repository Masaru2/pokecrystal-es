INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE5UNDERGROUNDPATHENTRANCE_TEACHER


SECTION "maps/Route5UndergroundPathEntrance", ROMX

Route5UndergroundPathEntrance_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route5UndergroundPathEntranceTeacherScript:
	jumptextfaceplayer Route5UndergroundPathEntranceTeacherText

Route5UndergroundPathEntranceTeacherText:
	text "In JOHTO gibt es"
	line "viele historische"

	para "Städte, die ich"
	line "gerne besichtigen"
	cont "würde!"
	done

Route5UndergroundPathEntrance_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ROUTE_5, 1
	warp_event  4,  7, ROUTE_5, 1
	warp_event  4,  3, UNDERGROUND_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route5UndergroundPathEntranceTeacherScript, -1
