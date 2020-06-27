INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2


SECTION "maps/LakeOfRage", ROMX

LakeOfRage_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; unusable
	scene_script .DummyScene1 ; unusable

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Wesley

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	return

.Wesley:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	return

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	return

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue .AskAgainForHelp
	opentext
	writetext LakeOfRageLanceForcedToEvolveText
	promptbutton
	faceplayer
	writetext LakeOfRageLanceIntroText
	yesorno
	iffalse .RefusedToHelp
.AgreedToHelp:
	writetext LakeOfRageLanceRadioSignalText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, LakeOfRageLanceTeleportIntoSkyMovement
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.RefusedToHelp:
	writetext LakeOfRageLanceRefusedText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

.AskAgainForHelp:
	faceplayer
	opentext
	writetext LakeOfRageLanceAskHelpText
	yesorno
	iffalse .RefusedToHelp
	sjump .AgreedToHelp

RedGyarados:
	opentext
	writetext LakeOfRageGyaradosCryText
	pause 15
	cry GYARADOS
	closetext
	loadwildmon GYARADOS, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear LAKEOFRAGE_GYARADOS
.NotBeaten:
	reloadmapafterbattle
	opentext
	giveitem RED_SCALE
	waitsfx
	writetext LakeOfRageGotRedScaleText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setscene 0 ; Lake of Rage does not have a scene variable
	appear LAKEOFRAGE_LANCE
	end

LakeOfRageGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext LakeOfRageGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext LakeOfRageGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

LakeOfRageSuperNerdScript:
	jumptextfaceplayer LakeOfRageSuperNerdText

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	opentext
	writetext FishingGurusHouseSignText
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .MagikarpLengthRecord
	waitbutton
	closetext
	end

.MagikarpLengthRecord:
	promptbutton
	special MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRaymondAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLoisAfterBattleText
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	promptbutton
	verbosegiveitem BLACKBELT
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeOfRageElixer:
	itemball ELIXER

LakeOfRageTMDetect:
	itemball TM_DETECT

LakeOfRageHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

LakeOfRageHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY

LakeOfRageHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

LakeOfRageLanceTeleportIntoSkyMovement:
	teleport_from
	step_end

LakeOfRageLanceForcedToEvolveText:
	text "Dieser See ist"
	line "voller GARADOS."
	cont "Aber sonst gibt es"
	cont "hier nichts…"

	para "Die KARPADOR wer-"
	line "den also gezwun-"
	cont "gen, sich zu ent-"
	cont "wickeln…"
	done

LakeOfRageLanceIntroText:
	text "Bist du wegen der"
	line "Gerüchte hier?"

	para "Du bist <PLAYER>?"
	line "Ich bin SIEGFRIED,"

	para "ein Trainer wie"
	line "du."

	para "Ich hörte einige"
	line "Gerüchte. Also kam"

	para "ich hierher, um"
	line "einige Nachfor-"
	cont "schungen anzustel-"
	cont "len…"

	para "Ich habe gesehen,"
	line "wie du kämpfst,"
	cont "<PLAY_G>."

	para "Man kann sagen,"
	line "dass du ein Trai-"
	cont "ner von bemerkens-"
	cont "wertem Format"
	cont "bist."

	para "Würdest du mir bei"
	line "meinen Nachfor-"
	cont "schungen helfen?"
	done

LakeOfRageLanceRadioSignalText:
	text "SIEGFRIED: Exzel-"
	line "lent!"

	para "Es sieht so aus,"
	line "als würde jemand"

	para "die KARPADOR im"
	line "SEE zwingen, sich"
	cont "zu entwickeln."

	para "Die Ursache ist"
	line "das mysteriöse"

	para "Radiosignal aus"
	line "MAHAGONIA CITY."

	para "Ich werde auf dich"
	line "warten, <PLAY_G>."
	done

LakeOfRageLanceRefusedText:
	text "Oh… Solltest du"
	line "deine Meinung än-"
	cont "dern, dann hilf"
	cont "mir bitte."
	done

LakeOfRageLanceAskHelpText:
	text "SIEGFRIED: Na?"
	line "Wirst du mir hel-"
	cont "fen?"
	done

LakeOfRageGyaradosCryText:
	text "GARADOS: Gashaa!"
	done

LakeOfRageGotRedScaleText:
	text "<PLAYER> erhält"
	line "ROTE HAUT."
	done

LakeOfRageGrampsText:
	text "Die GARADOS sind"
	line "wütend!"

	para "Das ist ein böses"
	line "Omen!"
	done

