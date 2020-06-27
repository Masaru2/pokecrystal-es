INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CIANWOODLUGIASPEECHHOUSE_TEACHER
	const CIANWOODLUGIASPEECHHOUSE_LASS
	const CIANWOODLUGIASPEECHHOUSE_TWIN


SECTION "maps/CianwoodLugiaSpeechHouse", ROMX

CianwoodLugiaSpeechHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTeacherText

CianwoodLugiaSpeechHouseLassScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseLassText

CianwoodLugiaSpeechHouseTwinScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTwinText

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd picturebookshelf

CianwoodLugiaSpeechHouseTeacherText:
	text "Du kommst von"
	line "OLIVIANA CITY?"

	para "Hast du auf dem"
	line "Weg hierher die"
	cont "vier Inseln ge-"
	cont "sehen?"

	para "Ich habe gehört,"
	line "dass sich dort ein"
	cont "mythisches Wesen"
	cont "verstecken soll."
	done

CianwoodLugiaSpeechHouseLassText:
	text "Man sagt auch,"
	line "dass man es nur"

	para "sehen kann, wenn"
	line "man einen SILBER-"
	cont "FLÜGEL hat."

	para "Er muss denselben"
	line "Geruch wie diese"
	cont "Kreatur haben."
	done

CianwoodLugiaSpeechHouseTwinText:
	text "Ich hörte, dass"
	line "die Strudel um die"

	para "Inseln von der"
	line "Meereskreatur"
	cont "verursacht werden."

	para "Es könnte einer"
	line "Spezialattacke be-"
	cont "dürfen, um sie"
	cont "zu passieren."
	done

CianwoodLugiaSpeechHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	db 3 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  6,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseLassScript, -1
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTwinScript, -1
