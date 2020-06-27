INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SILVERCAVEPOKECENTER1F_NURSE
	const SILVERCAVEPOKECENTER1F_GRANNY


SECTION "maps/SilverCavePokecenter1F", ROMX

SilverCavePokecenter1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

SilverCavePokecenter1FNurseScript:
	jumpstd pokecenternurse

SilverCavePokecenter1FGrannyScript:
	jumptextfaceplayer SilverCavePokecenter1FGrannyText

SilverCavePokecenter1FGrannyText:
	text "Los entrenadores"
	line "ambiciosos escalan"

	para "el MT. PLATEADO a"
	line "pesar del peligro."

	para "Con sus fieles"
	line "#MON sienten"

	para "que pueden ir a"
	line "cualquier lado…"
	done

SilverCavePokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  4,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FGrannyScript, -1
