INCLUDE "constants/battle_tower_constants.inc"
INCLUDE "constants/floating_constants.inc"
INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY


SECTION "maps/BattleTower1F", ROMX, BANK[BANK_MAP_BATTLE_TOWER]

BattleTower1F_MapScripts::
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .LeftWithoutSaving
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	prioritysjump Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving
	prioritysjump BattleTower_LeftWithoutSaving
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_FINISHED
.Scene1:
	end

BattleTower1FRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleTower1FReceptionistScript:
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	promptbutton
	setval BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	sjump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	setval TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	sjump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	setval BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	setval BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	setval BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	setval BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	sjump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	setval BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_DEFAULT
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize::
	setval BATTLETOWERACTION_1C
	special BattleTowerAction
	setval BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	ifequal POTION, Script_YourPackIsStuffedFull
	getitemname STRING_BUFFER_4, USE_SCRIPT_VAR
	giveitem ITEM_FROM_MEM, 5
	writetext Text_PlayerGotFive
	setval BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull:
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo:
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	sjump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain::
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4b6:
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4be:
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

UnreferencedScript_0x9e4ea:
	setval BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	setval BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	sjump continue

.zero
	writetext Text_CantBeRegistered
continue:
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	setval BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	sjump Script_ResumeBattleTowerChallenge

UnreferencedScript_0x9e53b:
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom::
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator::
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room::
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room::
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room::
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room::
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room::
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn::
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn::
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut::
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer::
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway::
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist::
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent::
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "Willkommen im"
	line "DUELLTURM!"

	para "Ich führe dich in"
	line "einen KAMPFRAUM."
	done

Text_WantToGoIntoABattleRoom:
	text "Möchtest du in"
	line "einen KAMPFRAUM?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Hier entlang in"
	line "den KAMPFRAUM."
	done

Text_BattleTowerIntroduction_1:
	text "Der DUELLTURM ist"
	line "eine Stätte für"
	cont "#MON-Kämpfe."

	para "Unzählige #MON-"
	line "Trainer von Nah"

	para "und Fern kommen"
	line "hier zusammen und"

	para "duellieren sich in"
	line "speziellen"
	cont "KAMPFRÄUMEN."

	para "Im DUELLTURM gibt"
	line "es viele"
	cont "KAMPFRÄUME."

	para "In jedem RAUM sind"
	line "sieben Trainer."

	para "Besiegst du alle"
	line "sieben Trainer"

	para "eines RAUMs und"
	line "hast eine gute"

	para "Kampfstatistik,"
	line "kannst du der"
	cont "RAUMPRIMUS werden."

	para "Jeder PRIMUS wird"
	line "in der EHRENLISTE"

	para "für die Nachwelt"
	line "verewigt."

	para "Du kannst täglich"
	line "bis zu fünf"

	para "KAMPFRÄUME"
	line "betreten."

	para "Du darfst jedoch,"
	line "den gleichen RAUM"

	para "nur ein Mal am Tag"
	line "besuchen."

	para "Um eine Heraus-"
	line "forderung zu"

	para "unterbrechen,"
	line "musst du SICHERN."

	para "Falls nicht,"
	line "kannst du den"

	para "Kampf nicht"
	line "fortsetzen."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "Der DUELLTURM ist"
	line "eine Kampfstätte"
	cont "für #MON."

	para "Unzählige #MON-"
	line "Trainer von Nah"

	para "und Fern kommen"
	line "hier zusammen und"

	para "duellieren sich in"
	line "speziellen"

	para "KAMPFRÄUMEN."
	line "Im DUELLTURM gibt"

	para "es viele"
	line "KAMPFRÄUME."

	para "In jedem RAUM sind"
	line "sieben Trainer."

	para "Besiegst du alle,"
	line "bekommst du einen"

	para "Preis. Um eine"
	line "Herausforderung zu"

	para "unterbrechen,"
	line "musst du SICHERN."

	para "Falls du nicht"
	line "sicherst, kannst"

	para "du den Kampf nicht"
	line "fortsetzen."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Erhält einen Aus-"
	line "zug der PRIMI auf"
	cont "der EHRENLISTE."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Bitte auf dem Mo-"
	line "nitor bestätigen."
	done

Text_ThankYou:
	text "Vielen Dank!"

	para ""
	done

Text_ThanksForVisiting::
	text "Danke für deinen"
	line "Besuch!"
	done

Text_BeatenAllTheTrainers_Mobile:
	text "Glückwunsch!"

	para "Du hast alle"
	line "Trainer besiegt!"

	para "Deine Leistung ist"
	line "es wert, einge-"
	cont "tragen zu werden"

	para "<PLAYER>. Dieses"
	line "Resultat könnte"
	cont "dich zum"
	cont "RAUMPRIMUS machen."

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers::
	text "Glückwunsch!"

	para "Du hast alle Trai-"
	line "ner besiegt! Dafür"

	para "erhältst du einen"
	line "Preis!"

	para ""
	done

Text_AskRegisterRecord_Mobile:
	text "Möchtest du deine"
	line "Daten im CENTER"

	para "eintragen?"
	done

Text_PlayerGotFive:
	text "<PLAYER> erhält 5"
	line "@"
	text_ram wStringBuffer4
	text "!@"
	sound_item
	text_promptbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Ups, dein BEUTEL"
	line "ist absolut voll."

	para "Schaffe Platz und"
	line "komme wieder."
	done

