INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER


SECTION "maps/SilphCo1F", ROMX

SilphCo1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue .GotUpGrade
	writetext SilphCoOfficerText
	promptbutton
	verbosegiveitem UP_GRADE
	iffalse .NoRoom
	setevent EVENT_GOT_UP_GRADE
.GotUpGrade:
	writetext SilphCoOfficerText_GotUpGrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoReceptionistText:
	text "Willkommen. Das"
	line "ist das BÜRO-"
	cont "GEBÄUDE der"
	cont "SILPH CO."
	done

SilphCoOfficerText:
	text "Nur das Personal"
	line "hat Zutritt zu den"
	cont "oberen Geschossen."

	para "Aber, da du nun"
	line "schon mal da bist,"

	para "gebe ich dir"
	line "dieses hübsche"
	cont "Souvenir."
	done

SilphCoOfficerText_GotUpGrade:
	text "Das ist das"
	line "neueste Produkt"

	para "der SILPH CO. Das"
	line "gibt es noch nir-"
	cont "gends zu kaufen."
	done

SilphCo1F_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFFRON_CITY, 7
	warp_event  3,  7, SAFFRON_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 13,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
