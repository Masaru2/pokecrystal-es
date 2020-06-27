INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const VIOLETKYLESHOUSE_POKEFAN_M
	const VIOLETKYLESHOUSE_KYLE


SECTION "maps/VioletKylesHouse", ROMX

VioletKylesHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

VioletKylesHousePokefanMScript:
	jumptextfaceplayer VioletKylesHousePokefanMText

Kyle:
	faceplayer
	opentext
	trade NPC_TRADE_KYLE
	waitbutton
	closetext
	end

VioletKylesHousePokefanMText:
	text "A #MON you get"
	line "in a trade grows"
	cont "quickly."

	para "But if you don't"
	line "have the right GYM"

	para "BADGE, they may"
	line "disobey you."
	done

VioletKylesHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, VIOLET_CITY, 6
	warp_event  4,  7, VIOLET_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletKylesHousePokefanMScript, -1
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Kyle, -1
