INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2


SECTION "maps/Route18", ROMX

Route18_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

BirdKeeperBorisSeenText:
	text "Wenn du nach"
	line "#MON suchst,"

	para "musst du ins"
	line "hohe Gras gehen."
	done

BirdKeeperBorisBeatenText:
	text "Yippi!"
	done

BirdKeeperBorisAfterBattleText:
	text "Da du so stark"
	line "bist, muss es"
	cont "Spaß machen, gegen"
	cont "dich zu kämpfen."
	done

BirdKeeperBobSeenText:
	text "Der RADWEG ist"
	line "eine schnelle"
	cont "Abkürzung nach"
	cont "PRISMANIA CITY."
	done

BirdKeeperBobBeatenText:
	text "…Uff!"
	done

BirdKeeperBobAfterBattleText:
	text "Wenn du kein"
	line "FAHRRAD hast,"

	para "darfst du die"
	line "Abkürzung nicht"
	cont "benutzen."
	done

Route18SignText:
	text "ROUTE 18"

	para "PRISMANIA CITY -"
	line "FUCHSANIA CITY"
	done

Route18_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  6, ROUTE_17_ROUTE_18_GATE, 3
	warp_event  2,  7, ROUTE_17_ROUTE_18_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9,  5, BGEVENT_READ, Route18Sign

	db 2 ; object events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
