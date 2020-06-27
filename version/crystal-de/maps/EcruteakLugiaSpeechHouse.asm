INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER


SECTION "maps/EcruteakLugiaSpeechHouse", ROMX

EcruteakLugiaSpeechHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakLugiaSpeechHouseGrampsScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseGrampsText

EcruteakLugiaSpeechHouseYoungsterScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseYoungsterText

LugiaSpeechHouseRadio:
	jumpstd radio2

EcruteakLugiaSpeechHouseGrampsText:
	text "Dies geschah, als"
	line "ich jung war."

	para "Der Himmel färbte"
	line "sich schwarz. Ein"

	para "riesiges, fliegen-"
	line "des #MON"

	para "verdunkelte die"
	line "Sonne."

	para "Ich frage mich,"
	line "was das für ein"

	para "#MON war. Es"
	line "war wie ein Vogel"
	cont "und ein Drache."
	done

EcruteakLugiaSpeechHouseYoungsterText:
	text "Ob es wirklich ein"
	line "so großes #MON"

	para "gibt? Wenn ja, so"
	line "muss es unfassbar"
	cont "mächtig sein."
	done

EcruteakLugiaSpeechHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, LugiaSpeechHouseRadio

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseGrampsScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseYoungsterScript, -1
