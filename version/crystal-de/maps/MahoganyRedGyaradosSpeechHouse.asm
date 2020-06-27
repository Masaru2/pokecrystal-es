INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const MAHOGANYREDGYARADOSSPEECHHOUSE_BLACK_BELT
	const MAHOGANYREDGYARADOSSPEECHHOUSE_TEACHER


SECTION "maps/MahoganyRedGyaradosSpeechHouse", ROMX

MahoganyRedGyaradosSpeechHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyRedGyaradosSpeechHouseBlackBeltScript:
	jumptextfaceplayer MahoganyRedGyaradosSpeechHouseBlackBeltText

MahoganyRedGyaradosSpeechHouseTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .RocketsInRadioTower
	writetext MahoganyRedGyaradosSpeechHouseTeacherText
	waitbutton
	closetext
	end

.RocketsInRadioTower:
	writetext MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower
	waitbutton
	closetext
	end

MahoganyRedGyaradosSpeechHouseUnusedBookshelf1:
; unused
	jumpstd picturebookshelf

MahoganyRedGyaradosSpeechHouseUnusedBookshelf2:
; unused
	jumpstd magazinebookshelf

MahoganyRedGyaradosSpeechHouseBlackBeltText:
	text "Ich hörte, dass"
	line "ein rotes GARADOS"

	para "am SEE erschienen"
	line "sein soll."

	para "Das ist seltsam,"
	line "da schon normale"

	para "GARADOS in diesem"
	line "See sehr selten"

	para "sind…"
	done

MahoganyRedGyaradosSpeechHouseTeacherText:
	text "Mein Lieblingspro-"
	line "gramm im Radio?"
	cont "Ich würde sagen"
	cont "#MON-MUSIK."
	done

MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower:
	text "Ich habe Gelächter"
	line "im Radio gehört…"

	para "Das war unheim-"
	line "lich."
	done

MahoganyRedGyaradosSpeechHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, MAHOGANY_TOWN, 2
	warp_event  3,  7, MAHOGANY_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseBlackBeltScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseTeacherScript, -1
