INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const COPYCATSHOUSE1F_POKEFAN_M
	const COPYCATSHOUSE1F_POKEFAN_F
	const COPYCATSHOUSE1F_CLEFAIRY


SECTION "maps/CopycatsHouse1F", ROMX

CopycatsHouse1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CopycatsHouse1FPokefanMScript:
	jumptextfaceplayer CopycatsHouse1FPokefanMText

CopycatsHouse1FPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CopycatsHouse1FPokefanFText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CopycatsHouse1FPokefanFText_ReturnedMachinePart
	waitbutton
	closetext
	end

CopycatsHouse1FBlisseyScript:
	opentext
	writetext CopycatsHouse1FBlisseyText
	cry BLISSEY
	waitbutton
	closetext
	end

CopycatsHouse1FPokefanMText:
	text "Meine Tochter"
	line "macht gerne"
	cont "Menschen nach."

	para "Dieses Hobby hat"
	line "ihr den Spitznamen"

	para "NACHAHMERIN einge-"
	line "bracht."
	done

CopycatsHouse1FPokefanFText:
	text "Meine Tochter ist"
	line "sehr ichbezogenâ€¦"

	para "Sie hat nur wenige"
	line "Freunde."
	done

CopycatsHouse1FPokefanFText_ReturnedMachinePart:
	text "Vor kurzem hat sie"
	line "ihre #PUPPE,"

	para "die ihr ein Junge"
	line "vor drei Jahren"

	para "geschenkt hat,"
	line "verloren."

	para "Ihre Nachahmerei"
	line "ist seitdem sogar"
	cont "noch besser"
	cont "gewordenâ€¦"
	done

CopycatsHouse1FBlisseyText:
	text "HEITEIRA: Teirii!"
	done

CopycatsHouse1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, SAFFRON_CITY, 8
	warp_event  3,  7, SAFFRON_CITY, 8
	warp_event  2,  0, COPYCATS_HOUSE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanMScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanFScript, -1
	object_event  6,  6, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FBlisseyScript, -1