LakeOfRageGrampsText_ClearedRocketHideout:
	text "Haha! Die KARPA-"
	line "DOR beißen!"
	done

LakeOfRageSuperNerdText:
	text "Ich habe gehört,"
	line "dieser See ent-"
	cont "stand durch wüten-"
	cont "de GARADOS."

	para "Ich frage mich, ob"
	line "da eine Verbindung"

	para "zu der momentanen"
	line "Situation besteht!"
	done

LakeOfRageCooltrainerFText:
	text "Täuschen mich mei-"
	line "ne Augen? Ich sah"

	para "ein rotes GARADOS"
	line "im SEE…"

	para "Aber ich dachte,"
	line "GARADOS sind blau!"
	done

FisherAndreSeenText:
	text "Lass die #MON,"
	line "die ich gerade ge-"
	cont "fangen habe,"
	cont "kämpfen!"
	done

FisherAndreBeatenText:
	text "Ich mag zwar ein"
	line "guter Angler sein,"

	para "aber als Trainer"
	line "habe ich versagt…"
	done

FisherAndreAfterBattleText:
	text "Ich werde mich als"
	line "Angler beweisen."
	cont "Ich werde tagein,"
	cont "tagaus #MON"
	cont "fangen."
	done

FisherRaymondSeenText:
	text "Ich kann tun, was"
	line "ich will. Ich fan-"
	cont "ge immer nur die"
	cont "gleichen #MON…"
	done

FisherRaymondBeatenText:
	text "Meine Schnur hat"
	line "sich verheddert…"
	done

FisherRaymondAfterBattleText:
	text "Warum kann ich"
	line "keine guten #-"
	cont "MON fangen?"
	done

CooltrainermAaronSeenText:
	text "Trifft ein Trainer"
	line "auf einen anderen,"

	para "so muss er ihn he-"
	line "rausfordern."

	para "Das ist unsere Be-"
	line "stimmung."
	done

CooltrainermAaronBeatenText:
	text "Wow…"
	line "Toller Kampf!"
	done

CooltrainermAaronAfterBattleText:
	text "#MON und"
	line "ihre Trainer wer-"
	cont "den durch ständi-"
	cont "ges Kämpfen immer"
	cont "stärker."
	done

CooltrainerfLoisSeenText:
	text "Was geschah mit"
	line "dem roten GARADOS?"

	para "Es ist fort?"

	para "Oh, dann bin ich"
	line "umsonst hergekom-"
	cont "men."

	para "Ich weiß was! Lass"
	line "uns kämpfen!"
	done

CooltrainerfLoisBeatenText:
	text "Der war gut!"
	done

CooltrainerfLoisAfterBattleText:
	text "Stell dir vor, ich"
	line "habe ein rosa"
	cont "SMETTBO gesehen!"
	done

MeetWesleyText:
	text "MITKO: Na, wie"
	line "geht es dir?"

	para "Ich bin MITKO von"
	line "Mittwoch. Soll"

	para "heißen, heute ist"
	line "Mittwoch."
	done

WesleyGivesGiftText:
	text "Freut mich, dich"
	line "kennen zu lernen."
	cont "Nimm dir bitte ein"
	cont "Souvenir."
	done

WesleyGaveGiftText:
	text "MITKO: SCHWARZGURT"
	line "verstärkt die"
	cont "Kraft von Kampf-"
	cont "Attacken."
	done

WesleyWednesdayText:
	text "MITKO: Da du mich"
	line "gefunden hast,"

	para "musst du meine"
	line "Brüder und Schwes-"
	cont "tern getroffen"
	cont "haben."

	para "Oder hattest du"
	line "einfach nur Glück?"
	done

WesleyNotWednesdayText:
	text "MITKO: Heute ist"
	line "nicht Mittwoch."
	cont "Wie schade."
	done

LakeOfRageSignText:
	text "SEE DES ZORNS,"
	line "auch bekannt als"
	cont "GARADOS-SEE"
	done

FishingGurusHouseSignText:
	text "HAUS DES PROFI-"
	line "ANGLERs"
	done

LakeOfRage_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 21, 27, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 11, 28, BGEVENT_ITEM, LakeOfRageHiddenFullRestore
	bg_event  4,  4, BGEVENT_ITEM, LakeOfRageHiddenRareCandy
	bg_event 35,  5, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	db 12 ; object events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageSuperNerdScript, -1
	object_event 25, 29, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 18, 22, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event  7, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	object_event 35,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
