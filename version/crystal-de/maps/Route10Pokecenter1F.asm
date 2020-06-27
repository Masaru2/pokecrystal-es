INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE10POKECENTER1F_NURSE
	const ROUTE10POKECENTER1F_GENTLEMAN
	const ROUTE10POKECENTER1F_GYM_GUY
	const ROUTE10POKECENTER1F_COOLTRAINER_F


SECTION "maps/Route10Pokecenter1F", ROMX

Route10Pokecenter1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route10Pokecenter1FNurseScript:
	jumpstd pokecenternurse

Route10Pokecenter1FGentlemanScript:
	jumptextfaceplayer Route10Pokecenter1FGentlemanText

Route10Pokecenter1FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext Route10Pokecenter1FGymGuyText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext Route10Pokecenter1FGymGuyText_ReturnedMachinePart
	waitbutton
	closetext
	end

Route10Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route10Pokecenter1FCooltrainerFText

Route10Pokecenter1FGentlemanText:
	text "Ein #MON-CENTER"
	line "neben einem"
	cont "Tunnel?"

	para "Das ist sehr"
	line "praktisch."
	done

Route10Pokecenter1FGymGuyText:
	text "Der DIREKTOR des"
	line "KRAFTWERKs sucht"

	para "einen starken"
	line "#MON-Trainer."

	para "Er braucht Hilfe"
	line "bei der Suche nach"

	para "einem gestohlenen"
	line "Gegenstand."
	done

Route10Pokecenter1FGymGuyText_ReturnedMachinePart:
	text "Ich hörte, dass"
	line "TEAM ROCKET sich"

	para "in JOHTO re-"
	line "formierte, aber"
	cont "kurz danach wieder"
	cont "zerschlagen wurde."

	para "Darüber weiß ich"
	line "leider nichts."
	done

Route10Pokecenter1FCooltrainerFText:
	text "Wenn du das"
	line "Gebäude verlässt,"

	para "kannst du das Dach"
	line "eines großen"
	cont "Hauses sehen."

	para "Das ist das"
	line "KRAFTWERK."
	done

Route10Pokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ROUTE_10_NORTH, 1
	warp_event  4,  7, ROUTE_10_NORTH, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FGentlemanScript, -1
	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FGymGuyScript, -1
	object_event  1,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FCooltrainerFScript, -1
