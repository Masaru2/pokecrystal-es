INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE7SAFFRONGATE_OFFICER


SECTION "maps/Route7SaffronGate", ROMX

Route7SaffronGate_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route7SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedPart
	writetext Route7SaffronGuardPowerPlantText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext Route7SaffronGuardSeriousText
	waitbutton
	closetext
	end

Route7SaffronGuardPowerPlantText:
	text "Hast du von"
	line "dem Vorfall im"
	cont "KRAFTWERK gehört?"

	para "Es liegt östlich"
	line "von hier, nahe"
	cont "LAVANDIA."
	done

Route7SaffronGuardSeriousText:
	text "Ich nehme meinen"
	line "Posten als"
	cont "Wache ernst."

	para "Hey! Du hast"
	line "einen #DEX."

	para "O.K. Du darfst"
	line "passieren."
	done

Route7SaffronGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_7, 1
	warp_event  0,  5, ROUTE_7, 2
	warp_event  9,  4, SAFFRON_CITY, 10
	warp_event  9,  5, SAFFRON_CITY, 11

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7SaffronGuardScript, -1
