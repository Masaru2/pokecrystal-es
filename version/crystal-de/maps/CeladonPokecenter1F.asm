INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_GENTLEMAN
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F
	const CELADONPOKECENTER1F_EUSINE


SECTION "maps/CeladonPokecenter1F", ROMX

CeladonPokecenter1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonPokecenter1FNurseScript:
	jumpstd pokecenternurse

CeladonPokecenter1FGentlemanScript:
	jumpstd happinesschecknpc

CeladonPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerFText

CeladonPokecenter1FPharmacistScript:
	jumptextfaceplayer CeladonPokecenter1FPharmacistText

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	promptbutton
	setval SUICUNE
	special MonCheck
	iffalse .NoSuicune
	special BeastsCheck
	iftrue .HoOh
	writetext NoBeastsText
	waitbutton
.NoSuicune:
	closetext
	end

.HoOh:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .Location1
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement1
	sjump .Continue

.Location1:
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement2
.Continue:
	disappear CELADONPOKECENTER1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.Movement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.Movement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

CeladonPokecenter1FCooltrainerFText:
	text "ERIKA versteht es"
	line "meisterlich, mit"

	para "Pflanzen-#MON"
	line "umzugehen."

	para "Eine Unachtsamkeit"
	line "wird dir bei ihr"
	cont "übel bekommen."
	done

CeladonPokecenter1FPharmacistText:
	text "Das Versteck von"
	line "TEAM ROCKET befin-"
	cont "det sich im Keller"
	cont "der SPIELHALLE."

	para "Oh, warte. Das war"
	line "vor drei Jahren."
	done

CeladonEusineText1:
	text "EUSIN: Hi!"

	para "Ich komme gerade"
	line "von meinem Heimat-"
	cont "ort zurück. Es ist"
	cont "schon lange her."
	done

EusineLeavesCeladonText:
	text "<PLAYER>, hast du"
	line "das gehört?"

	para "Es gibt neue Ge-"
	line "rüchte über ein"

	para "regenbogenfarbenes"
	line "#MON, dass"

	para "sich am ZINNTURM"
	line "zeigt."

	para "Ich habe mein Team"
	line "gerade heilen las-"
	cont "sen und bin auf"
	cont "dem Weg nach TEAK."

	para "Wir sehen uns spä-"
	line "ter, <PLAYER>!"
	done

NoBeastsText:
	text "Oh, übrigens,"
	line "<PLAYER>."

	para "Hast du die legen-"
	line "dären #MON"

	para "RAIKOU und ENTEI"
	line "gefangen?"

	para "<……><……><……>"

	para "Okay…"

	para "Falls du auch nur"
	line "eines von ihnen"

	para "fängst, gibst du"
	line "mir Bescheid."

	para "Ich zähle auf"
	line "dich, <PLAYER>!"
	done

CeladonPokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CELADON_CITY, 5
	warp_event  4,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FGentlemanScript, -1
	object_event  0,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPharmacistScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerFScript, -1
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_SET_WHEN_FOUGHT_HO_OH
