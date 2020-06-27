INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE4F_SAILOR
	const OLIVINELIGHTHOUSE4F_LASS


SECTION "maps/OlivineLighthouse4F", ROMX

OlivineLighthouse4F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerLassConnie:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKent:
	trainer SAILOR, KENT, EVENT_BEAT_SAILOR_KENT, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

SailorKentSeenText:
	text "JASMIN muss krank"
	line "vor Sorge um das"
	cont "#MON hier sein."

	para "Man sieht sie"
	line "momentan nicht"
	cont "einmal lächeln."
	done

SailorKentBeatenText:
	text "Ich habe im"
	line "Moment auch nichts"
	cont "zu lachen…"
	done

SailorKentAfterBattleText:
	text "Apropos krank: Mir"
	line "ist zu Ohren"

	para "gekommen, dass es"
	line "in ANEMONIA CITY"
	cont "eine gute APOTHEKE"
	cont "geben soll."
	done

LassConnie1SeenText:
	text "JASMIN ist die"
	line "ARENALEITERIN in"
	cont "dieser Stadt."

	para "Ich möchte, dass"
	line "sie mit mir"
	cont "zurückkommt."

	para "Es ist besser,"
	line "niemand stellt"
	cont "sich mir in den"
	cont "Weg!"
	done

LassConnie1BeatenText:
	text "Uh! Meine #MON!"
	done

LassConnie1AfterBattleText:
	text "O.K. Jeder wäre"
	line "besorgt, wenn"
	cont "seine #MON"
	cont "verletzt sind."

	para "Ich werde für das"
	line "#MON beten,"

	para "dann kann JASMIN"
	line "in die PKMN-ARENA"
	cont "zurückkehren."
	done

OlivineLighthouse4F_MapEvents::
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_3F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_5F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_5F, 3
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_3F, 3
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_3F, 6
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_3F, 7
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_3F, 8
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_3F, 9
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_5F, 4
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_5F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorKent, -1
	object_event 11,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
