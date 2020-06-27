INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE8_BIKER1
	const ROUTE8_BIKER2
	const ROUTE8_BIKER3
	const ROUTE8_SUPER_NERD1
	const ROUTE8_SUPER_NERD2
	const ROUTE8_FRUIT_TREE


SECTION "maps/Route8", ROMX

Route8_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDwayneAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerHarrisAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdTom:
	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdTomAfterBattleText
	waitbutton
	closetext
	end

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8FruitTree:
	fruittree FRUITTREE_ROUTE_8

BikerDwayneSeenText:
	text "Wir repräsentieren"
	line "die #MON-"
	cont "TRAINERGILDE aus"
	cont "KANTO."

	para "Hier kommst du"
	line "unter die Räder!"
	done

BikerDwayneBeatenText:
	text "En-entschuldigung!"
	done

BikerDwayneAfterBattleText:
	text "Die #MON-"
	line "TRAINERGILDE aus"
	cont "KANTO wird"
	cont "immer existieren!"
	done

BikerHarrisSeenText:
	text "Das ORDNUNGSAMT"
	line "hat unseren"

	para "TUNNELPFAD zu-"
	line "schütten lassen."
	cont "Das ängstigt mich!"
	done

BikerHarrisBeatenText:
	text "V-vergib mir!"
	done

BikerHarrisAfterBattleText:
	text "Vermöbelt von"
	line "einem Rowdy aus"
	cont "JOHTO…"
	done

BikerZekeSeenText:
	text "Wir sind die"
	line "#MON-TRAINER-"
	cont "GILDE aus KANTO!"
	cont "Nimm dich in Acht!"
	done

BikerZekeBeatenText:
	text "Uah! Entschuldige!"
	done

BikerZekeAfterBattleText:
	text "Wir versuchen,"
	line "ab jetzt niemanden"
	cont "mehr zu stören…"
	done

SupernerdSamSeenText:
	text "Wie funktioniert"
	line "der MAGNETZUG?"
	done

SupernerdSamBeatenText:
	text "Ich möchte nur den"
	line "MAGNETZUG sehen…"
	done

SupernerdSamAfterBattleText:
	text "Die Kraft von"
	line "Magneten ist"
	cont "beeindruckend!"
	done

SupernerdTomSeenText:
	text "Hm… Du hast"
	line "viele ORDEN."
	done

SupernerdTomBeatenText:
	text "Wie ich dachte…"
	line "Du bist stark!"
	done

SupernerdTomAfterBattleText:
	text "ORDEN verschaffen"
	line "dir im Kampf"
	cont "Vorteile."
	done

Route8LockedDoorText:
	text "Es ist verriegelt…"
	done

Route8UndergroundPathSignText:
	text "Das Flugblatt ist"
	line "zerrissen."

	para "Es ist nicht mehr"
	line "lesbar…"
	done

Route8_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  4, ROUTE_8_SAFFRON_GATE, 3
	warp_event  4,  5, ROUTE_8_SAFFRON_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  7, BGEVENT_READ, Route8UndergroundPathSign
	bg_event 10,  5, BGEVENT_READ, Route8LockedDoor

	db 6 ; object events
	object_event 10,  8, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerBikerDwayne, -1
	object_event 10,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerBikerHarris, -1
	object_event 10, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBikerZeke, -1
	object_event 23,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdSam, -1
	object_event 31, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdTom, -1
	object_event 33,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8FruitTree, -1
