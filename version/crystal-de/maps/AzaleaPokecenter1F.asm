INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F


SECTION "maps/AzaleaPokecenter1F", ROMX

AzaleaPokecenter1F_MapScripts::
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

AzaleaPokecenter1FNurseScript:
	jumpstd pokecenternurse

AzaleaPokecenter1FGentlemanScript:
	jumptextfaceplayer AzaleaPokecenter1FGentlemanText

AzaleaPokecenter1FFishingGuruScript:
	jumptextfaceplayer AzaleaPokecenter1FFishingGuruText

AzaleaPokecenter1FPokefanFScript:
	jumptextfaceplayer AzaleaPokecenter1FPokefanFText

AzaleaPokecenter1FGentlemanText:
	text "Beherrschen deine"
	line "#MON VM-"
	cont "Attacken?"

	para "Diese Attacken"
	line "können auch einge-"
	cont "setzt werden, wenn"

	para "dein #MON be-"
	line "siegt worden ist."
	done

AzaleaPokecenter1FUnusedText:
; unreferenced
	text "Dieser BILL hat"
	line "das #MON-"
	cont "LAGERUNGS-SYSTEM"
	cont "für PC entwickelt."

	para "Auf BILLs PC kön-"
	line "nen bis zu 20"
	cont "#MON pro BOX"
	cont "gelagert werden."
	done

AzaleaPokecenter1FFishingGuruText:
	text "Auf BILLs PC kön-"
	line "nen bis zu 20"

	para "#MON pro BOX"
	line "gelagert werden."
	done

AzaleaPokecenter1FPokefanFText:
	text "Weißt du über"
	line "APRIKOKOS Be-"
	cont "scheid?"

	para "Brich eine auf,"
	line "höhle sie aus und"

	para "verbinde sie mit"
	line "einer speziellen"
	cont "Vorrichtung."

	para "Dann kannst du"
	line "#MON damit"
	cont "fangen."

	para "Vor der Erfindung"
	line "von #BÄLLEN hat"

	para "jeder APRIKOKOS"
	line "verwendet."
	done

AzaleaPokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, AZALEA_TOWN, 1
	warp_event  4,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FGentlemanScript, -1
	object_event  6,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanFScript, -1
