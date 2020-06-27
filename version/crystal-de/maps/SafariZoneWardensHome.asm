INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SAFARIZONEWARDENSHOME_LASS


SECTION "maps/SafariZoneWardensHome", ROMX

SafariZoneWardensHome_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd picturebookshelf

WardensGranddaughterText1:
	text "Mein Großvater ist"
	line "der WÄRTER in der"
	cont "SAFARI-ZONE."

	para "Zumindest war er"
	line "das…"

	para "Er hat sich ent-"
	line "schieden, Urlaub"

	para "zu machen und ist"
	line "verreist, ganz"
	cont "allein."

	para "Er hat einfach"
	line "so die SAFARI-"
	cont "ZONE verlassen."
	done

WardensGranddaughterText2:
	text "Viele Leute waren"
	line "traurig, dass die"

	para "SAFARI-ZONE ge-"
	line "schlossen wurde."
	cont "Aber Großvater ist"
	cont "so stur…"
	done

WardenPhotoText:
	text "Das Foto zeigt"
	line "einen lächelnden,"

	para "alten Mann umgeben"
	line "von #MON."
	done

SafariZonePhotoText:
	text "Das Foto zeigt"
	line "eine große Wiese,"

	para "auf der seltene"
	line "#MON"
	cont "herumtollen."
	done

SafariZoneWardensHome_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
