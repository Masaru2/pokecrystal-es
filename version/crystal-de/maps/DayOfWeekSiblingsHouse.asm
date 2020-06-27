INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const DAYOFWEEKSIBLINGSHOUSE_POKEDEX


SECTION "maps/DayOfWeekSiblingsHouse", ROMX

DayOfWeekSiblingsHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	closetext
	end

DayOfWeekSiblingsHousePokedexText1:
	text "Hier steht etwas"
	line "geschrieben."

	para "Lesen?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "An meine Brüder"
	line "und Schwestern:"

	para "Wir sind stolz"
	line "darauf, #MON-"
	cont "Trainern zu"
	cont "dienen."

	para "Wenn ein Trainer"
	line "mit dir spricht,"
	cont "gib ihm etwas"
	cont "Nützliches."

	para "Eure"
	line "MONJA"

	para "Weiterlesen?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "Montag, MONJA"
	line "ROUTE 40"

	para "Dienstag,"
	line "DIETLINDE"
	cont "ROUTE 29"

	para "Mittwoch, MITKO"
	line "SEE DES ZORNS"

	para "Donnerstag,"
	line "DONATUS"
	cont "ROUTE 36"

	para "Freitag, FRIEDA"
	line "ROUTE 32"

	para "Samstag, SAMSON"
	line "EBENHOLZ CITY"

	para "Sonntag, SONNFRIED"
	line "ROUTE 37"
	done

DayOfWeekSiblingsHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_26, 3
	warp_event  3,  7, ROUTE_26, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1
