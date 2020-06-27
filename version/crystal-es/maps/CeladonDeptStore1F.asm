INCLUDE "constants/floating_constants.inc"
INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CELADONDEPTSTORE1F_RECEPTIONIST
	const CELADONDEPTSTORE1F_GENTLEMAN
	const CELADONDEPTSTORE1F_TEACHER


SECTION "maps/CeladonDeptStore1F", ROMX, BANK[BANK_MAP_CELADON_DEPT_STORE_1F]

CeladonDeptStore1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore1FReceptionistScript:
	jumptextfaceplayer CeladonDeptStore1FReceptionistText

CeladonDeptStore1FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore1FGentlemanText

CeladonDeptStore1FTeacherScript:
	jumptextfaceplayer CeladonDeptStore1FTeacherText

CeladonDeptStore1FDirectory:
	jumptext CeladonDeptStore1FDirectoryText

CeladonDeptStore1FElevatorButton::
	jumpstd elevatorbutton

CeladonDeptStore1FReceptionistText:
	text "¡Hola! ¡Éste es el"
	line "CENTRO COMERCIAL"
	cont "de CIUDAD AZULONA!"

	para "El directorio está"
	line "en la pared."
	done

CeladonDeptStore1FGentlemanText:
	text "Este C. COMERCIAL"
	line "pertenece a la"

	para "misma cadena que"
	line "el de C. TRIGAL."

	para "Los dos fueron"
	line "renovados al"
	cont "mismo tiempo."
	done

CeladonDeptStore1FTeacherText:
	text "Es la primera vez"
	line "que vengo."

	para "Es muy grande…"

	para "Me da miedo"
	line "perderme."
	done

CeladonDeptStore1FDirectoryText:
	text "PB: INFORMACIÓN"

	para "P1: TIENDA DE"
	line "    ENTRENADORES"

	para "P2: TIENDA DE MT"

	para "P3: REGALOS"

	para "P4: FARMACIA"

	para "P5: AZOTEA"
	done

CeladonDeptStore1F_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 1
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore1FElevatorButton

	db 3 ; object events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FReceptionistScript, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FTeacherScript, -1
