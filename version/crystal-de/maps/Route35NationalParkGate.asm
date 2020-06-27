INCLUDE "constants/floating_constants.inc"
INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2


SECTION "maps/Route35NationalParkGate", ROMX

Route35NationalParkGate_MapScripts::
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

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
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.LeavingContestEarly:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route35NationalParkGate_NoContestToday
	ifequal MONDAY, Route35NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequal FRIDAY, Route35NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	scall Route35NationalParkGate_GetDayOfWeek
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applymovement PLAYER, Route35NationalParkGatePlayerEnterParkMovement
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route35NationalParkGate_NoRoomInBox

Route35NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route35NationalParkGate_FirstMonIsEgg
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	writetext Route35NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsFainted:
	writetext Route35NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoRoomInBox:
	writetext Route35NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsEgg:
	writetext Route35NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route35NationalParkGate_ContestIsOver:
	writetext Route35NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoContestToday:
	jumptextfaceplayer Route35NationalParkGateOfficer1WeHoldContestsText

Route35NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	writetext Route35NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route35NationalParkGateYoungsterScript:
	jumptextfaceplayer Route35NationalParkGateYoungsterText

BugCatchingContestExplanationSign::
	jumptext BugCatchingContestExplanationText

Route35NationalParkGate_GetDayOfWeek:
	jumpstd daytotext
	end

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route35NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route35NationalParkGateOfficer1AskToParticipateText:
	text "Heute ist"
	line "@"
	text_ram wStringBuffer3
	text "."
	cont "Das heißt, heute"

	para "findet das Käfer-"
	line "turnier statt."

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
	line "versuchen?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Hier sind die"
	line "PARKBÄLLE für das"
	cont "Turnier."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> erhält"
	line "20 PARKBÄLLE."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
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

Route35NationalParkGateOfficer1AskToUseFirstMonText:
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

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Gut. Wir passen"
	line "währenddessen auf"
	cont "deine anderen"
	cont "#MON auf."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "Die #MON von"
	line "<PLAYER> wurden dem"
	cont "TURNIERHELFER"
	cont "übergeben."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Wähle bitte das"
	line "#MON, mit dem"

	para "du im Turnier"
	line "antreten möchtest,"
	cont "aus und komm dann"
	cont "wieder."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "Na gut. Wir"
	line "hoffen, dass du"
	cont "später einmal"
	cont "am Turnier teil-"
	cont "nimmst."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
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

Route35NationalParkGateOfficer1MakeRoomText:
	text "Oh, oh…"
	line "Dein Team und"

	para "deine PC-BOX sind"
	line "voll besetzt."

	para "Du hast keinen"
	line "Platz für ein"
	cont "Käfer-#MON,"
	cont "das du fängst."

	para "Schaffe Platz in"
	line "deinem Team oder"

	para "in deiner PC-BOX"
	line "und komm dann"
	cont "wieder."
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "Oh, oh…"
	line "Ein EI ist an"

	para "erster Stelle in"
	line "deinem Team."

	para "Tausche es bitte"
	line "mit dem #MON,"

	para "das du im Turnier"
	line "einsetzen möchtest"

	para "und komm dann"
	line "wieder."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "Du hast noch @"
	text_ram wStringBuffer3
	text_start
	line "Minute(n)."

	para "Möchtest du jetzt"
	line "aufhören?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "Gut. Warte bitte"
	line "am Nordtor auf"

	para "die Bekanntgabe"
	line "der Sieger."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "Gut. Geh bitte"
	line "wieder zurück nach"
	cont "draußen und komm"
	cont "zum Ende."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "Das heutige"
	line "Turnier ist be-"
	cont "endet. Wir hoffen,"

	para "dass du wieder"
	line "daran teilnehmen"
	cont "wirst."
	done

Route35NationalParkGateOfficer1WeHoldContestsText:
	text "Die Turniere"
	line "werden regelmäßig"

	para "hier im PARK"
	line "abgehalten. Nimm"
	cont "doch auch daran"
	cont "teil!"
	done

Route35NationalParkGateYoungsterText:
	text "Wann findet das"
	line "nächste Käfer-"
	cont "turnier"
	cont "statt?"
	done

BugCatchingContestExplanationText:
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

	para "dort fängst."
	done

Route35NationalParkGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_35, 3
	warp_event  4,  7, ROUTE_35, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 3 ; object events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateYoungsterScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
