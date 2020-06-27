INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const UNIONCAVE1F_POKEFAN_M1
	const UNIONCAVE1F_SUPER_NERD
	const UNIONCAVE1F_POKEFAN_M2
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_FISHER2
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4


SECTION "maps/UnionCave1F", ROMX

UnionCave1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherRayAfterBattleText
	waitbutton
	closetext
	end

UnionCave1FGreatBall:
	itemball GREAT_BALL

UnionCave1FXAttack:
	itemball X_ATTACK

UnionCave1FPotion:
	itemball POTION

UnionCave1FAwakening:
	itemball AWAKENING

UnionCave1FUnusedSign:
; unused
	jumptext UnionCave1FUnusedSignText

HikerRussellSeenText:
	text "Du bist auf dem"
	line "Weg nach AZALEA"
	cont "CITY, nicht wahr?"

	para "Lass meine #MON"
	line "entscheiden, ob"
	cont "du eines Kampfes"
	cont "würdig bist."
	done

HikerRussellBeatenText:
	text "Oh, oh, oh!"
	done

HikerRussellAfterBattleText:
	text "O.K.! Ich habe"
	line "mich entschieden."

	para "Ich gehe erst,"
	line "wenn meine #MON"
	cont "stärker sind!"
	done

PokemaniacLarrySeenText:
	text "Um #MON zu"
	line "finden, wandere"
	cont "ich durch das"
	cont "Land."

	para "Suchst du auch"
	line "nach #MON?"

	para "Dann bist du"
	line "mein Rivale!"
	done

PokemaniacLarryBeatenText:
	text "Uff. Mein armes"
	line "#MON…"
	done

PokemaniacLarryAfterBattleText:
	text "Jeden Freitag"
	line "kannst du #MON"

	para "in dieser Höhle"
	line "brüllen hören."
	done

HikerDanielSeenText:
	text "Whoa! Was für"
	line "eine Überraschung!"

	para "Ich habe nicht"
	line "erwartet, hier auf"
	cont "jemanden zu"
	cont "treffen!"
	done

HikerDanielBeatenText:
	text "Whoa! Du hast"
	line "es mir gegeben!"
	done

HikerDanielAfterBattleText:
	text "Ich wurde ge-"
	line "nötigt, eine"
	cont "FLEGMONRUTE zu"
	cont "kaufen."

	para "Mir tut das arme"
	line "#MON Leid."
	done

FirebreatherBillSeenText:
	text "ZUBATs SUPERSCHALL"
	line "verwirrt mein"
	cont "#MON noch"
	cont "immer."

	para "Das ärgert mich"
	line "wirklich sehr!"
	done

FirebreatherBillBeatenText:
	text "Ich bin durch!"
	done

FirebreatherBillAfterBattleText:
	text "Am Wochenende"
	line "kannst du #MON"

	para "in dieser Höhle"
	line "brüllen hören."
	done

FirebreatherRaySeenText:
	text "Mit Licht jagt"
	line "einem eine Höhle"
	cont "keine Angst ein."

	para "Bist du stark"
	line "genug, jagen dir"
	cont "#MON keine"
	cont "Angst ein."
	done

FirebreatherRayBeatenText:
	text "BLITZ!"
	done

FirebreatherRayAfterBattleText:
	text "Das Feuer meines"
	line "#MON"
	cont "erleuchtet diese"
	cont "Höhle."
	done

UnionCave1FUnusedSignText:
	text "EINHEITSTUNNEL"
	done

UnionCave1F_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 19, UNION_CAVE_B1F, 3
	warp_event  3, 33, UNION_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_33, 1
	warp_event 17,  3, ROUTE_32, 4

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  3,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event  4, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacLarry, -1
	object_event 11,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerRussell, -1
	object_event 15, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	object_event 14, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 17, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event  4,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	object_event  4, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FPotion, EVENT_UNION_CAVE_1F_POTION
	object_event 12, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
