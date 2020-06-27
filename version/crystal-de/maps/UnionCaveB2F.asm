INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const UNIONCAVEB2F_ROCKER
	const UNIONCAVEB2F_COOLTRAINER_F1
	const UNIONCAVEB2F_COOLTRAINER_F2
	const UNIONCAVEB2F_POKE_BALL1
	const UNIONCAVEB2F_POKE_BALL2
	const UNIONCAVEB2F_LAPRAS


SECTION "maps/UnionCaveB2F", ROMX

UnionCaveB2F_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Lapras

.Lapras:
	checkflag ENGINE_UNION_CAVE_LAPRAS
	iftrue .NoAppear
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .Appear
.NoAppear:
	disappear UNIONCAVEB2F_LAPRAS
	return

.Appear:
	appear UNIONCAVEB2F_LAPRAS
	return

UnionCaveLapras:
	faceplayer
	cry LAPRAS
	loadwildmon LAPRAS, 20
	startbattle
	disappear UNIONCAVEB2F_LAPRAS
	setflag ENGINE_UNION_CAVE_LAPRAS
	reloadmapafterbattle
	end

TrainerCooltrainermNick:
	trainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermNickAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfGwen:
	trainer COOLTRAINERF, GWEN, EVENT_BEAT_COOLTRAINERF_GWEN, CooltrainerfGwenSeenText, CooltrainerfGwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfGwenAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfEmma:
	trainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerfEmmaSeenText, CooltrainerfEmmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfEmmaAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB2FElixer:
	itemball ELIXER

UnionCaveB2FHyperPotion:
	itemball HYPER_POTION

CooltrainermNickSeenText:
	text "Es gibt zwei"
	line "verschiedene Arten"
	cont "von Menschen."

	para "Jene mit Stil"
	line "und jene ohne."

	para "Zu welcher zählst"
	line "du dich?"
	done

CooltrainermNickBeatenText:
	text "Dein Stil ist"
	line "beeindruckend!"
	done

CooltrainermNickAfterBattleText:
	text "Dein #MON-Stil"
	line "ist imposant und"
	cont "abwechslungsreich,"
	cont "das gebe ich zu."

	para "Du wirst immer"
	line "besser!"
	done

CooltrainerfGwenSeenText:
	text "Ich trainiere"
	line "momentan. Möchtest"
	cont "du kämpfen?"
	done

CooltrainerfGwenBeatenText:
	text "Oh, nein! Du bist"
	line "zu gut für mich."
	done

CooltrainerfGwenAfterBattleText:
	text "Ich werde solange"
	line "trainieren, bis"
	cont "ich besser bin."
	done

CooltrainerfEmmaSeenText:
	text "Für meine Lieb-"
	line "lings-#MON"
	cont "würde ich überall"
	cont "hingehen."

	para "Das würde jeder"
	line "wahre Trainer tun."
	done

CooltrainerfEmmaBeatenText:
	text "Ich kümmere mich"
	line "lieber um meine"
	cont "Babys, aber…!"
	done

CooltrainerfEmmaAfterBattleText:
	text "Nur einmal in"
	line "der Woche kommt"
	cont "ein #MON"
	cont "ans Wasser."

	para "Dieses #MON"
	line "hätte ich gerne"
	cont "gesehen…"
	done

UnionCaveB2F_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  3, UNION_CAVE_B1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 15, 19, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermNick, -1
	object_event  5, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfGwen, -1
	object_event  3, 30, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfEmma, -1
	object_event 16,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FElixer, EVENT_UNION_CAVE_B2F_ELIXER
	object_event 12, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB2FHyperPotion, EVENT_UNION_CAVE_B2F_HYPER_POTION
	object_event 11, 31, SPRITE_SURF, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, UnionCaveLapras, EVENT_UNION_CAVE_B2F_LAPRAS
