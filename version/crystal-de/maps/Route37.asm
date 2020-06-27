INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3


SECTION "maps/Route37", ROMX

Route37_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Sunny

.Sunny:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	return

.SunnyAppears:
	appear ROUTE37_SUNNY
	return

TrainerTwinsAnnandanne1:
	trainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAnnandanne2:
	trainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicGreg:
	trainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGregAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	promptbutton
	sjump .next
.Kris:
	writetext SunnyGivesGiftText2
	promptbutton
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

Route37FruitTree1:
	fruittree FRUITTREE_ROUTE_37_1

Route37FruitTree2:
	fruittree FRUITTREE_ROUTE_37_2

Route37FruitTree3:
	fruittree FRUITTREE_ROUTE_37_3

Route37HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

TwinsAnnandanne1SeenText:
	text "NORA: JO und ich"
	line "arbeiten immer"
	cont "zusammen!"
	done

TwinsAnnandanne1BeatenText:
	text "NORA & JO: Nn… ein"
	line "wenig zu stark."
	done

TwinsAnnandanne1AfterBattleText:
	text "NORA: Ich kenne"
	line "die Gedanken"

	para "meiner Schwester"
	line "und die meiner"
	cont "#MON."
	done

TwinsAnnandanne2SeenText:
	text "JO: NORA und ich"
	line "arbeiten immer"
	cont "zusammen!"
	done

TwinsAnnandanne2BeatenText:
	text "NORA & JO: Nn…ein"
	line "wenig zu stark."
	done

TwinsAnnandanne2AfterBattleText:
	text "JO: Wir fühlen"
	line "dasselbe wie"
	cont "unsere #MON."
	done

PsychicGregSeenText:
	text "#MON können"
	line "nicht agieren,"
	cont "wenn sie"
	cont "schlafen."

	para "Ich werde dir zei-"
	line "gen, wie furcht-"
	cont "erregend das ist!"
	done

PsychicGregBeatenText:
	text "Ich habe"
	line "verloren. Wie"
	cont "betrüblich…"
	done

PsychicGregAfterBattleText:
	text "Im Kampf stellt"
	line "es eine gute"
	cont "Taktik dar, die"
	cont "gegnerischen #-"
	cont "MON in Schlaf zu"
	cont "versetzen oder sie"
	cont "zu paralysieren."
	done

MeetSunnyText:
	text "SONNFRIED: Hi!"

	para "Ich bin SONNFRIED"
	line "von Sonntag. Soll"
	cont "heißen, heute ist"
	cont "Sonntag!"
	done

SunnyGivesGiftText1:
	text "Man hat mir auf-"
	line "getragen, dir das"
	cont "zu geben, wenn ich"
	cont "dich treffe!"
	done

SunnyGivesGiftText2:
	text "Mir wurde aufge-"
	line "tragen, dir das"

	para "zu überreichen,"
	line "wenn ich dich"
	cont "treffe!"
	done

SunnyGaveGiftText:
	text "SONNFRIED: Dieses"
	line "Ding…"

	para "Äh…"

	para "…Was war das"
	line "nochmal…"

	para "…"

	para "Ah! Jetzt erinnere"
	line "ich mich!"

	para "Ein #MON, das"
	line "Elektro-Attacken"

	para "verwendet, sollte"
	line "dies erhalten."

	para "Meine Schwester"
	line "MONJA behauptet,"
	cont "es verstärkt"
	cont "Elektro-Attacken!"
	done

SunnySundayText:
	text "SONNFRIED: Meine"
	line "Geschwister heißen"
	cont "MONJA, DIETLINDE,"
	cont "MITKO, DONATUS,"
	cont "FRIEDA und SAMSON."

	para "Sie sind alle"
	line "älter als ich!"
	done

SunnyNotSundayText:
	text "SONNFRIED: Ist"
	line "heute nicht Sonn-"
	cont "tag? Äh… Das habe"
	cont "ich vergessen!"
	done

Route37SignText:
	text "ROUTE 37"
	done

Route37_MapEvents::
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  3, BGEVENT_READ, Route37Sign
	bg_event  4,  2, BGEVENT_ITEM, Route37HiddenEther

	db 7 ; object events
	object_event  6, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne1, -1
	object_event  7, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne2, -1
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	object_event 13,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree1, -1
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 16,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree2, -1
	object_event 15,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree3, -1
