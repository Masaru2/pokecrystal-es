INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER


SECTION "maps/SaffronPokecenter1F", ROMX

SaffronPokecenter1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronPokecenter1FNurseScript:
	jumpstd pokecenternurse

SaffronPokecenter1FTeacherScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherText

.mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherMobileText

SaffronPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .SolvedKantoPowerCrisis
	writetext SaffronPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext SaffronPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

SaffronPokecenter1FYoungsterScript:
	jumptextfaceplayer SaffronPokecenter1FYoungsterText

SaffronPokecenter1FTeacherText:
	text "¿Cómo son los"
	line "CENTROS #MON"
	cont "de JOHTO?"

	para "Oh… ya veo."
	line "Así que no son tan"

	para "diferentes de los"
	line "de KANTO…"

	para "¡Entonces puedo ir"
	line "a JOHTO sin tener"
	cont "que preocuparme!"
	done

SaffronPokecenter1FTeacherMobileText:
	text "¿Cómo son los"
	line "CENTROS #MON"
	cont "de JOHTO?"

	para "…Oh, ya veo."
	line "Así que permiten"

	para "conectar con gente"
	line "de lejos…"

	para "¡Entonces le diré"
	line "a mi amigo de"

	para "JOHTO que capture"
	line "un MARILL y me lo"
	cont "cambie!"
	done

SaffronPokecenter1FFisherText:
	text "Acabo de cruzar"
	line "el TÚNEL ROCA."

	para "Pasaba algo en la"
	line "CENTRAL ENERGÍA."
	done

SaffronPokecenter1FFisherReturnedMachinePartText:
	text "Las cuevas suelen"
	line "derrumbarse."

	para "Últimamente han"
	line "desaparecido"

	para "varias cuevas,"
	line "como la de"
	cont "CIUDAD CELESTE."

	para "Para un MONTAÑERO"
	line "profesional, eso"
	cont "es obvio."
	done

SaffronPokecenter1FYoungsterText:
	text "La OFICINA CENTRAL"
	line "de SILPH S.A. y"

	para "la ESTACIÓN del"
	line "MAGNETOTRÉN son"

	para "los lugares más"
	line "vistos de AZAFRÁN."
	done

SaffronPokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, SAFFRON_CITY, 4
	warp_event  4,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FTeacherScript, -1
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FFisherScript, -1
	object_event  1,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FYoungsterScript, -1
