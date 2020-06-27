INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER


SECTION "maps/ElmsLab", ROMX

ElmsLab_MapScripts::
	db 6 ; scene scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback

.MeetElm:
	prioritysjump .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	return

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	sjump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	promptbutton
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_FINISHED
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	promptbutton
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	promptbutton
	writetext ElmAfterTheftText5
	promptbutton
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag ENGINE_MAIN_MENU_MOBILE_CHOICES
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	promptbutton
	writetext ShowElmTogepiText3
	promptbutton
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	promptbutton
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	promptbutton
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	promptbutton
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	promptbutton
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	promptbutton
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	promptbutton
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOTHING
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2:
; unused
	jumpstd trashcan

ElmsLabBookshelf:
	jumpstd difficultbookshelf

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "LIND: <PLAY_G>!"
	line "Da bist du ja!"

	para "Ich muss dich um"
	line "etwas bitten."

	para "Ich führe gerade"
	line "neue #MON-"
	cont "Forschungen durch."

	para "Ich habe mich ge-"
	line "fragt, ob du mir"

	para "dabei hilfst,"
	line "<PLAY_G>."

	para "Verstehst du…"

	para "Ich schreibe an"
	line "etwas, das ich bei"

	para "einer Konferenz"
	line "vorlegen möchte."

	para "Aber da sind noch"
	line "einige Dinge, die"

	para "ich nicht ganz"
	line "verstehe."

	para "Darum!"

	para "Ich möchte, dass"
	line "du ein #MON"

	para "trainierst, dass"
	line "ich vor kurzem"
	cont "gefangen habe."
	done

ElmText_Accepted:
	text "Danke, <PLAY_G>!"

	para "Du bist mir eine"
	line "große Hilfe!"
	done

ElmText_Refused:
	text "Aber… ich brauche"
	line "deine Hilfe!"
	done

ElmText_ResearchAmbitions:
	text "Wenn ich meine Er-"
	line "gebnisse vorlege,"

	para "werden wir sicher"
	line "noch weiter in die"

	para "Geheimnisse der"
	line "#MON vorstoßen."

	para "Darauf kannst du"
	line "dich verlassen!"
	done

ElmText_GotAnEmail:
	text "Oh, heh! Ich habe"
	line "eine E-Mail!"

	para "<……><……><……>"
	line "Hm… Uh-huh…"

	para "Okay…"
	done

ElmText_MissionFromMrPokemon:
	text "Hör gut zu!"

	para "Ich habe einen Be-"
	line "kannten namens MR."
	cont "#MON."

	para "Ständig findet er"
	line "eigenartiges Zeugs"

	para "und fängt an, da-"
	line "rüber zu fanta-"
	cont "sieren."

	para "Aber jetzt hat er"
	line "mir eine E-Mail"

	para "geschickt, in der"
	line "steht, dass es"

	para "sich diesmal um"
	line "etwas Großes"
	cont "handeln muss."

	para "Das klingt zwar"
	line "faszinierend, aber"

	para "wir sind derzeit"
	line "mitten in unseren"

	para "eigenen #MON-"
	line "Forschungen."

	para "Moment!"

	para "Ich hab's!"

	para "<PLAY_G>, könntest"
	line "du der Sache"
	cont "nachgehen?"
	done

ElmText_ChooseAPokemon:
	text "Ich möchte, dass"
	line "du eines der"

	para "#MON aus"
	line "einem dieser BÄLLE"
	cont "trainierst."

	para "Du wirst der erste"
	line "Kamerad dieses"
	cont "#MON sein,"
	cont "<PLAY_G>!"

	para "Such dir eins aus!"
	done

ElmText_LetYourMonBattleIt:
	text "Erscheint ein"
	line "wildes #MON,"
	cont "lass deine #MON"
	cont "dagegen kämpfen."
	done

LabWhereGoingText:
	text "LIND: Warte! Wohin"
	line "gehst du?"
	done

TakeCyndaquilText:
	text "LIND: Willst du"
	line "FEURIGEL, das"
	cont "Feuer-#MON?"
	done

TakeTotodileText:
	text "LIND: Wählst du"
	line "KARNIMANI, das"
	cont "Wasser-#MON?"
	done

