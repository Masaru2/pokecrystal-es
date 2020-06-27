INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ILEXFORESTAZALEAGATE_OFFICER
	const ILEXFORESTAZALEAGATE_GRANNY


SECTION "maps/IlexForestAzaleaGate", ROMX

IlexForestAzaleaGate_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

IlexForestAzaleaGateOfficerScript:
	jumptextfaceplayer IlexForestAzaleaGateOfficerText

IlexForestAzaleaGateGrannyScript:
	jumptextfaceplayer IlexForestAzaleaGateGrannyText

IlexForestAzaleaGateOfficerText:
	text "Vorsicht! Verlaufe"
	line "dich nicht! Der"
	cont "STEINEICHENWALD"
	cont "ist groß."
	done

IlexForestAzaleaGateGrannyText:
	text "Der WALD wird von"
	line "seinem"
	cont "Schutzpatron"
	cont "bewacht."

	para "Mach keine"
	line "Dummheiten!"
	done

IlexForestAzaleaGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ILEX_FOREST, 2
	warp_event  0,  5, ILEX_FOREST, 3
	warp_event  9,  4, AZALEA_TOWN, 7
	warp_event  9,  5, AZALEA_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateOfficerScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateGrannyScript, -1
