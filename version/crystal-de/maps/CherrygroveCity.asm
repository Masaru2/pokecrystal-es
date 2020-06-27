INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_SILVER
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_FISHER


SECTION "maps/CherrygroveCity", ROMX

CherrygroveCity_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CHERRYGROVECITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CHERRYGROVECITY_MEET_RIVAL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	return

CherrygroveCityGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	yesorno
	iffalse .No
	sjump .Yes
.Yes:
	writetext GuideGentTourText1
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
	opentext
	writetext GuideGentPokecenterText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	opentext
	writetext GuideGentMartText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	opentext
	writetext GuideGentRoute30Text
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	opentext
	writetext GuideGentSeaText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CHERRYGROVECITY_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitsfx
	end

.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "KARTEN-MODUL@"

.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

CherrygroveSilverSceneSouth:
	moveobject CHERRYGROVECITY_SILVER, 39, 7
CherrygroveSilverSceneNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_SILVER
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CherrygroveRivalText_Seen
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Totodile:
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Chikorita:
	winlosstext SilverCherrygroveWinText, SilverCherrygroveLossText
	setlasttalked CHERRYGROVECITY_SILVER
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouWon
	waitbutton
	closetext
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_SILVER, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_SILVER
	setscene SCENE_CHERRYGROVECITY_NOTHING
	special HealParty
	playmapmusic
	end

CherrygroveTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext CherrygroveTeacherText_NoMapCard
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext CherrygroveTeacherText_HaveMapCard
	waitbutton
	closetext
	end

CherrygroveYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CherrygroveYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CherrygroveYoungsterText_HavePokedex
	waitbutton
	closetext
	end

MysticWaterGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue .After
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse .Exit
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
.After:
	writetext MysticWaterGuyTextAfter
	waitbutton
.Exit:
	closetext
	end

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokecenterSign:
	jumpstd pokecentersign

CherrygroveCityMartSign:
	jumpstd martsign

GuideGentMovement1:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head UP
	step_end

GuideGentMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement4:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end

GuideGentMovement5:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

GuideGentMovement6:
	step UP
	step UP
	step_end

CherrygroveCity_RivalWalksToYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CherrygroveCity_UnusedMovementData:
	step LEFT
	turn_head DOWN
	step_end

CherrygroveCity_RivalExitsStageLeft:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

GuideGentIntroText:
	text "Du bist doch ein"
	line "Anfänger, oder?"

	para "Das ist O.K.! Es"
	line "ist noch kein"
	cont "Meister vom Himmel"
	cont "gefallen!"

	para "Wenn du willst,"
	line "bringe ich dir ein"
	cont "paar Tricks bei."
	done

GuideGentTourText1:
	text "Also gut!"
	line "Folge mir!"
	done

GuideGentPokecenterText:
	text "Das ist ein #-"
	line "MON-CENTER. Hier"

	para "kannst du deine"
	line "#MON heilen."

	para "Du wirst diese"
	line "Dienste sehr oft"

	para "in Anspruch nehmen"
	line "müssen."
	done

GuideGentMartText:
	text "Das ist ein PKMN-"
	line "SUPERMARKT."

	para "Hier werden BÄLLE"
	line "verkauft, mit de-"
	cont "nen du #MON"
	cont "fangen kannst."

	para "Außerdem findest"
	line "du hier viele"
	cont "nützliche Items."
	done

GuideGentRoute30Text:
	text "Zur ROUTE 30 geht"
	line "es hier entlang."

	para "Du wirst dort auf"
	line "viele Trainer und"

	para "ihre #MON"
	line "treffen."
	done

GuideGentSeaText:
	text "Wie du sehen"
	line "kannst, befinden"

	para "wir uns hier am"
	line "Meer."

	para "Manche #MON"
	line "findet man nur im"
	cont "Wasser."
	done

GuideGentGiftText:
	text "Hier…"

	para "Das ist mein Haus!"
	line "Danke, dass du mir"
	cont "Gesellschaft"
	cont "geleistet hast."

	para "Lass mich dir ein"
	line "kleines Präsent"
	cont "geben!"
	done