TakeChikoritaText:
	text "LIND: Entscheidest"
	line "du dich für"

	para "ENDIVIE, das"
	line "Pflanzen-#MON?"
	done

DidntChooseStarterText:
	text "LIND: Überlege es"
	line "dir gut!"

	para "Die Wahl deines"
	line "Partners ist sehr"
	cont "wichtig."
	done

ChoseStarterText:
	text "LIND: Ich bin auch"
	line "der Meinung, dass"
	cont "dieses #MON"
	cont "sehr gut ist!"
	done

ReceivedStarterText:
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "MR. #MON lebt"
	line "ein wenig nördlich"

	para "von ROSALIA CITY,"
	line "dem nächsten Ort."

	para "Der Weg führt dich"
	line "fast direkt dort-"
	cont "hin, du kannst es"
	cont "nicht verfehlen."

	para "Aber nur für den"
	line "Fall, dass… hier"

	para "ist meine Nummer."
	line "Ruf an, wenn es"
	cont "etwas gibt!"
	done

ElmDirectionsText2:
	text "Ist dein #MON"
	line "verletzt, solltest"

	para "du es mit Hilfe"
	line "dieser Maschine"
	cont "heilen."

	para "Benutze sie so oft"
	line "du willst."
	done

ElmDirectionsText3:
	text "<PLAY_G>, ich"
	line "zähle auf dich!"
	done

GotElmsNumberText:
	text "<PLAYER> erhält"
	line "LINDs Nummer."
	done

ElmDescribesMrPokemonText:
	text "MR. #MON findet"
	line "überall seltene"
	cont "Dinge."

	para "Es ist nur dumm,"
	line "dass sie nur sel-"
	cont "ten und nicht"
	cont "brauchbar sind…"
	done

ElmPokeBallText:
	text "Er beinhaltet ein"
	line "von PROF. LIND ge-"
	cont "fangenes #MON."
	done

ElmsLabHealingMachineText1:
	text "Ich frage mich,"
	line "wozu das gut ist!"
	done

ElmsLabHealingMachineText2:
	text "Willst du deine"
	line "#MON heilen?"
	done

ElmAfterTheftText1:
	text "LIND: <PLAY_G>, es"
	line "ist schrecklich…"

	para "Oh, was hat MR."
	line "#MON denn"
	cont "Großes entdeckt?"
	done

ElmAfterTheftText2:
	text "<PLAYER> übergibt"
	line "PROF. LIND das"
	cont "RÄTSEL-EI."
	done

ElmAfterTheftText3:
	text "LIND: Das hier?"
	done

ElmAfterTheftText4:
	text "Aber… ist das auch"
	line "ein #MON-EI?"

	para "Falls ja, dann ist"
	line "es in der Tat eine"
	cont "große Entdeckung!"
	done

ElmAfterTheftText5:
	text "LIND: Wie?!?"

	para "PROF. EICH hat dir"
	line "einen #DEX"
	cont "gegeben?"

	para "<PLAY_G>, ist das"
	line "wahr? D-Das ist ja"
	cont "unglaublich!"

	para "Kein anderer ist"
	line "wie er in der"

	para "Lage, das wahre"
	line "Potenzial eines"

	para "Trainers zu er-"
	line "kennen."

	para "Wow, <PLAY_G>. Es"
	line "ist vielleicht"

	para "deine Bestimmung,"
	line "der CHAMP zu"
	cont "werden."

	para "Es sieht auch so"
	line "aus, als könntest"

	para "du hervorragend"
	line "mit #MON um-"
	cont "gehen."

	para "Du solltest die"
	line "Herausforderung"

	para "der PKMN-ARENEN"
	line "annehmen."

	para "Die nächste PKMN-"
	line "ARENA befindet"
	cont "sich in VIOLA."
	done

ElmAfterTheftText6:
	text "…<PLAY_G>. Der"
	line "Weg zum Ruhm ist"

	para "lang und beschwer-"
	line "lich."

	para "Bevor du los-"
	line "ziehst, solltest"
	cont "du mit deiner Mama"
	cont "sprechen."
	done

ElmStudyingEggText:
	text "LIND: Gib nicht"
	line "auf! Ich rufe dich"

	para "an, wenn ich etwas"
	line "über dieses EI he-"
	cont "rausgefunden habe."
	done

