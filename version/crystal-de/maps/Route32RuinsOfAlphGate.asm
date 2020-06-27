INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE32RUINSOFALPHGATE_OFFICER
	const ROUTE32RUINSOFALPHGATE_POKEFAN_M
	const ROUTE32RUINSOFALPHGATE_YOUNGSTER


SECTION "maps/Route32RuinsOfAlphGate", ROMX

Route32RuinsOfAlphGate_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route32RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route32RuinsOfAlphGateOfficerText

Route32RuinsOfAlphGatePokefanMScript:
	jumptextfaceplayer Route32RuinsOfAlphGatePokefanMText

Route32RuinsOfAlphGateYoungsterScript:
	jumptextfaceplayer Route32RuinsOfAlphGateYoungsterText

Route32RuinsOfAlphGateOfficerText:
	text "ALPH-RUINEN"

	para "Eine Besichti-"
	line "gungsstätte"
	cont "für Touristen."

	para "Versuche, die"
	line "schwenkbaren"

	para "Steintafeln"
	line "zu bewegen!"
	done

Route32RuinsOfAlphGatePokefanMText:
	text "Du untersuchst"
	line "die RUINEN?"

	para "Ich sehe einen"
	line "Wissenschaftler"
	cont "in spe."
	done

Route32RuinsOfAlphGateYoungsterText:
	text "Auf den"
	line "Steintafeln"
	cont "sind Zeichnungen."

	para "Ich versuchte, "
	line "sie zu bewegen."

	para "Ich frage mich, "
	line "was sie"
	cont "darstellen."
	done

Route32RuinsOfAlphGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, RUINS_OF_ALPH_OUTSIDE, 10
	warp_event  0,  5, RUINS_OF_ALPH_OUTSIDE, 11
	warp_event  9,  4, ROUTE_32, 2
	warp_event  9,  5, ROUTE_32, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32RuinsOfAlphGateOfficerScript, -1
	object_event  8,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route32RuinsOfAlphGatePokefanMScript, -1
	object_event  1,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32RuinsOfAlphGateYoungsterScript, -1
