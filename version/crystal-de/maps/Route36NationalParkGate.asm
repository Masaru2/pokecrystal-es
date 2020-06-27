INCLUDE "constants/floating_constants.inc"
INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_ROCKER
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER4
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_YOUNGSTER5
	const ROUTE36NATIONALPARKGATE_YOUNGSTER6
	const ROUTE36NATIONALPARKGATE_YOUNGSTER7
	const ROUTE36NATIONALPARKGATE_OFFICER2


SECTION "maps/Route36NationalParkGate", ROMX

Route36NationalParkGate_MapScripts::
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	prioritysjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftrue .Return
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	return

.LeavingContestEarly:
	turnobject PLAYER, UP
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route36NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route36NationalParkGateOfficer1WaitHereForAnnouncementText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, Route36NationalParkGatePlayerWaitWithContestantsMovement
	pause 15
	special FadeInQuickly
	jumpstd bugcontestresults

.GoBackToContest:
	writetext Route36NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear ROUTE36NATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	scall Route36ParkGate_DayToText
	writetext Route36NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse .DecidedNotToJoinContest
	readvar VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route36NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	waitsfx
	writetext Route36NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route36NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.LeaveMonsWithOfficer:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext Route36NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route36NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route36NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext Route36NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext Route36NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext Route36NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

.BoxFull:
	writetext Route36NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext Route36NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext Route36NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

.Sunstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext Route36NationalParkGateOfficer1WellHoldPrizeText
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

Route36NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetext Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText
	waitbutton
	closetext
	end

Route36ParkGate_DayToText:
	jumpstd daytotext
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

UnusedBugCatchingContestExplanationSign:
; duplicate of BugCatchingContestExplanationSign in Route35NationalParkGate.asm
	jumptext UnusedBugCatchingContestExplanationText

Route36NationalParkGatePlayerWaitWithContestantsMovement:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

Route36NationalParkGateOfficer1AskToParticipateText:
	text "Heute ist"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Das bedeutet, dass"
	line "heute das Käfer-"
	cont "turnier statt-"
	cont "findet."

	para "Die Regeln sind"
	line "einfach."

	para "Fange ein Käfer-"
	line "#MON mit einem"
	cont "deiner eigenen"
	cont "#MON."

	para "Das Käfer-#MON"
	line "wird dann von der"
	cont "Jury bewertet."

	para "Möchtest du es"
	line "einmal versuchen?"
	done

Route36NationalParkGateOfficer1GiveParkBallsText:
	text "Hier sind die"
	line "PARKBÄLLE für das"
	cont "Turnier."
	done

Route36NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> erhält"
	line "20 PARKBÄLLE."
	done

Route36NationalParkGateOfficer1ExplainsRulesText:
	text "Wer das stärkste"
	line "Käfer-#MON"
	cont "fängt, hat "
	cont "gewonnen."

	para "Du hast 20"
	line "Minuten Zeit."

	para "Wenn du keine"
	line "PARKBÄLLE mehr"
	cont "hast, ist das"
	cont "Turnier beendet."

	para "Du darfst das"
	line "letzte #MON,"
	cont "das du gefangen"
	cont "hast, behalten."

	para "Los! Fang das"
	line "stärkste Käfer-"
	cont "#MON, das du"
	cont "finden kannst!"
	done

Route36NationalParkGateOfficer1AskToUseFirstMonText:
	text "Oh, oh…"

	para "Du hast mehr als"
	line "ein #MON."

	para "Du musst"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "auswählen - dein"
	line "erstes #MON."

	para "Bist du damit"
	line "einverstanden?"
	done

Route36NationalParkGateOfficer1WellHoldYourMonText:
	text "Gut. Wir passen"
	line "währenddessen auf"
	cont "deine anderen"
	cont "#MON auf."
	done

Route36NationalParkGatePlayersMonLeftWithHelperText:
	text "Die #MON von"
	line "<PLAYER> wurden dem"
	cont "TURNIERHELFER"
	cont "übergeben."
	done

Route36NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Wähle bitte das"
	line "#MON, mit dem"

	para "du im Turnier"
	line "antreten möchtest"
	cont "aus und komm dann"
	cont "wieder."
	done