GotMapCardText:
	text "Der #COM von"
	line "<PLAYER> verfügt"
	cont "nun über eine"
	cont "KARTE!"
	done

GuideGentPokegearText:
	text "Der #COM wird"
	line "vielseitiger, wenn"
	cont "du ihn mit MODULEN"
	cont "erweiterst."

	para "Ich wünsche dir"
	line "viel Glück für"
	cont "deine Reise!"
	done

GuideGentNoText:
	text "Oh… Ich mache so"
	line "etwas gerne…"

	para "Du kannst mich"
	line "immer besuchen."
	done

CherrygroveRivalText_Seen:
	text "<……> <……> <……>"

	para "Du hast ein #-"
	line "MON aus dem LABOR."

	para "Welch eine Ver-"
	line "schwendung für ei-"
	cont "nen Schwächling"
	cont "wie dich."

	para "<……> <……> <……>"

	para "Hast du kapiert,"
	line "wovon ich spreche?"

	para "Auch ich habe ein"
	line "gutes #MON."

	para "Ich zeige dir, was"
	line "ich meine!"
	done

SilverCherrygroveWinText:
	text "Hmpf. Bist du we-"
	line "nigstens froh über"
	cont "deinen Sieg?"
	done

CherrygroveRivalText_YouLost:
	text "<……> <……> <……>"

	para "Mein Name ist ???."

	para "Ich werde der"
	line "weltbeste #-"
	cont "MON-Trainer sein!"
	done

SilverCherrygroveLossText:
	text "Hmpf. Das war pure"
	line "Zeitverschwendung."
	done

CherrygroveRivalText_YouWon:
	text "<……> <……> <……>"

	para "Mein Name ist ???."

	para "Ich werde der"
	line "weltbeste #-"
	cont "MON-Trainer sein!"
	done

CherrygroveTeacherText_NoMapCard:
	text "Hast du mit dem"
	line "alten Mann am"
	cont "#MON-CENTER"
	cont "gesprochen?"

	para "Er wird dir eine"
	line "KARTE von JOHTO"
	cont "für deinen #-"
	cont "COM geben."
	done

CherrygroveTeacherText_HaveMapCard:
	text "Du kannst gehen,"
	line "wohin du willst -"
	cont "solange du mit"
	cont "#MON unterwegs"
	cont "bist, wird es"
	cont "immer lustig sein."
	done

CherrygroveYoungsterText_NoPokedex:
	text "Zu MR. #MONs"
	line "Haus ist es noch"
	cont "ein ganzes Stück."
	done

CherrygroveYoungsterText_HavePokedex:
	text "Ich habe gegen die"
	line "Trainer auf der"
	cont "Straße gekämpft."

	para "Meine #MON"
	line "haben verloren!"

	para "Ich muss sie rasch"
	line "in ein #MON-"
	cont "CENTER bringen."
	done

MysticWaterGuyTextBefore:
	text "Ich habe ein"
	line "#MON gefan-"
	cont "gen, das ein Item"

	para "bei sich hatte."
	line "Ich glaube, es war"
	cont "ZAUBERWASSER."

	para "Ich brauche es"
	line "nicht. Möchtest du"
	cont "es haben?"
	done

MysticWaterGuyTextAfter:
	text "Ich gehe wieder"
	line "zum Fischen."
	done

CherrygroveCitySignText:
	text "ROSALIA CITY"

	para "Die Stadt der"
	line "Duftenden Blumen"
	done

GuideGentsHouseSignText:
	text "HAUS DES"
	line "FREMDENFÜHRERs"
	done

CherrygroveCity_MapEvents::
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	db 2 ; coord events
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveSilverSceneSouth

	db 4 ; bg events
	bg_event 30,  8, BGEVENT_READ, CherrygroveCitySign
	bg_event 23,  9, BGEVENT_READ, GuideGentsHouseSign
	bg_event 24,  3, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 30,  3, BGEVENT_READ, CherrygroveCityPokecenterSign

	db 5 ; object events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 27, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
