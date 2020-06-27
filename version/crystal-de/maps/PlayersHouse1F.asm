INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F


SECTION "maps/PlayersHouse1F", ROMX

PlayersHouse1F_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

PokegearName:
	db "#COM@"

PlayersHouse1FReceiveItemStd:
	jumpstd receiveitem
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Oh, <PLAYER>…"
	line "Unser Nachbar,"

	para "PROF. LIND, hat"
	line "nach dir gesucht."

	para "Er möchte, dass du"
	line "etwas für ihn er-"
	cont "ledigst."

	para "Oh! Fast hätte ich"
	line "es vergessen! Dein"

	para "#MON-COM ist"
	line "von der Reparatur"
	cont "zurück."

	para "Da hast du ihn!"
	done

MomGivesPokegearText:
	text "#MON-COM oder"
	line "einfach nur"
	cont "#COM."

	para "Ein wichtiges Ge-"
	line "rät auf deinem"
	cont "Pfad als Trainer."

	para "Oh, der Wochentag"
	line "ist noch nicht"
	cont "eingestellt."

	para "Das darfst du"
	line "nicht vergessen!"
	done

IsItDSTText:
	text "Haben wir"
	line "Sommerzeit?"
	done

ComeHomeForDSTText:
	text "Geh nach Hause, um"
	line "deine Uhr auf SZ"
	cont "oder WZ einzu-"
	cont "stellen."

	para "Übrigens, weißt du"
	line "über den Umgang"
	cont "mit dem TELEFON"
	cont "Bescheid?"
	done

KnowTheInstructionsText:
	text "Muss man nicht"
	line "einfach den #-"
	cont "COM einschalten"

	para "und das TELEFON-"
	line "Symbol anwählen?"
	done

DontKnowTheInstructionsText:
	text "Ich werde die An-"
	line "leitung lesen."

	para "Schalte den #-"
	line "COM ein und wähle"
	cont "das TELEFON-Symbol"
	cont "an!"
	done

InstructionsNextText:
	text "Telefonnummern"
	line "werden gespei-"
	cont "chert. Wähle ein-"
	cont "fach den Namen der"

	para "Person, die du an-"
	line "rufen möchtest."

	para "Ist das nicht"
	line "praktisch?"
	done

HurryUpElmIsWaitingText:
	text "PROF. LIND wartet"
	line "auf dich."

	para "Beeile dich, Baby!"
	done

SoWhatWasProfElmsErrandText:
	text "Wie lautete der"
	line "Auftrag von PROF."
	cont "LIND?"

	para "…"

	para "Das klingt nach"
	line "einer wahren He-"
	cont "rausforderung."

	para "Aber du kannst"
	line "stolz darauf sein,"
	cont "dass sich die Leu-"
	cont "te auf dich ver-"
	cont "lassen!"
	done

ImBehindYouText:
	text "<PLAYER>, du"
	line "schaffst es!"

	para "Ich werde dir"
	line "immer zur Seite"
	cont "stehen!"
	done

NeighborMornIntroText:
	text "Guten Morgen,"
	line "<PLAY_G>!"

	para "Ich bin zu Besuch!"
	done

NeighborDayIntroText:
	text "Hallo, <PLAY_G>!"
	line "Ich bin zu Besuch!"
	done

NeighborNiteIntroText:
	text "Guten Abend,"
	line "<PLAY_G>!"

	para "Ich bin zu Besuch!"
	done

NeighborText:
	text "<PLAY_G>, hast"
	line "du schon gehört?"

	para "Meine Tochter will"
	line "unbedingt PROF."

	para "LINDs Assistentin"
	line "werden."

	para "Sie liebt #MON"
	line "von ganzem Herzen!"
	done

StoveText:
	text "Mamas Spezialität!"

	para "ZINNOBER-VULKAN-"
	line "BURGER!"
	done

SinkText:
	text "Die Spüle ist"
	line "fleckenlos rein,"
	cont "so wie es Mama"
	cont "mag."
	done

FridgeText:
	text "Mal sehen, was da"
	line "im Kühlschrank zu"
	cont "finden ist…"

	para "TAFELWASSER"
	line "und leckere LIMO-"
	cont "NADE!"
	done

TVText:
	text "Es läuft ein Film"
	line "im TV: Die Sterne"

	para "leuchten und zwei"
	line "Jungen fahren Zug…"

	para "Ich sollte mich"
	line "auch in Bewegung"
	cont "setzen!"
	done

PlayersHouse1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  8,  4, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  4, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
