INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const OLIVINEGOODRODHOUSE_FISHING_GURU


SECTION "maps/OlivineGoodRodHouse", ROMX

OlivineGoodRodHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

OfferGoodRodText:
	text "OLIVIANA CITY"
	line "liegt am Meer!"

	para "Daher sollte man"
	line "dort auch jede"
	cont "Menge Fische fin-"
	cont "den!"

	para "Ich fische hier"
	line "seit 30 Jahren."

	para "Willst du das Meer"
	line "und die Fische"
	cont "sehen?"
	done

GiveGoodRodText:
	text "Ah, hahah!"
	line "Und da haben wir"
	cont "einen neuen"
	cont "Angler!"
	done

GaveGoodRodText:
	text "Fische findet man"
	line "nicht nur im Meer."

	para "Sie sind überall,"
	line "wo es Wasser gibt."
	done

DontWantGoodRodText:
	text "Waaas? Du willst"
	line "nicht fischen!?"
	cont "Unfassbar!"
	done

HaveGoodRodText:
	text "Wie steht's? Den"
	line "großen Fang ge-"
	cont "macht?"
	done

OlivineGoodRodHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