ElmAideHasEggText:
	text "LIND: <PLAY_G>?"
	line "Hast du schon mei-"
	cont "nen Assistenten"
	cont "getroffen?"

	para "Er sollte mit dem"
	line "EI im #MON-"
	cont "CENTER von VIOLA"
	cont "CITY warten."

	para "Du musst ihn ver-"
	line "passt haben. Ver-"
	cont "suche, ihn dort zu"
	cont "finden."
	done

ElmWaitingEggHatchText:
	text "LIND: He, hat sich"
	line "das EI irgendwie"
	cont "verändert?"
	done

ElmThoughtEggHatchedText:
	text "<PLAY_G>? Ich"
	line "dachte, etwas wäre"
	cont "aus dem EI ge-"
	cont "schlüpft."

	para "Wo ist das"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "LIND: <PLAY_G>, du"
	line "siehst großartig"
	cont "aus!"
	done

ShowElmTogepiText2:
	text "Was?"
	line "Dieses #MON!?!"
	done

ShowElmTogepiText3:
	text "Es ist aus dem EI"
	line "geschlüpft! Also"
	cont "schlüpfen alle"
	cont "#MON aus EIERN…"

	para "Nein, vermutlich"
	line "trifft das nicht"
	cont "auf alle #MON"
	cont "zu."

	para "Es wartet wohl"
	line "noch jede Menge"
	cont "Forschungsarbeit"
	cont "auf uns."
	done

ElmGiveEverstoneText1:
	text "Danke, <PLAY_G>!"
	line "Du hilfst uns beim"

	para "Aufklären vieler"
	line "#MON-Mysterien!"

	para "Bitte nimm dies"
	line "als Zeichen unser-"
	cont "er Wertschätzung."
	done

ElmGiveEverstoneText2:
	text "Das ist ein"
	line "EWIGSTEIN."

	para "Einige #MON"
	line "entwickeln sich"

	para "weiter, wenn sie"
	line "einen bestimmten"
	cont "Level erreichen."

	para "Ein #MON,"
	line "das den EWIGSTEIN"
	cont "trägt, wird sich"
	cont "aber nicht ent-"
	cont "wickeln."

	para "Gib ihn einem"
	line "#MON, das"
	cont "sich nicht weiter-"
	cont "entwickeln soll!"
	done

ElmText_CallYou:
	text "LIND: <PLAY_G>, ich"
	line "rufe dich an, wenn"
	cont "sich etwas tut."
	done

AideText_AfterTheft:
	text "…Seufz… Das"
	line "gestohlene #-"
	cont "MON."

	para "Ich frage mich,"
	line "wie es ihm geht."

	para "Man sagt, dass ein"
	line "#MON, das von"

	para "einem bösen Men-"
	line "schen aufgezogen"
	cont "wird, selber böse"

	para "wird."
	done

ElmGiveMasterBallText1:
	text "LIND: Hi, <PLAY_G>!"
	line "Dank dir komme ich"

	para "mit meinen For-"
	line "schungen hervor-"
	cont "ragend voran!"

	para "Nimm dies als"
	line "Zeichen meiner"
	cont "Dankbarkeit!"
	done

ElmGiveMasterBallText2:
	text "Der MEISTERBALL"
	line "ist der Beste von"
	cont "allen!"

	para "Er ist der ultima-"
	line "tive BALL! Ihm"

	para "kann kein #MON"
	line "entwischen."

	para "Er wird nur aner-"
	line "kannten #MON-"
	cont "Forschern"
	cont "überreicht."

	para "Aber ich glaube,"
	line "du hast bessere"

	para "Verwendung dafür"
	line "als ich, <PLAY_G>!"
	done

ElmGiveTicketText1:
	text "LIND: <PLAY_G>!"
	line "Da bist du ja!"

	para "Ich habe dich ge-"
	line "rufen, weil ich"
	cont "dir etwas geben"
	cont "möchte."

	para "Es handelt sich um"
	line "ein BOOTSTICKET."

	para "Jetzt kannst du"
	line "auch in KANTO"
	cont "#MON fangen."
	done

