INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU


SECTION "maps/VermilionFishingSpeechHouse", ROMX

VermilionFishingSpeechHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf:
; unused
	jumpstd picturebookshelf

FishingDudeText:
	text "Ich bin der ANG-"
	line "LER, der Ältere"
	cont "der ANGLERBRÜDER."

	para "Hast du den PROFI-"
	line "ANGLER am SEE DES"
	cont "ZORNS getroffen?"

	para "Er träumt davon,"
	line "das größte"

	para "KARPADOR der Welt"
	line "zu sehen."

	para "Falls es dir"
	line "nichts ausmacht,"

	para "könntest du ihm"
	line "jedes KARPADOR"

	para "zeigen, das du"
	line "fängst?"

	para "Wer weiß, viel-"
	line "leicht fängst du"

	para "das KARPADOR"
	line "seiner Träume."
	done

FishingDudesHousePhotoText:
	text "Das ist ein Foto,"
	line "auf dem Angler zu"
	cont "sehen sind…"

	para "Sie haben viel"
	line "Spaß beim Angeln…"
	done

VermilionFishingSpeechHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
