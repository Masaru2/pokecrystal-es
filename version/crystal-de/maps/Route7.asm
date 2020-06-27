INCLUDE "constants/maps_common.inc"


SECTION "maps/Route7", ROMX

Route7_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

Route7UndergroundPathSignText:
	text "Was steht auf dem"
	line "Flugblatt?"

	para "…Ruppige Trainer"
	line "tragen auf dem"

	para "TUNNELPFAD Kämpfe"
	line "aus."

	para "Da sich die"
	line "Beschwerden der"
	cont "Anwohner häuften,"
	cont "wurde der"
	cont "TUNNELPFAD auf"
	cont "unbestimmte Zeit"
	cont "geschlossen."

	para "ORDNUNGSAMT VON"
	line "PRISMANIA CITY"
	done

Route7LockedDoorText:
	text "Es ist verriegelt…"
	done

Route7_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5, 11, BGEVENT_READ, Route7UndergroundPathSign
	bg_event  6,  9, BGEVENT_READ, Route7LockedDoor

	db 0 ; object events