ElmGiveTicketText2:
	text "Das Schiff legt in"
	line "OLIVIANA CITY ab."

	para "Aber das weißt du"
	line "ja schon, <PLAY_G>."

	para "Schließlich bist"
	line "du mit deinen"

	para "#MON schon"
	line "viel herumge-"
	cont "kommen."

	para "Überbringe PROF."
	line "EICH in KANTO"
	cont "meine Grüße!"
	done

ElmsLabSignpostText_Egg:
	text "Dies ist das"
	line "#MON-EI, das"
	cont "von PROF. LIND"
	cont "untersucht wird."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, ich"
	line "möchte, dass du"
	cont "das mitnimmst."
	done

AideText_AlwaysBusy:
	text "Wir sind nur zu"
	line "zweit und wir ha-"
	cont "ben viel zu tun."
	done

AideText_TheftTestimony:
	text "Wir haben ein lau-"
	line "tes Geräusch ge-"
	cont "hört…"

	para "Als wir nach dem"
	line "Rechten sahen,"
	cont "wurde ein #MON"
	cont "gestohlen."

	para "Ich kann nicht"
	line "glauben, dass je-"
	cont "mand zu so etwas"
	cont "fähig ist!"

	para "…Seufz… Das"
	line "gestohlene"
	cont "#MON."

	para "Ich frage mich,"
	line "wie es ihm geht."

	para "Man sagt, dass ein"
	line "#MON, das"

	para "von einem bösen"
	line "Menschen aufgezo-"
	cont "gen wird, selber"

	para "böse wird."
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Benutze diese"
	line "auf deiner"
	cont "#DEX-Reise!"
	done

AideText_ExplainBalls:
	text "Um deinen #DEX"
	line "zu vervollständi-"
	cont "gen, musst du"
	cont "#MON fangen."

	para "Wirf #BÄLLE"
	line "nach wilden #-"
	cont "MON, um sie zu"
	cont "fangen."
	done

ElmsLabOfficerText1:
	text "Ich hörte, dass"
	line "hier ein #MON"
	cont "gestohlen worden"
	cont "sei…"

	para "Ich habe von PROF."
	line "LIND einige Infor-"
	cont "mationen erhalten."

	para "Bei dem Dieb han-"
	line "delt es sich um"
	cont "einen jungen Mann"
	cont "mit langen roten"
	cont "Haaren…"

	para "Wie?"

	para "Du hast gegen ei-"
	line "nen solchen"
	cont "Trainer gekämpft?"

	para "Hat er dir auch"
	line "seinen Namen ge-"
	cont "nannt?"
	done

ElmsLabOfficerText2:
	text "O.K.! Sein Name"
	line "war also <RIVAL>."

	para "Danke, dass du mir"
	line "bei den Ermitt-"
	cont "lungen geholfen"
	cont "hast!"
	done

ElmsLabWindowText1:
	text "Das Fenster ist"
	line "offen."

	para "Eine sanfte Brise"
	line "weht herein."
	done

ElmsLabWindowText2:
	text "Hier ist er he-"
	line "reingekommen!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 1:"

	para "Drücke START, um"
	line "das MENÜ zu"
	cont "öffnen."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 2:"

	para "Speichere deine"
	line "Fortschritte mit"
	cont "SICHERN!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 3:"

	para "Öffne deinen"
	line "BEUTEL und drücke"
	cont "SELECT, um deine"
	cont "Items zu ver-"
	cont "walten."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> öffnet"
	line "ein Buch."

	para "Reise-Tipp 4:"

	para "Verwalte die At-"
	line "tacken deiner"
	cont "#MON. Drücke"
	cont "den A-Knopf, um"
	cont "ihre Position zu"
	cont "verändern."
	done

ElmsLabTrashcanText:
	text "Die Verpackung"
	line "des Snacks, den"
	cont "PROF. LIND geges-"
	cont "sen hat, befindet"
	cont "sich hier…"
	done

ElmsLabPCText:
	text "AUFZEICHNUNGEN ZUR"
	line "#MON-ENTWICK-"
	cont "LUNG"

	para "…steht auf dem"
	line "Bildschirm…"
	done

ElmsLab_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	db 8 ; coord events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	db 16 ; bg events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	db 6 ; object events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
