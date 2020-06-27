INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE2NUGGETHOUSE_FISHER


SECTION "maps/Route2NuggetHouse", ROMX

Route2NuggetHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route2NuggetHouseFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext Route2NuggetHouseFisherText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext Route2NuggetHouseFisherText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

Route2NuggetHouseBookshelf:
; unused
	jumpstd difficultbookshelf

Route2NuggetHouseFisherText:
	text "Hi! Ich bin froh"
	line "dich zu sehen."

	para "Mich hat schon"
	line "lange Zeit niemand"
	cont "mehr besucht."

	para "Ich bin über-"
	line "glücklich! Das"
	cont "hier ist für dich."
	done

Route2NuggetHouseFisherText_GotNugget:
	text "Das ist ein"
	line "NUGGET."

	para "Ich kann dir keine"
	line "weisen Ratschläge"

	para "mitgeben, das hier"
	line "muss ausreichen!"
	done

Route2NuggetHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_2, 1
	warp_event  3,  7, ROUTE_2, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2NuggetHouseFisherScript, -1