Route36NationalParkGateOfficer1TakePartInFutureText:
	text "Na gut. Wir"
	line "hoffen, dass du"
	cont "später einmal"
	cont "am Turnier teil-"
	cont "nimmst."
	done

Route36NationalParkGateOfficer1FirstMonCantBattleText:
	text "Oh, oh…"
	line "Das erste #MON"

	para "deines Teams kann"
	line "nicht am Turnier"
	cont "teilnehmen."

	para "Tausche es bitte"
	line "mit dem #MON"

	para "aus, das am"
	line "Turnier teilnehmen"

	para "soll und komm dann"
	line "wieder."
	done

Route36NationalParkGateOfficer1MakeRoomText:
	text "Oh, oh…"
	line "Dein Team und"

	para "deine PC-BOX sind"
	line "voll besetzt."

	para "Du kannst ein"
	line "Käfer-#MON,"
	cont "das du fängst,"
	cont "nirgends ablegen."

	para "Schaffe Platz in"
	line "deinem Team oder"

	para "in deiner PC-BOX"
	line "und komme dann"
	cont "wieder."
	done

Route36NationalParkGateOfficer1EggAsFirstMonText:
	text "Oh, oh…"
	line "Ein EI ist an"

	para "erster Stelle in"
	line "deinem Team."

	para "Tausche es bitte"
	line "mit dem #MON"

	para "aus, das am"
	line "Turnier teilnehmen"

	para "soll und komm dann"
	line "wieder."
	done

Route36NationalParkGateOfficer1WantToFinishText:
	text "Du hast noch @"
	text_ram wStringBuffer3
	text_start
	line "Minute(n)."

	para "Möchtest du jetzt"
	line "aufhören?"
	done

Route36NationalParkGateOfficer1WaitHereForAnnouncementText:
	text "Gut. Warte bitte"
	line "hier auf die"

	para "Bekanntgabe"
	line "der Sieger."
	done

Route36NationalParkGateOfficer1OkGoFinishText:
	text "Gut. Geh bitte"
	line "wieder zurück nach"
	cont "draußen und komm"
	cont "zum Ende."
	done

Route36NationalParkGateOfficer1ContestIsOverText:
	text "Das heutige"
	line "Turnier ist be-"
	cont "endet. Wir hoffen,"

	para "dass du wieder"
	line "daran teilnehmen"
	cont "wirst."
	done

Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText:
	text "Manche #MON"
	line "kann man nur im"
	cont "PARK antreffen."
	done

BugCatchingContestant1BText:
	text "ULI: Wow, du hast"
	line "mich besiegt! Du"
	cont "bist sehr gut!"
	done

BugCatchingContestant1BStillCompetingText:
	text "ULI: Glück spielt"
	line "natürlich eine"
	cont "große Rolle dabei."

	para "Man weiß nie,"
	line "welches #MON"
	cont "auftauchen wird."
	done

BugCatchingContestant2BText:
	text "ALAN: Ich beneide"
	line "dich. Dieses Mal"
	cont "habe ich es"
	cont "einfach nicht"
	cont "geschafft."
	done

BugCatchingContestant2BStillCompetingText:
	text "ALAN: Du gewinnst"
	line "vielleicht mit"
	cont "großen #MON?"
	done

BugCatchingContestant3BText:
	text "LARS: Gut gemacht!"
	line "Ich werde meine"
	cont "#MON besser"
	cont "trainieren."
	done

BugCatchingContestant3BStillCompetingText:
	text "LARS: Vielleicht"
	line "erhältst du eine"

	para "höhere Wertung für"
	line "ein #MON mit"
	cont "ungewöhnlicher"
	cont "Farbe."
	done

BugCatchingContestant4BText:
	text "WILHELM: Du bist"
	line "der Sieger? Was"
	cont "hast du gefangen?"
	done

BugCatchingContestant4BStillCompetingText:
	text "WILHELM: Also, ich"
	line "bin zufrieden,"

	para "denn ich habe ein"
	line "#MON gefangen,"
	cont "das ich haben"
	cont "wollte."
	done

