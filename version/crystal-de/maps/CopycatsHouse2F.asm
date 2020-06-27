INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const COPYCATSHOUSE2F_COPYCAT1 ; if player is male
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL
	const COPYCATSHOUSE2F_COPYCAT2 ; if player is female


SECTION "maps/CopycatsHouse2F", ROMX

CopycatsHouse2F_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Callback

.Callback:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	disappear COPYCATSHOUSE2F_COPYCAT2
	appear COPYCATSHOUSE2F_COPYCAT1
	sjump .Done
.Female:
	disappear COPYCATSHOUSE2F_COPYCAT1
	appear COPYCATSHOUSE2F_COPYCAT2
.Done:
	return

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	sjump .Default_Merge_1

.Default_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.Default_Merge_1:
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2a
	writetext CopycatText_Male_1
	sjump .Default_Merge_2a

.Default_Female_2a:
	writetext CopycatText_Female_1
.Default_Merge_2a:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3a
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .Default_Merge_3a

.Default_Female_3a:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3a:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2b
	writetext CopycatText_Male_2
	sjump .Default_Merge_2b

.Default_Female_2b:
	writetext CopycatText_Female_2
.Default_Merge_2b:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3b
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .Default_Merge_3b

.Default_Female_3b:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3b:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	promptbutton
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	promptbutton
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	sjump .GotPass_Merge_1

.GotPass_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.GotPass_Merge_1:
	special LoadUsedSpritesGFX
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_2
	writetext CopycatText_Male_3
	sjump .GotPass_Merge_2

.GotPass_Female_2:
	writetext CopycatText_Female_3
.GotPass_Merge_2:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_3
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .GotPass_Merge_3

.GotPass_Female_3:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.GotPass_Merge_3:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	promptbutton
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd picturebookshelf

CopycatSpinAroundMovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

CopycatText_Male_1:
	text "<PLAYER>: Hi! Magst"
	line "du #MON?"

	para "<PLAYER>: Äh, nein,"
	line "ich frage dich."

	para "<PLAYER>: Was?"
	line "Du bist komisch!"
	done

CopycatText_QuickMimicking:
	text "NACHAHMERIN: Hm?"
	line "Das Nachahmen"
	cont "aufgeben?"

	para "Aber das ist"
	line "meine liebste"
	cont "Beschäftigung!"
	done

CopycatText_Male_2:
	text "<PLAYER>: Hi!"
	line "Ich habe gehört,"

	para "dass du deine"
	line "Lieblings-"
	cont "#PUPPE"
	cont "verloren hast."

	para "<PLAYER>: Gibst du"
	line "mir einen FAHR-"
	cont "SCHEIN, wenn ich"
	cont "sie finde?"

	para "<PLAYER>: Ich suche"
	line "sie für dich."

	para "Du glaubst, sie"
	line "auf dem Weg nach"
	cont "ORANIA CITY"
	cont "verloren zu haben?"
	done

CopycatText_Worried:
	text "NACHAHMERIN:"
	line "Bitte?"

	para "Ich soll dir nicht"
	line "sagen, was du zu"
	cont "tun hast?"

	para "Aber ich mache mir"
	line "wirklich Sorgen…"
	cont "Was, wenn jemand"
	cont "sie findet?"
	done

CopycatText_GiveDoll:
	text "NACHAHMERIN: Jaa!"
	line "Das ist meine"
	cont "PIEPI-#PUPPE!"

	para "Siehst du die"
	line "Naht am rechten"

	para "Bein? Das ist"
	line "der Beweis!"
	done

CopycatText_GivePass:
	text "Also gut. Hier ist"
	line "der FAHRSCHEIN für"
	cont "den MAGNETZUG! Wie"
	cont "versprochen."
	done

CopycatText_ExplainPass:
	text "NACHAHMERIN: Das"
	line "ist der FAHRSCHEIN"
	cont "für den MAGNETZUG."

	para "Der Mann von der"
	line "Eisenbahn gab mir"

	para "das, als sie unser"
	line "altes Haus nieder-"
	cont "rissen, um den"
	cont "BAHNHOF zu bauen."
	done

CopycatText_Male_3:
	text "<PLAYER>: Hi!"
	line "Vielen Dank für"
	cont "den FAHRSCHEIN!"

	para "<PLAYER>: Bitte?"

	para "<PLAYER>: Ist es"
	line "wirklich so toll,"
	cont "jede Bewegung"
	cont "nachzuahmen?"
	done

CopycatText_ItsAScream:
	text "NACHAHMERIN: "
	line "Darauf kannst du"
	cont "wetten!"
	done

CopycatText_Female_1:
	text "<PLAYER>: Hi. Du"
	line "musst #MON"
	cont "mögen."

	para "<PLAYER>: Nein,"
	line "nicht ich. Ich"
	cont "habe dich gefragt."

	para "<PLAYER>: Bitte?"
	line "Du bist seltsam!"
	done

CopycatText_Female_2:
	text "<PLAYER>: Hi."
	line "Hast du wirklich"
	cont "deine #PUPPE"
	cont "verloren?"

	para "<PLAYER>: Du"
	line "gibst mir wirklich"

	para "einen FAHRSCHEIN,"
	line "falls ich sie"
	cont "finde?"

	para "<PLAYER>: Gewiss,"
	line "ich halte die"
	cont "Augen offen!"

	para "Du denkst, du hast"
	line "sie in ORANIA CITY"
	cont "verloren?"
	done

CopycatText_Female_3:
	text "<PLAYER>: Danke für"
	line "den FAHRSCHEIN!"

	para "<PLAYER>: …Bitte?"

	para "<PLAYER>: Macht"
	line "es wirklich so"

	para "viel Spaß mir"
	line "alles nachzu-"
	cont "sprechen und alles"
	cont "nachzuahmen?"
	done

CopycatsDodrioText1:
	text "DODRI: Gii giii!"
	done

CopycatsDodrioText2:
	text "SPIEGLEIN, SPIEG-"
	line "LEIN AN DER WAND,"

	para "WER IST DIE"
	line ""
	line "SCHÖNSTE IM GANZEN"

	para "LAND?"
	done

CopycatsHouse2FDollText:
	text "Das ist ein"
	line "seltenes #MON!"
	cont "Was?"

	para "Es ist nur eine"
	line "Puppe…"
	done

CopycatsHouse2F_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	db 6 ; object events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_2
