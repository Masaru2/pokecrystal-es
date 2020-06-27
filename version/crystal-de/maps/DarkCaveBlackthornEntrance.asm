INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const DARKCAVEBLACKTHORNENTRANCE_PHARMACIST
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL1
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL2


SECTION "maps/DarkCaveBlackthornEntrance", ROMX

DarkCaveBlackthornEntrance_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

DarkCaveBlackthornEntrancePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue .GotBlackglasses
	writetext DarkCaveBlackthornEntrancePharmacistText1
	promptbutton
	verbosegiveitem BLACKGLASSES
	iffalse .PackFull
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
.GotBlackglasses:
	writetext DarkCaveBlackthornEntrancePharmacistText2
	waitbutton
.PackFull:
	closetext
	end

DarkCaveBlackthornEntranceRevive:
	itemball REVIVE

DarkCaveBlackthornEntranceTMSnore:
	itemball TM_SNORE

DarkCaveBlackthornEntrancePharmacistText1:
	text "Wow! Du hast"
	line "mich verwirrt!"

	para "Da ich mein"
	line "SCHATTENGLAS trug,"

	para "habe ich dich"
	line "nicht bemerkt."

	para "Was ich hier"
	line "mache?"

	para "Hey, mach dir"
	line "darüber keine"
	cont "Gedanken."

	para "Ich gebe dir ein"
	line "SCHATTENGLAS"
	cont "und du vergisst,"
	cont "dass du mich"
	cont "gesehen hast,"
	cont "in Ordnung?"
	done

DarkCaveBlackthornEntrancePharmacistText2:
	text "SCHATTENGLAS ver-"
	line "stärkt die Kraft"
	cont "von Unlicht-"
	cont "Attacken."
	done

DarkCaveBlackthornEntrance_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 23,  3, ROUTE_45, 1
	warp_event  3, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveBlackthornEntrancePharmacistScript, -1
	object_event 21, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceRevive, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	object_event  7, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMSnore, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_SNORE
