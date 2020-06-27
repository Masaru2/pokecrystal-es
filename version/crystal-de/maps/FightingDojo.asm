INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const FIGHTINGDOJO_BLACK_BELT
	const FIGHTINGDOJO_POKE_BALL


SECTION "maps/FightingDojo", ROMX

FightingDojo_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

FightingDojoBlackBelt:
	jumptextfaceplayer FightingDojoBlackBeltText

FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND

FightingDojoBlackBeltText:
	text "Hallo!"

	para "Der KARATE-"
	line "MEISTER, der"

	para "Leiter des KARATE"
	line "DOJO, übt in einer"
	cont "Höhle in JOHTO."
	done

FightingDojoSign1Text:
	text "Es geschieht, was"
	line "geschehen muss!"
	done

FightingDojoSign2Text:
	text "Feinde, wo man"
	line "hinsieht!"
	done

FightingDojo_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign2

	db 2 ; object events
	object_event  4,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FightingDojoBlackBelt, -1
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
