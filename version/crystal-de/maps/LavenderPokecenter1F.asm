INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER


SECTION "maps/LavenderPokecenter1F", ROMX

LavenderPokecenter1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

LavenderPokecenter1FNurseScript:
	jumpstd pokecenternurse

LavenderPokecenter1FGentlemanScript:
	jumptextfaceplayer LavenderPokecenter1FGentlemanText

LavenderPokecenter1FTeacherScript:
	jumptextfaceplayer LavenderPokecenter1FTeacherText

LavenderPokecenter1FYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavenderPokecenter1FYoungsterText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavenderPokecenter1FYoungsterText_ReturnedMachinePart
	waitbutton
	closetext
	end

LavenderPokecenter1FGentlemanText:
	text "Im Norden von"
	line "LAVANDIA ist der"

	para "FELSTUNNEL. Er"
	line "führt zum"
	cont "KRAFTWERK."
	done

LavenderPokecenter1FTeacherText:
	text "Es gibt eine"
	line "Musiksendung im"
	cont "Radio, die Melo-"
	cont "dien auf der #-"
	cont "FLÖTE sendet."

	para "Ach ja? Ah, dein"
	line "Radio braucht ein"
	cont "ZUSATZSET, damit"
	cont "du das empfangen"
	cont "kannst."
	done

LavenderPokecenter1FYoungsterText:
	text "Wenn das KRAFTWERK"
	line "nicht funktio-"
	cont "niert, läuft der"

	para "MAGNETZUG auch"
	line "nicht…"

	para "Das bedeutet, dass"
	line "auch die RADIO-"
	cont "STATION nicht"

	para "auf Sendung"
	line "gehen kann…"
	done

LavenderPokecenter1FYoungsterText_ReturnedMachinePart:
	text "Der INTENDANT der"
	line "RADIOSTATION war"
	cont "hoch erfreut."

	para "Er sagte, sie"
	line "seien wieder auf"

	para "Sendung, weil das"
	line "KRAFTWERK wieder"
	cont "einwandfrei"
	cont "arbeite."
	done

LavenderPokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, LAVENDER_TOWN, 1
	warp_event  4,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FTeacherScript, -1
	object_event  1,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FYoungsterScript, -1
