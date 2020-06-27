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
	text "Hi, ich bin BILL."
	line "Und wer bist du?"

	para "Hmm, <PLAYER>?"
	line "Du bist gerade zum"
	cont "richtigen Zeit-"
	cont "punkt gekommen."
	done

EcruteakPokecenter1F_BillText2:
	text "Ich bin soeben mit"
	line "den Arbeiten an"
	cont "der ZEITKAPSEL"
	cont "fertig geworden."

	para "Du weißt doch,"
	line "dass man #MON"
	cont "tauschen kann?"

	para "Meine ZEITKAPSEL"
	line "ermöglicht auch"

	para "Tauschhandel in"
	line "der Vergangenheit."

	para "Aber du kannst"
	line "nichts in die Ver-"
	cont "gangenheit senden,"

	para "was damals nicht"
	line "existierte."

	para "Solltest du das"
	line "versuchen, erlei-"
	cont "det der PC in der"
	cont "Vergangenheit ei-"
	cont "nen Absturz."

	para "Also musst du al-"
	line "les entfernen, was"

	para "es in der Vergan-"
	line "genheit nicht gab."

	para "Einfach gesagt: Du"
	line "darfst keine neuen"

	para "Attacken oder"
	line "#MON mit der"

	para "ZEITKAPSEL ver-"
	line "schicken."

	para "Keine Sorge. Ich"
	line "bin jetzt fertig."

	para "Schon morgen wer-"
	line "den ZEITKAPSELN in"

	para "allen #MON-"
	line "CENTERN zur Verfü-"
	cont "gung stehen."

	para "Ich muss zurück"
	line "nach DUKATIA CITY,"
	cont "um meine Freunde"
	cont "zu besuchen."

	para "Tschü-hüs!"
	done

EcruteakPokecenter1FPokefanMText:
	text "Sowohl der Tanz"
	line "der KIMONO-GIRLS"

	para "als auch die Art,"
	line "wie sie ihre #-"
	cont "MON einsetzen, ist"
	cont "wunderbar!"
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "Du hoffst, hier"
	line "mehr Kämpfe zu er-"
	cont "leben, nicht wahr?"

	para "Es gibt offen-"
	line "sichtlich einen"

	para "Ort, an dem sich"
	line "Trainer treffen."

	para "Wo, fragst du?"

	para "Kurz nach"
	line "OLIVIANA CITY."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "JENS, der ARENA-"
	line "LEITER, ist soooo"
	cont "cool."

	para "Auch seine #MON"
	line "sind sehr stark."
	done

EcruteakPokecenter1FGymGuyText:
	text "SEE DES ZORNS…"

	para "Das Erscheinen ei-"
	line "nes GARADOS-"
	cont "Schwarms…"

	para "Das riecht nach"
	line "Verschwörung!"
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
