INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const GUIDEGENTSHOUSE_GRAMPS


SECTION "maps/GuideGentsHouse", ROMX

GuideGentsHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

GuideGentsHouseGuideGent:
	jumptextfaceplayer GuideGentsHouseGuideGentText

GuideGentsHouseBookshelf:
	jumpstd magazinebookshelf

GuideGentsHouseGuideGentText:
	text "Als ich noch ein"
	line "Junge war, war ich"
	cont "ein richtiger"
	cont "Heißsporn!"

	para "Ich gebe dir einen"
	line "Rat: Fange viele"
	cont "#MON!"

	para "Behandle sie alle"
	line "mit Freundlich-"
	cont "keit!"
	done

GuideGentsHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 4
	warp_event  3,  7, CHERRYGROVE_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, GuideGentsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, GuideGentsHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GuideGentsHouseGuideGent, EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
