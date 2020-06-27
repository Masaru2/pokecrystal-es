INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE38ECRUTEAKGATE_OFFICER


SECTION "maps/Route38EcruteakGate", ROMX

Route38EcruteakGate_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route38EcruteakGateOfficerScript:
	jumptextfaceplayer Route38EcruteakGateOfficerText

Route38EcruteakGateOfficerText:
	text "Wo sagtest du,"
	line "kommst du her?"

	para "NEUBORKIA?"

	para "PROF. LIND wohnt"
	line "dort,"
	cont "nicht wahr?"

	para "Du hast einen"
	line "langen Weg auf"
	cont "dich genommen, um"
	cont "hierher zu ge-"
	cont "langen."
	done

Route38EcruteakGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_38, 1
	warp_event  0,  5, ROUTE_38, 2
	warp_event  9,  4, ECRUTEAK_CITY, 14
	warp_event  9,  5, ECRUTEAK_CITY, 15

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateOfficerScript, -1
