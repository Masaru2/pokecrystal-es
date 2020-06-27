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
	text "Wie sehen die"
	line "#MON-CENTER in"
	cont "JOHTO aus?"

	para "…Oh, aha. Sie"
	line "unterscheiden sich"

	para "kaum von denen"
	line "in KANTO."

	para "Ich kann also nach"
	line "JOHTO gehen, ohne"
	cont "mich zu sorgen!"
	done

SaffronPokecenter1FTeacherMobileText:
	text "Wie sehen die"
	line "#MON-CENTER in"
	cont "JOHTO aus?"

	para "…Oh, aha."
	line "Man kann auch über"

	para "große Distanzen"
	line "tauschen?"

	para "Dann sage ich mei-"
	line "nem Freund in"

	para "JOHTO, dass er mir"
	line "ein MARILL fangen"

	para "und dann mit mir"
	line "tauschen soll!"
	done

SaffronPokecenter1FFisherText:
	text "Ich bin gerade"
	line "durch den FELS-"
	cont "TUNNEL gekommen."

	para "Da war irgendetwas"
	line "im Gange beim"
	cont "KRAFTWERK."
	done

SaffronPokecenter1FFisherReturnedMachinePartText:
	text "Die Höhlen stürzen"
	line "leicht ein."

	para "In letzter Zeit"
	line "sind einige Höhlen"

	para "verschwunden. Wie"
	line "die Höhle vor"
	cont "AZURIA CITY."

	para "Für einen Profi-"
	line "WANDERER ist das"
	cont "Grundwissen."
	done

SaffronPokecenter1FYoungsterText:
	text "Die ZENTRALE von"
	line "SILPH CO. und der"

	para "MAGNETZUG-BAHNHOF"
	line "sind sehenswürdige"

	para "Orte in SAFFRONIA"
	line "CITY."
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
