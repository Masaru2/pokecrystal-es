INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE28STEELWINGHOUSE_CELEBRITY
	const ROUTE28STEELWINGHOUSE_FEAROW


SECTION "maps/Route28SteelWingHouse", ROMX

Route28SteelWingHouse_MapScripts::
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

Celebrity:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM47_STEEL_WING
	iftrue .AlreadyGotItem
	writetext CelebrityText1
	promptbutton
	verbosegiveitem TM_STEEL_WING
	iffalse .Done
	setevent EVENT_GOT_TM47_STEEL_WING
.Done:
	closetext
	end
.AlreadyGotItem:
	writetext CelebrityText2
	waitbutton
	closetext
	end

CelebritysFearow:
	opentext
	writetext CelebritysFearowText
	cry FEAROW
	waitbutton
	closetext
	end

CelebrityHouseBookshelf:
	jumpstd magazinebookshelf

CelebrityText1:
	text "Oh, du hast"
	line "mich gefunden."

	para "Bitte erzähl"
	line "niemandem von mir."

	para "Ich gebe dir dies,"
	line "wenn du mich nicht"
	cont "verrätst. Bitte?"
	done

CelebrityText2:
	text "Es ist hart, so"
	line "berühmt zu sein."

	para "Wo immer ich auch"
	line "hingehe, die Leute"
	cont "folgen mir."

	para "Ich möchte nur"
	line "meine Ruhe haben…"
	done

CelebritysFearowText:
	text "IBITAK: Ibitaag!"
	done

Route28SteelWingHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_28, 1
	warp_event  3,  7, ROUTE_28, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CelebrityHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CelebrityHouseBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Celebrity, -1
	object_event  6,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CelebritysFearow, -1
