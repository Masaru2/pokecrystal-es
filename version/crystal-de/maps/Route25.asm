INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_SUPER_NERD
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL


SECTION "maps/Route25", ROMX

Route25_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE25_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE25_MISTYS_DATE

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

Route25MistyDate1Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efe8
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19efed
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ROUTE25_MISTY, MovementData_0x19effa
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOTHING
	special RestartMapMusic
	end

Route25MistyDate2Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efea
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19eff4
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ROUTE25_MISTY, MovementData_0x19effd
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOTHING
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_KEVIN
	iftrue .AfterBattle
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue .AfterNuggetBridge
	writetext CooltrainermKevinNuggetText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoomForNugget
	setevent EVENT_CLEARED_NUGGET_BRIDGE
.AfterNuggetBridge:
	writetext CooltrainermKevinSeenText
	waitbutton
	closetext
	winlosstext CooltrainermKevinBeatenText, 0
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	opentext
.AfterBattle:
	writetext CooltrainermKevinAfterBattleText
	waitbutton
.NoRoomForNugget:
	closetext
	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_25_HIDDEN_POTION

MovementData_0x19efe8:
	big_step DOWN
	step_end

MovementData_0x19efea:
	big_step DOWN
	big_step DOWN
	step_end

MovementData_0x19efed:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x19eff4:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x19effa:
	step DOWN
	step LEFT
	step_end

MovementData_0x19effd:
	step UP
	step LEFT
	step_end

MovementData_0x19f000:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyDateText:
	text "MISTY: Aww! Warum"
	line "musst du jetzt"

	para "auftauchen und uns"
	line "stören?"

	para "Weißt du, wie"
	line "man Menschen wie"
	cont "dich nennt?"

	para "Plage! Du hast"
	line "richtig gehört,"
	cont "Plage!"

	para "…"

	para "…Oh? Die ORDEN,"
	line "die du hast… Sind"
	cont "das ARENA-ORDEN"
	cont "aus JOHTO?"

	para "Wenn du acht hast,"
	line "musst du gut sein."

	para "O.K. Komm in die"
	line "PKMN-ARENA von"
	cont "AZURIA CITY."

	para "Ich freue mich,"
	line "gegen dich zu"
	cont "kämpfen."

	para "Ich bin MISTY, die"
	line "ARENALEITERIN von"
	cont "AZURIA CITY."
	done

SchoolboyDudleySeenText:
	text "Besiege alle sechs"
	line "Trainer und du"
	cont "erhältst einen"
	cont "wunderbaren Preis!"

	para "Glaubst du, du"
	line "hast das Zeug"
	cont "dazu?"
	done

SchoolboyDudleyBeatenText:
	text "Wow! Gut gemacht."
	done

SchoolboyDudleyAfterBattleText:
	text "Ich gab mein"
	line "Bestes. Ich habe"
	cont "mir nichts"
	cont "vorzuwerfen."
	done

LassEllenSeenText:
	text "Ich bin Numero 2!"
	line "Jetzt wird es"
	cont "ernst!"
	done

LassEllenBeatenText:
	text "Wie konnte ich"
	line "nur verlieren?"
	done

LassEllenAfterBattleText:
	text "Ich habe alles"
	line "gegeben. Ich kann"
	cont "mir nichts"
	cont "vorwerfen."
	done

SchoolboyJoeSeenText:
	text "Ich bin Nummer 3!"
	line "Das wird nicht"
	cont "leicht."
	done

SchoolboyJoeBeatenText:
	text "Oh! Vermöbelt!"
	done

SchoolboyJoeAfterBattleText:
	text "Ich habe alles"
	line "gegeben. Ich kann"
	cont "mir nichts"
	cont "vorwerfen."
	done

LassLauraSeenText:
	text "Der Vierte!"
	line "Bist du müde?"
	done

LassLauraBeatenText:
	text "Auch ich habe"
	line "verloren…"
	done

LassLauraAfterBattleText:
	text "Ich gab mein"
	line "Bestes. Ich habe"
	cont "mir nichts"
	cont "vorzuwerfen."
	done

CamperLloydSeenText:
	text "O.K.! Nummer 5."
	line "Ich zermalme dich!"
	done

CamperLloydBeatenText:
	text "Uff! Zu stark."
	done

CamperLloydAfterBattleText:
	text "Ich gab mein"
	line "Bestes. Ich habe"
	cont "mir nichts"
	cont "vorzuwerfen."
	done

LassShannonSeenText:
	text "Ich bin der"
	line "Letzte, aber ich"
	cont "sage dir, ich bin"
	cont "eine harte Nuss!"
	done

LassShannonBeatenText:
	text "Du machst Witze."
	done

LassShannonAfterBattleText:
	text "Ich gab mein"
	line "Bestes. Ich habe"
	cont "mir nichts"
	cont "vorzuwerfen."
	done

SupernerdPatSeenText:
	text "Uffuffuff…"

	para "Ich habe mit den"
	line "sechs Trainern"
	cont "nichts zu tun."

	para "Ich habe hier auf"
	line "dich gewartet, um"

	para "dich zu besiegen,"
	line "da du nach den"
	cont "vielen Kämpfen"
	cont "müde sein musst."
	done

SupernerdPatBeatenText:
	text "Bist du überhaupt"
	line "nicht müde?"
	done

SupernerdPatAfterBattleText:
	text "Tut mir Leid… Ich"
	line "werde nicht mehr"
	cont "mogeln…"
	done

CooltrainermKevinNuggetText:
	text "Du hast einen"
	line "Kampf mehr be-"
	cont "stritten, als du"

	para "erwartet hast."
	line "Dennoch hast du"
	cont "gewonnen."

	para "Wie versprochen,"
	line "hier ist der"
	cont "Preis."
	done

CooltrainermKevinSeenText:
	text "Nachdem ich ge-"
	line "sehen habe, wie"

	para "du kämpfst, möchte"
	line "ich sehen, wie es"
	cont "mir ergeht."

	para "Wie sieht's aus?"
	line "Ich fordere dich"
	cont "heraus."
	done

CooltrainermKevinBeatenText:
	text "Das war der beste"
	line "Kampf meines"
	cont "Lebens!"
	done

CooltrainermKevinAfterBattleText:
	text "Der Kampf war"
	line "großartig!"

	para "Du und deine #-"
	line "MON seid ein"
	cont "perfektes Team!"
	done

BillsHouseSignText:
	text "KÜSTENHAUS"
	line "BILLs HAUS"
	done

; unused
	text "BILLs HAUS"
	done

Route25_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 47,  5, BILLS_HOUSE, 1

	db 2 ; coord events
	coord_event 42,  6, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate1Script
	coord_event 42,  7, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate2Script

	db 2 ; bg events
	bg_event 45,  5, BGEVENT_READ, BillsHouseSign
	bg_event  4,  5, BGEVENT_ITEM, Route25HiddenPotion

	db 11 ; object events
	object_event 46,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 46, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 16, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEllen, -1
	object_event 21,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyJoe, -1
	object_event 22,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 25,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event 28, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassShannon, -1
	object_event 31,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSupernerdPat, -1
	object_event 37,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, -1
	object_event 32,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
