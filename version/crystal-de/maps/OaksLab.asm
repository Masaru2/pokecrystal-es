INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3


SECTION "maps/OaksLab", ROMX

OaksLab_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

.DummyScene:
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "EICH: <PLAY_G>!"
	line "Schön, dass du"

	para "den weiten Weg"
	line "nach KANTO gemacht"
	cont "hast."

	para "Was hältst du von"
	line "den Trainern hier"

	para "draußen?"
	line "Ziemlich stark,"

	para "was?"
	done

OakLabDexCheckText:
	text "Wie geht es mit"
	line "dem #DEX voran?"

	para "Mal sehen…"
	done

OakLabGoodbyeText:
	text "Wenn du mal wieder"
	line "in der Gegend"
	cont "bist, dann schau"
	cont "doch wieder rein."
	done

OakOpenMtSilverText:
	text "EICH: Wow! Das ist"
	line "hervorragend!"

	para "Du hast die ORDEN"
	line "der ARENALEITER in"
	cont "KANTO erkämpft."
	cont "Gut gemacht!"

	para "Ich habe dich"
	line "richtig"
	cont "eingeschätzt."

	para "Weißt du was,"
	line "<PLAY_G>? Ich"

	para "werde es so ein-"
	line "richten, dass du"
	cont "zum SILBERBERG"
	cont "gehen kannst."

	para "Der SILBERBERG ist"
	line "ein großes Habitat"

	para "für viele wilde"
	line "#MON."

	para "Es ist zu"
	line "gefährlich für"

	para "einen Durch-"
	line "schnittstrainer."

	para "Deshalb ist es"
	line "verboten. Aber für"
	cont "dich, <PLAY_G>,"
	cont "können wir eine"
	cont "Ausnahme machen."

	para "Steige auf das"
	line "INDIGO PLATEAU."

	para "Von dort kannst"
	line "du den SILBERBERG"
	cont "erreichen."
	done

OakNoKantoBadgesText:
	text "EICH: Hm? Du hast"
	line "keine ORDEN der"

	para "PKMN-ARENEN"
	line "in KANTO?"

	para "Die ARENALEITER in"
	line "KANTO sind genauso"

	para "stark wie die"
	line "in JOHTO."

	para "Ich schlage vor,"
	line "du forderst sie"
	cont "heraus."
	done

OakYesKantoBadgesText:
	text "EICH: Ah, du"
	line "sammelst ORDEN der"
	cont "ARENALEITER von"
	cont "KANTO."

	para "Ich kann mir"
	line "vorstellen, dass"

	para "es schwer für dich"
	line "ist, aber du"
	cont "sammelst wertvolle"
	cont "Erfahrungen."

	para "Besuche mich"
	line "wieder, wenn du"

	para "sie alle hast."
	line "Ich gebe dir dann"
	cont "ein Geschenk."

	para "Streng dich weiter"
	line "so an, <PLAYER>!"
	done

OaksAssistant1Text:
	text "PROF. EICHs #-"
	line "MON-TALK wird in"

	para "KANTO nicht im"
	line "Radio gesendet."

	para "Das ist schade."
	line "Ich würde es gerne"
	cont "hören."
	done

OaksAssistant2Text:
	text "Die Forschungen"
	line "des PROFESSORs"
	cont "kommen dank deiner"

	para "Arbeit am #DEX"
	line "sehr gut voran."
	done

OaksAssistant3Text:
	text "Erzähl es keinem,"
	line "aber PROF. EICHs"

	para "#MON-TALK wird"
	line "nicht live"
	cont "gesendet."
	done

OaksLabPoster1Text:
	text "Drücke START, um"
	line "das MENÜ zu"
	cont "öffnen."
	done

OaksLabPoster2Text:
	text "Möchtest du deinen"
	line "Spielstand von"

	para "Zeit zu Zeit"
	line "speichern, dann"
	cont "wähle im MENÜ die"
	cont "Option SICHERN."
	done

OaksLabTrashcanText:
	text "Hier drin ist"
	line "nichts…"
	done

OaksLabPCText:
	text "Auf dem PC ist"
	line "eine E-Mail."

	para "…"

	para "Wie kommen Sie"
	line "mit Ihren"
	cont "Forschungen voran,"
	cont "PROF. EICH?"

	para "Nun, ich ackere"
	line "weiter."

	para "Ich habe Gerüchte"
	line "gehört, dass"

	para "sich <PLAY_G>"
	line "einen Namen macht."

	para "Es freut mich, das"
	line "zu hören."

	para "PROF. LIND in"
	line "NEUBORKIA"
	done

OaksLab_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	db 0 ; coord events

	db 16 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 4 ; object events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
