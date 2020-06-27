INCLUDE "constants/maps_common.inc"


SECTION "maps/RedsHouse2F", ROMX

RedsHouse2F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

RedsHouse2FN64Script:
	jumptext RedsHouse2FN64Text

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText

RedsHouse2FN64Text:
	text "<PLAYER> spielt"
	line "N64."

	para "Mach besser"
	line "weiter - du hast"
	cont "keine Zeit zu"
	cont "verlieren!"
	done

RedsHouse2FPCText:
	text "Es sieht aus, als"
	line "wäre er seit"
	cont "langer Zeit nicht"
	cont "mehr benutzt"
	cont "worden…"
	done

RedsHouse2F_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, REDS_HOUSE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  5, BGEVENT_READ, RedsHouse2FN64Script
	bg_event  0,  1, BGEVENT_READ, RedsHouse2FPCScript

	db 0 ; object events
