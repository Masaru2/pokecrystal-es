INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE35_YOUNGSTER1
	const ROUTE35_YOUNGSTER2
	const ROUTE35_LASS1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_FISHER
	const ROUTE35_BUG_CATCHER
	const ROUTE35_SUPER_NERD
	const ROUTE35_OFFICER
	const ROUTE35_FRUIT_TREE
	const ROUTE35_POKE_BALL


SECTION "maps/Route35", ROMX

Route35_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN1, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_JUGGLER_IRWIN
	endifjustbattled
	opentext
	checkcellnum PHONE_JUGGLER_IRWIN
	iftrue Route35NumberAcceptedM
	checkevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext JugglerIrwinAfterBattleText
	promptbutton
	setevent EVENT_IRWIN_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_JUGGLER_IRWIN
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

Route35AskNumber1M:
	jumpstd asknumber1m
	end

Route35AskNumber2M:
	jumpstd asknumber2m
	end

Route35RegisteredNumberM:
	jumpstd registerednumberm
	end

Route35NumberAcceptedM:
	jumpstd numberacceptedm
	end

Route35NumberDeclinedM:
	jumpstd numberdeclinedm
	end

Route35PhoneFullM:
	jumpstd phonefullm
	end

Route35RematchM:
	jumpstd rematchm
	end

TrainerCamperIvan:
	trainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperIvanAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperElliot:
	trainer CAMPER, ELLIOT, EVENT_BEAT_CAMPER_ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperElliotAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerBrooke:
	trainer PICNICKER, BROOKE, EVENT_BEAT_PICNICKER_BROOKE, PicnickerBrookeSeenText, PicnickerBrookeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerBrookeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherArnie:
	trainer BUG_CATCHER, ARNIE1, EVENT_BEAT_BUG_CATCHER_ARNIE, BugCatcherArnieSeenText, BugCatcherArnieBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_ARNIE
	endifjustbattled
	opentext
	checkflag ENGINE_ARNIE
	iftrue .WantsBattle
	checkflag ENGINE_YANMA_SWARM
	iftrue .YanmaSwarming
	checkcellnum PHONE_BUG_CATCHER_ARNIE
	iftrue Route35NumberAcceptedM
	checkevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BugCatcherArnieAfterBattleText
	promptbutton
	setevent EVENT_ARNIE_ASKED_FOR_PHONE_NUMBER
	scall Route35AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route35AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BUG_CATCHER_ARNIE
	ifequal PHONE_CONTACTS_FULL, Route35PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route35NumberDeclinedM
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	scall Route35RegisteredNumberM
	sjump Route35NumberAcceptedM

.WantsBattle:
	scall Route35RematchM
	winlosstext BugCatcherArnieBeatenText, 0
	readmem wArnieFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BUG_CATCHER, ARNIE1
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 1
	clearflag ENGINE_ARNIE
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, ARNIE2
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 2
	clearflag ENGINE_ARNIE
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, ARNIE3
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 3
	clearflag ENGINE_ARNIE
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, ARNIE4
	startbattle
	reloadmapafterbattle
	loadmem wArnieFightCount, 4
	clearflag ENGINE_ARNIE
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, ARNIE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ARNIE
	end

.YanmaSwarming:
	writetext BugCatcherArnieYanmaText
	waitbutton
	closetext
	end

TrainerFirebreatherWalt:
	trainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherWaltAfterBattleText
	waitbutton
	closetext
	end

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICER, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	closetext
	end

.AfterBattle:
	writetext OfficerDirkAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerDirkPrettyToughText
	waitbutton
	closetext
	end

Route35Sign:
	jumptext Route35SignText

Route35TMRollout:
	itemball TM_ROLLOUT

Route35FruitTree:
	fruittree FRUITTREE_ROUTE_35

CamperIvanSeenText:
	text "Ich habe aus dem"
	line "Radio #MON-"
	cont "Daten erhalten."

	para "Ich glaube, ich"
	line "bin gut."
	done

CamperIvanBeatenText:
	text "Ich teile aus!"
	done

CamperIvanAfterBattleText:
	text "Die Musik aus dem"
	line "Radio beeinflusst"
	cont "die Stimmung von"
	cont "wilden #MON."
	done

CamperElliotSeenText:
	text "Ich werde meiner"
	line "Freundin zeigen,"
	cont "wie cool ich bin!"
	done

CamperElliotBeatenText:
	text "Ach, hättest du"
	line "doch verloren…"
	done

CamperElliotAfterBattleText:
	text "Du hast mich vor"
	line "meiner Freundin"
	cont "lächerlich"
	cont "gemacht…"
	done

