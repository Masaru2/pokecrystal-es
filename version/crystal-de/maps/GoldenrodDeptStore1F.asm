INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN


SECTION "maps/GoldenrodDeptStore1F", ROMX

GoldenrodDeptStore1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStore1FReceptionistScript:
	jumptextfaceplayer GoldenrodDeptStore1FReceptionistText

GoldenrodDeptStore1FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore1FGentlemanText

GoldenrodDeptStore1FPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStore1FPokefanFText

GoldenrodDeptStore1FBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStore1FBugCatcherText

GoldenrodDeptStore1FDirectory:
	jumptext GoldenrodDeptStore1FDirectoryText

GoldenrodDeptStore1FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore1FReceptionistText:
	text "Willkommen im"
	line "KAUFHAUS von"
	cont "DUKATIA CITY."
	done

GoldenrodDeptStore1FGentlemanText:
	text "Das KAUFHAUS"
	line "bietet eine große"
	cont "Auswahl."

	para "Aber einige Items"
	line "erhält man nur als"

	para "Preis in der"
	line "SPIELHALLE."
	done

GoldenrodDeptStore1FPokefanFText:
	text "Ich freue mich"
	line "heute schon wieder"
	cont "aufs Einkaufen!"
	done

GoldenrodDeptStore1FBugCatcherText:
	text "Mama ist sehr gut"
	line "im Schnäppchen-"
	cont "finden."

	para "Sie kauft ständig"
	line "Waren unter dem"
	cont "Normalpreis."
	done

GoldenrodDeptStore1FDirectoryText:
	text "EG INFO-SCHALTER"

	para "1S TRAINER-"
	line "   MARKT"

	para "2S KAMPF-"
	line "   KOLLEKTION"

	para "3S ARZNEI"

	para "4S TM-ECKE"

	para "5S PLATZ DER"
	line "   EWIGEN STILLE"

	para "DACHTERRASSEN"
	line "AUSSICHTSPLATTFORM"
	done

GoldenrodDeptStore1F_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, GOLDENROD_CITY, 9
	warp_event  8,  7, GOLDENROD_CITY, 9
	warp_event 15,  0, GOLDENROD_DEPT_STORE_2F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore1FElevatorButton

	db 4 ; object events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FReceptionistScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FPokefanFScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FBugCatcherScript, -1
	object_event 11,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FGentlemanScript, -1
