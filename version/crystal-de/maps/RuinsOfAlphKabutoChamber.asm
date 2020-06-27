INCLUDE "constants/floating_constants.inc"
INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST
	const RUINSOFALPHKABUTOCHAMBER_SCIENTIST


SECTION "maps/RuinsOfAlphKabutoChamber", ROMX, BANK[BANK_MAP_RUINS_OF_ALPH_RESEARCH_CENTER]

RuinsOfAlphKabutoChamber_MapScripts::
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	prioritysjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_FINISHED
	closetext
	end

RuinsOfAlphKabutoChamberReceptionistScript:
	jumptextfaceplayer RuinsOfAlphKabutoChamberReceptionistText

RuinsOfAlphKabutoChamberPuzzle:
	refreshscreen
	setval UNOWNPUZZLE_KABUTO
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_K
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphKabutoChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphKabutoChamberScientistScript:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .AllUnownCaught
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .PuzzleIncomplete
	writetext RuinsOfAlphKabutoChamberScientistTremorText
	promptbutton
.PuzzleIncomplete:
	writetext RuinsOfAlphKabutoChamberScientistCrypticText
	waitbutton
	closetext
	turnobject RUINSOFALPHKABUTOCHAMBER_SCIENTIST, UP
	end

.WallOpen:
	writetext RuinsOfAlphKabutoChamberScientistHoleText
	waitbutton
	closetext
	end

.AllUnownCaught:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberAncientReplica:
	jumptext RuinsOfAlphKabutoChamberAncientReplicaText

RuinsOfAlphKabutoChamberDescriptionSign:
	jumptext RuinsOfAlphKabutoChamberDescriptionText

RuinsOfAlphKabutoChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphKabutoChamberWallPatternLeftText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphKabutoChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphKabutoChamberWallPatternRightText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphKabutoChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphKabutoChamberReceptionistText:
	text "Willkommen in"
	line "diesem Raum."

	para "Hier gibt es ver-"
	line "schiebbare Plat-"
	cont "ten, die ein #-"
	cont "MON darstellen,"

	para "das aus der Antike"
	line "stammt."

	para "Verschiebe die"
	line "Platten so, dass"
	cont "ein Bild entsteht."

	para "Rechts findest du"
	line "eine Beschreibung"
	cont "des #MON."

	para "Die Forscher im"
	line "Hintergrund unter-"
	cont "suchen neu ent-"
	cont "deckte Muster."
	done

RuinsOfAlphKabutoChamberScientistCrypticText:
	text "Neulich sind"
	line "seltsame Muster"
	cont "aufgetaucht."

	para "Es ist merkwürdig."
	line "Vor kurzem waren"
	cont "sie noch nicht da…"

	para "Wirf einen Blick"
	line "auf die Wände."
	done

RuinsOfAlphKabutoChamberScientistHoleText:
	text "Ah! Hier ist noch"
	line "ein großes Loch!"

	para "Es ist groß genug,"
	line "um durchzugehen!"
	done

RuinsOfAlphKabutoChamberScientistTremorText:
	text "Das Beben war"
	line "Furcht erregend!"

	para "Aber die Wand hier"
	line "macht mir mehr"
	cont "Sorgen…"
	done

RuinsOfAlphKabutoChamberUnusedText:
; unused
	text "Die Muster an der"
	line "Wand sind tatsäch-"
	cont "lich Worte!"

	para "Und die verschieb-"
	line "baren Steinplatten"

	para "scheinen ein"
	line "Signal zu sein."

	para "Ich glaube sie"
	line "veranlassen #-"
	cont "MON sich zu zei-"
	cont "gen, aber das ist"
	cont "noch nicht sicher…"
	done

RuinsOfAlphKabutoChamberWallPatternLeftText:
	text "Es sind Muster an"
	line "den Wänden…"
	done

RuinsOfAlphKabutoChamberUnownText:
; unused
	text "Es ist"
	line "ICOGNITO-Schrift!"
	done

RuinsOfAlphKabutoChamberWallPatternRightText:
	text "Es sind Muster an"
	line "den Wänden…"
	done

RuinsOfAlphKabutoChamberWallHoleText:
	text "Da ist ein großes"
	line "Loch in der Wand!"
	done

RuinsOfAlphKabutoChamberAncientReplicaText:
	text "Dies ist eine"
	line "Nachbildung eines"
	cont "antiken #MON."
	done

RuinsOfAlphKabutoChamberDescriptionText:
	text "Ein #MON, das"
	line "sich am Meeres-"
	cont "grund versteckte"

	para "und mit seinen"
	line "Augen auf dem"

	para "Rücken die Um-"
	line "gebung genau"
	cont "beobachtete."
	done

RuinsOfAlphKabutoChamber_MapEvents::
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5
	warp_event  4,  0, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternRight

	db 2 ; object events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberReceptionistScript, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberScientistScript, -1
