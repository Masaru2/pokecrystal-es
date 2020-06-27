INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2


SECTION "maps/Route3", ROMX

Route3_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText

FirebreatherOtisSeenText:
	text "Ah! Das Wetter"
	line "ist so schön"
	cont "wie immer."
	done

FirebreatherOtisBeatenText:
	text "Die Sonne scheint,"
	line "dennoch bin ich"
	cont "nass…"
	done

FirebreatherOtisAfterBattleText:
	text "Bei Regen ist"
	line "eine Zündung sehr"
	cont "schwierig…"
	done

YoungsterWarrenSeenText:
	text "Hmmm… Ich weiß"
	line "nicht, was ich"
	cont "tun soll…"
	done

YoungsterWarrenBeatenText:
	text "Ich wusste es…"
	done

YoungsterWarrenAfterBattleText:
	text "Du hast gleich"
	line "einen starken"
	cont "Eindruck gemacht."

	para "Ich hatte Angst,"
	line "gegen dich zu"
	cont "kämpfen…"
	done

YoungsterJimmySeenText:
	text "Ich bin schnell"
	line "wie der Wind!"
	done

YoungsterJimmyBeatenText:
	text "Hinfortgeweht!"
	done

YoungsterJimmyAfterBattleText:
	text "Ich trage das"
	line "ganze Jahr Shorts."

	para "Das ist meine"
	line "Auffassung von"
	cont "Mode."
	done

FirebreatherBurtSeenText:
	text "Komm schnell her"
	line "und schau!"
	done

FirebreatherBurtBeatenText:
	text "Wow! Das ist heiß!"
	done

FirebreatherBurtAfterBattleText:
	text "Ich bin der beste"
	line "Feuerspucker"
	cont "in KANTO."

	para "Aber nicht der"
	line "beste Trainer…"
	done

Route3MtMoonSquareSignText:
	text "MONDBERGPLATZ"

	para "Geh einfach die"
	line "Treppe hoch"
	done

Route3_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 52,  1, MOUNT_MOON, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 49, 13, BGEVENT_READ, Route3MtMoonSquareSign

	db 4 ; object events
	object_event 26, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 10,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 16,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 49,  5, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