BugCatchingContestant5BText:
	text "AXEL: Meine"
	line "Gratulation! Du"
	cont "verdienst meinen"
	cont "ganzen Respekt!"
	done

BugCatchingContestant5BStillCompetingText:
	text "AXEL: Ich habe"
	line "vorher ein SICHLOR"
	cont "gefangen. Aber ich"
	cont "konnte nicht"
	cont "siegen."
	done

BugCatchingContestant6BText:
	text "TILL: Das #-"
	line "MON, das du"
	cont "gefangen hast…"
	cont "Das ist cool!"
	done

BugCatchingContestant6BStillCompetingText:
	text "TILL: Mit einem"
	line "Käfer-#MON, das"

	para "einen hohen Level"
	line "hat, steigen deine"
	cont "Gewinnchancen."

	para "Ich glaube aber,"
	line "dass auch noch"
	cont "andere Kriterien"
	cont "in die Bewertung"
	cont "eingehen."
	done

BugCatchingContestant7BText:
	text "CINDY: Du hast"
	line "gewonnen? Das ist"
	cont "großartig!"

	para "Hättest du Lust,"
	line "mit mir auf die"
	cont "Suche nach Käfer-"
	cont "#MON zu gehen?"
	done

BugCatchingContestant7BStillCompetingText:
	text "CINDY: Ich liebe"
	line "Käfer-#MON!"
	done

BugCatchingContestant8BText:
	text "ENNO: Ich… ich"
	line "glaube einfach"
	cont "nicht, dass ich"
	cont "beim Käfer-"
	cont "turnier verloren"
	cont "habe…"
	done

BugCatchingContestant8BStillCompetingText:
	text "ENNO: Ich hörte,"
	line "dass jemand mit"
	cont "einem RAUPY"
	cont "gewonnen hat!"
	done

BugCatchingContestant9BText:
	text "GUIDO: Das nächste"
	line "Mal gewinne ich!"
	done

BugCatchingContestant9BStillCompetingText:
	text "GUIDO: Mist! Ich"
	line "dachte, ich würde"
	cont "eine höhere"
	cont "Bewertung"
	cont "erreichen…"
	done

BugCatchingContestant10BText:
	text "MICHEL: Könntest"
	line "du mir ein paar"

	para "Tipps geben? Ich"
	line "möchte deinen Stil"
	cont "erlernen."
	done

BugCatchingContestant10BStillCompetingText:
	text "MICHEL: Ich habe"
	line "viel gelernt, aber"

	para "noch nicht genug,"
	line "um zu siegen."
	done

UnusedSudowoodoText:
; This text is unused and unreferenced in the final game.
; The tree Pokémon is Sudowoodo.
; The Silph Scope 2 was later reworked into the Squirtbottle.
	text "Ich habe gehört,"
	line "dass es ein #-"
	cont "MON gibt, das aus-"
	cont "sieht wie ein"

	para "Baum. Du kannst"
	line "seine Identität"
	cont "mit Hilfe eines"
	cont "SILPHSCOPE 2"
	cont "erkennen."
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route35NationalParkGate.asm
	text "Das Käferturnier"
	line "findet jeden"

	para "Dienstag,"
	line "Donnerstag und"
	cont "Samstag statt."

	para "Du erhältst nicht"
	line "nur einen Preis"

	para "allein für die"
	line "Teilnahme, sondern"

	para "auch ein Käfer-"
	line "#MON, das du"
	cont "dort fängst."
	done

Route36NationalParkGateOfficer1WellHoldPrizeText:
	text "Oh, oh… Dein"
	line "BEUTEL ist voll."

	para "Wir bewahren"
	line "deinen Preis auf."
	cont "Aber nur heute."

	para "Schaffe bitte"
	line "Platz und komm"
	cont "dann wieder."
	done

Route36NationalParkGateOfficer1HeresThePrizeText:
	text "<PLAYER>?"

	para "Hier ist der"
	line "Preis, den wir für"
	cont "dich aufbewahrt"
	cont "haben."
	done

Route36NationalParkGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  0, BGEVENT_READ, UnusedBugCatchingContestExplanationSign

	db 12 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