Text_YourRegistrationIsComplete:
	text "Eintrag"
	line "abgeschlossen."

	para "Komme wieder!"
	done

Text_WeHopeToServeYouAgain::
	text "Wir stehen stets"
	line "zu Diensten."
	done

Text_PleaseStepThisWay::
	text "Hier entlang"
	line "bitte."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Soll ich dich über"
	line "den DUELLTURM"
	cont "aufklären?"
	done

Text_CantBeRegistered:
	text "Deine Daten vom"
	line "letzten KAMPFRAUM"

	para "können nicht ein-"
	line "getragen werden."
	cont "Einverstanden?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Deine Daten vom"
	line "letzten KAMPFRAUM"

	para "können nicht ein-"
	line "getragen werden."

	para "Die bestehenden"
	line "Daten werden"
	cont "gelöscht. O.K.?"
	done

Text_CheckTheLeaderHonorRoll:
	text "EHRENLISTE"
	line "überprüfen?"
	done

Text_ReadBattleTowerRules:
	text "Hier stehen die"
	line "Regeln des DUELL-"
	cont "TURMs. Lesen?"
	done

Text_BattleTowerRules:
	text "Drei #MON"
	line "dürfen am Kampf"

	para "teilnehmen. Sie"
	line "müssen unter-"
	cont "schiedlich sein."

	para "Ihre Items müssen"
	line "auch verschieden"

	para "sein. Für einige"
	line "#MON gibt es"

	para "Level-"
	line "beschränkungen."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Entschuldigung!"
	line "Du hast vor Ver-"
	cont "lassen des KAMPF-"
	cont "RAUMs vergessen"
	cont "zu SICHERN."

	para "Es tut mir Leid,"
	line "aber deine Heraus-"
	cont "forderung wird für"
	cont "ungültig erklärt."
	done

Text_YourMonWillBeHealedToFullHealth::
	text "Deine #MON"
	line "werden völlig"
	cont "geheilt."
	done

Text_NextUpOpponentNo::
	text "Als Nächstes kommt"
	line "Gegner Nr.@"
	text_ram wStringBuffer3
	text "."
	done

Text_SaveBeforeConnecting_Mobile:
	text "Deine Herausfor-"
	line "derung wird"

	para "geSICHERT, bevor"
	line "du die Verbindung"

	para "mit dem CENTER"
	line "herstellst."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Ehe du einen"
	line "KAMPFRAUM"

	para "betrittst, wird"
	line "der Spielstand"
	cont "gesichert."
	done

Text_SaveAndEndTheSession::
	text "SICHERN und die"
	line "Herausforderung"
	cont "beenden?"
	done

Text_SaveBeforeReentry:
	text "Deine Daten werden"
	line "geSICHERT, ehe du"

	para "in den vorigen"
	line "RAUM zurückkehrst."
	done

Text_CancelYourBattleRoomChallenge::
	text "Die KAMPFRAUM-"
	line "Herausforderung"
	cont "abbrechen?"
	done

Text_RegisterRecordOnFile_Mobile:
	text "Wir haben deine"
	line "Daten gespeichert."

	para "Möchtest du dich"
	line "in einem CENTER"
	cont "eintragen?"
	done

Text_WeveBeenWaitingForYou:
	text "Wir haben dich er-"
	line "wartet. Hier"

	para "entlang zum"
	line "KAMPFRAUM."
	done

Text_FiveDayBattleLimit_Mobile:
	text "Du darfst pro Tag"
	line "nur fünf KAMPF-"
	cont "RÄUME betreten."

	para "Komme morgen"
	line "wieder."
	done

Text_TooMuchTimeElapsedNoRegister::
	text "Leider können"
	line "deine aktuellen"

	para "Daten nicht im"
	line "CENTER eingetragen"

	para "werden, da seit"
	line "Beginn deiner He-"
	cont "rausforderung zu"

	para "viel Zeit"
	line "verstrich."
	done

; a dupe?
Text_RegisterRecordTimedOut_Mobile:
	text "Leider können"
	line "deine aktuellen"

	para "Daten nicht im"
	line "CENTER eingetragen"

	para "werden, da seit"
	line "Beginn deiner He-"
	cont "rausforderung zu"

	para "viel Zeit"
	line "verstrich."
	done

Text_AMonLevelExceeds:
	text "Eines oder mehrere"
	line "deiner #MON"
	cont "übersteigen den"
	cont "Level @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " darf"
	line "in keinen KAMPF-"
	cont "RAUM unter"
	cont "Level 70."

	para "Dieser KAMPFRAUM"
	line "ist für"
	cont "LV @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "Im Handumdrehen"
	line "besiegt vom ersten"

	para "Gegner…"
	line "Wie erbärmlich…"
	done

Text_BattleTowerCooltrainerF:
	text "Es gibt viele"
	line "KAMPFRÄUME, aber"

	para "ich werde in allen"
	line "gewinnen!"
	done

Text_BattleTowerGranny:
	text "Es ist eine zer-"
	line "mürbende Aufgabe,"

	para "ohne Items kämpfen"
	line "zu müssen."

	para "Gib deinen #MON"
	line "Items. Das ist der"

	para "Schlüssel zum"
	line "Erfolg."
	done

Text_BattleTowerBugCatcher:
	text "Ich probiere, wie"
	line "weit ich nur mit"

	para "Käfer-#MON"
	line "komme."

	para "Hoffentlich treffe"
	line "ich nicht auf"
	cont "Feuer-#MON…"
	done

BattleTower1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	db 5 ; object events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
