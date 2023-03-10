INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL


SECTION "maps/EcruteakPokecenter1F", ROMX

EcruteakPokecenter1F_MapScripts::
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	prioritysjump .BillActivatesTimeCapsule
	end

.DummyScene:
	end

.BillActivatesTimeCapsule:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokecenter1F_BillText1
	promptbutton
	sjump .PointlessJump

.PointlessJump:
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	setscene SCENE_FINISHED
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMTextMobile

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuyText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokecenter1F_BillText1:
	text "Hola, soy BILL."
	line "??Qui??n eres t???"
	cont "??Eh? ??<PLAYER>?"

	para "??Has llegado justo"
	line "a tiempo!"
	done

EcruteakPokecenter1F_BillText2:
	text "Ya he terminado de"
	line "ajustar la C??PSULA"
	cont "DEL TIEMPO."

	para "Sabes que puedes"
	line "cambiar #MON,"
	cont "??verdad?"

	para "Mi C??PSULA DEL"
	line "TIEMPO sirve para"

	para "intercambiar"
	line "con el pasado."

	para "Pero no podr??s"
	line "enviar nada que no"

	para "existiera en el"
	line "pasado."

	para "Si lo haces, el PC"
	line "del pasado podr??a"
	cont "estropearse."

	para "As?? que debes"
	line "eliminar cualquier"

	para "cosa que no"
	line "existiera antes."

	para "Esto es, no env??es"
	line "nuevos movimientos"

	para "ni nuevos #MON"
	line "en esta C??PSULA."

	para "No te preocupes."
	line "Ya he acabado"
	cont "de ajustarla."

	para "Ma??ana funcionar??n"
	line "todas las C??PSULAS"

	para "DEL TIEMPO de los"
	line "CENTROS #MON."

	para "Debo volver pronto"
	line "a CIUDAD TRIGAL."
	cont "Mi familia espera."

	para "??Hasta luego!"
	done

EcruteakPokecenter1FPokefanMText:
	text "Las CHICAS KIMONO"
	line "son unas geniales"

	para "bailarinas, adem??s"
	line "de magn??ficas con"
	cont "sus #MON."
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "Seguro que esperas"
	line "luchar con m??s"

	para "gente, ??verdad?"
	line "Parece que hay un"

	para "sitio en el que se"
	line "re??nen los"
	cont "entrenadores."

	para "Te preguntar??s"
	line "d??nde."

	para "Es pasando CIUDAD"
	line "OLIVO."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "MORTI, el L??DER"
	line "del GIMNASIO, es"
	cont "muy bueno."

	para "Y sus #MON son"
	line "muy fuertes."
	done

EcruteakPokecenter1FGymGuyText:
	text "LAGO DE LA FURIA."

	para "Un mont??n de"
	line "GYARADOS???"

	para "??Esto huele a"
	line "conspiraci??n!"
	done

EcruteakPokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuyScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
