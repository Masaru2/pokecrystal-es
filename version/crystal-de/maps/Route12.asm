INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2


SECTION "maps/Route12", ROMX

Route12_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "Geduld ist das"
	line "Zauberwort. Das"
	cont "gilt fürs Angeln"
	cont "und für #MON."
	done

FisherMartinBeatenText:
	text "Guaah!"
	done

FisherMartinAfterBattleText:
	text "Ich bin zu unge-"
	line "duldig für das"
	cont "Angeln…"
	done

FisherStephenSeenText:
	text "Wenn ich beim"
	line "Angeln Radio hören"
	cont "kann, bin ich"
	cont "glücklich."
	done

FisherStephenBeatenText:
	text "Das blöde Radio"
	line "beunruhigt mich!"
	done

FisherStephenAfterBattleText:
	text "Kennst du schon"
	line "die Radiosender"

	para "aus KANTO? Es gibt"
	line "viele hier."
	done

FisherBarneySeenText:
	text "Was ist in unserem"
	line "alltäglichen Leben"
	cont "am wichtigsten?"
	done

FisherBarneyBeatenText:
	text "Die Antwort gibt"
	line "es demnächst!"
	done

FisherBarneyAfterBattleText:
	text "Meiner Meinung"
	line "nach ist Strom"

	para "das Wichtigste"
	line "in unserem Leben."

	para "Wenn dem nicht so"
	line "wäre, hätten die"

	para "Leute nicht so"
	line "einen Aufstand"

	para "fabriziert, als"
	line "das KRAFTWERK"
	cont "außer Betrieb war."
	done

FisherKyleSeenText:
	text "Erinnerst du dich?"
	done

FisherKyleBeatenText:
	text "Du erinnerst dich?"
	done

FisherKyleAfterBattleText:
	text "Das Reißen an der"
	line "ANGEL, wenn du"

	para "ein #MON"
	line "fangen möchtest…"

	para "Das ist das"
	line "Schönste für einen"
	cont "Angler wie mich."
	done

Route12SignText:
	text "ROUTE 12"
	line "NORDEN: LAVANDIA"
	done

FishingSpotSignText:
	text "ANGELPLATZ"
	done

Route12_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 33, ROUTE_12_SUPER_ROD_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 11, 27, BGEVENT_READ, Route12Sign
	bg_event 13,  9, BGEVENT_READ, FishingSpotSign
	bg_event 14, 13, BGEVENT_ITEM, Route12HiddenElixer

	db 6 ; object events
	object_event  5, 13, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event 14, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 10, 38, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerFisherBarney, -1
	object_event  6,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
