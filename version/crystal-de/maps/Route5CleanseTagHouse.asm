INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE5CLEANSETAGHOUSE_GRANNY
	const ROUTE5CLEANSETAGHOUSE_TEACHER


SECTION "maps/Route5CleanseTagHouse", ROMX

Route5CleanseTagHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route5CleanseTagHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue .GotCleanseTag
	writetext Route5CleanseTagHouseGrannyText1
	promptbutton
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
.GotCleanseTag:
	writetext Route5CleanseTagHouseGrannyText2
	waitbutton
.NoRoom:
	closetext
	end

Route5CleanseTagHouseTeacherScript:
	jumptextfaceplayer Route5CleanseTagHouseTeacherText

HouseForSaleBookshelf:
	jumpstd difficultbookshelf

Route5CleanseTagHouseGrannyText1:
	text "Yippi!"

	para "Ich spüre einen"
	line "dunklen Schatten,"
	cont "der über dir"
	cont "schwebt."

	para "Benutze dies, um"
	line "ihn loszuwerden!"
	done

Route5CleanseTagHouseGrannyText2:
	text "Du schwebtest in"
	line "Lebensgefahr!"
	cont "Jetzt bist du"
	cont "in Sicherheit."
	done

Route5CleanseTagHouseTeacherText:
	text "Meine Oma befasst"
	line "sich mit dem"

	para "Vertreiben von,"
	line "wie sie sagt,"
	cont "bösen Geistern."

	para "Es tut mir Leid,"
	line "dass sie dich"
	cont "erschreckt hat."
	done

Route5CleanseTagHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_5, 4
	warp_event  3,  7, ROUTE_5, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, HouseForSaleBookshelf
	bg_event  1,  1, BGEVENT_READ, HouseForSaleBookshelf

	db 2 ; object events
	object_event  2,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseGrannyScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseTeacherScript, -1
