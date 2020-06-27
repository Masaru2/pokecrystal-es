INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F


SECTION "maps/MahoganyPokecenter1F", ROMX

MahoganyPokecenter1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd pokecenternurse

MahoganyPokecenter1FPokefanMScript:
	jumptextfaceplayer MahoganyPokecenter1FPokefanMText

MahoganyPokecenter1FYoungsterScript:
	jumptextfaceplayer MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FCooltrainerFScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerFText

MahoganyPokecenter1FPokefanMText:
	text "Wie? TEAM ROCKET"
	line "ist wieder da?"

	para "Ich sah einige"
	line "Männer in Schwarz"
	cont "am SEE DES ZORNS…"
	done

MahoganyPokecenter1FYoungsterText:
	text "Ich verhindere,"
	line "dass sich meine"
	cont "#MON zu"
	cont "rasch entwickeln."

	para "Ich bringe ihnen"
	line "verschiedene"
	cont "Attacken bei, be-"
	cont "vor ich sie sich"
	cont "entwickeln lasse."
	done

MahoganyPokecenter1FCooltrainerFText:
	text "#MON werden"
	line "stärker, wenn sie"

	para "sich entwickeln."
	line "Aber sie erlernen"

	para "neue Attacken auch"
	line "langsamer."
	done

MahoganyPokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, MAHOGANY_TOWN, 4
	warp_event  4,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerFScript, -1