PicnickerBrookeSeenText:
	text "Mein Freund ist"
	line "schwach. Er kann"
	cont "mich nicht"
	cont "beschützen."
	done

PicnickerBrookeBeatenText:
	text "Meine Güte, bist"
	line "du stark!"
	done

PicnickerBrookeAfterBattleText:
	text "Auf meine"
	line "#MON kann"
	cont "ich mich eher"
	cont "verlassen als auf"
	cont "meinen Freund."
	done

PicnickerKimSeenText:
	text "Gehst du auch"
	line "zur PKMN-ARENA?"
	done

PicnickerKimBeatenText:
	text "Oh, ich habe"
	line "verloren…"
	done

PicnickerKimAfterBattleText:
	text "Die ORDEN"
	line "sind hübsch."
	cont "Deshalb sammle ich"
	cont "sie."
	done

BirdKeeperBryanSeenText:
	text "Welche Art von"
	line "#BALL"
	cont "benutzt du?"
	done

BirdKeeperBryanBeatenText:
	text "Mist! Nicht"
	line "schnell genug!"
	done

BirdKeeperBryanAfterBattleText:
	text "Manche #MON"
	line "rennen sofort weg."

	para "Versuche, sie mit"
	line "KURTs TURBOBALL"
	cont "einzufangen. "

	para "Sobald ich eine"
	line "APRIKOKO WSS"
	cont "finde, bringe ich"
	cont "sie zu KURT."

	para "Er macht dann"
	line "daraus einen maß-"
	cont "gefertigten"
	cont "#BALL."
	done

JugglerIrwin1SeenText:
	text "Siehe meine"
	line "Virtuosität, mit"
	cont "der ich die BÄLLE"
	cont "jongliere!"
	done

JugglerIrwin1BeatenText:
	text "Puh, das war ein"
	line "Ruck!"
	done

JugglerIrwinAfterBattleText:
	text "Ich wollte dich"
	line "mit meinen"

	para "prämierten #MON"
	line "fritzeln."

	para "Aber dein Können"
	line "elektrisierte"
	cont "mich!"
	done

BugCatcherArnieSeenText:
	text "Ich gehe überall-"
	line "hin, wo es Käfer-"
	cont "#MON gibt."
	done

BugCatcherArnieBeatenText:
	text "Ich hätte nicht"
	line "verlieren dürfen…"
	done

BugCatcherArnieAfterBattleText:
	text "Mit meinem BLUZUK"
	line "habe ich das"

	para "Käferturnier"
	line "im NATIONALPARK"
	cont "gewonnen."
	done

BugCatcherArnieYanmaText:
	text "Wow… Sieh, all"
	line "die YANMA!"

	para "Ich bin über-"
	line "wältigt und kann"
	cont "mich nicht rühren."
	done

FirebreatherWaltSeenText:
	text "Ich übe mich im"
	line "Feuerspucken."
	done

FirebreatherWaltBeatenText:
	text "Aua! Ich habe mir"
	line "die Nasenspitze"
	cont "verbrannt!"
	done

FirebreatherWaltAfterBattleText:
	text "Der #MON-"
	line "Marsch im Radio"
	cont "lockt wilde"
	cont "#MON an."
	done

OfficerDirkSeenText:
	text "Bei Nacht lauern"
	line "Gefahren!"
	done

OfficerDirkBeatenText:
	text "Schwupps!"
	done

OfficerDirkAfterBattleText:
	text "Du weißt, dass"
	line "die Nacht auf"
	cont "ihre Weise"
	cont "schön sein kann."

	para "Aber übertreibe"
	line "es nicht, O.K.?"
	done

OfficerDirkPrettyToughText:
	text "Deine #MON"
	line "sehen ziemlich"
	cont "stark aus."

	para "Du wärst über-"
	line "all sicher."
	done

Route35SignText:
	text "ROUTE 35"
	done

Route35_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 33, ROUTE_35_GOLDENROD_GATE, 1
	warp_event 10, 33, ROUTE_35_GOLDENROD_GATE, 2
	warp_event  3,  5, ROUTE_35_NATIONAL_PARK_GATE, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  1,  7, BGEVENT_READ, Route35Sign
	bg_event 11, 31, BGEVENT_READ, Route35Sign

	db 11 ; object events
	object_event  4, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperIvan, -1
	object_event  8, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperElliot, -1
	object_event  7, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerBrooke, -1
	object_event 10, 26, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerKim, -1
	object_event 14, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBirdKeeperBryan, -1
	object_event  2, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherWalt, -1
	object_event 16,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherArnie, -1
	object_event  5, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerJugglerIrwin, -1
	object_event  5,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event  2, 25, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route35FruitTree, -1
	object_event 13, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route35TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
