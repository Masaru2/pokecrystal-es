INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2


SECTION "maps/PewterCity", ROMX

PewterCity_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	return

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext PewterCityGrampsText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	end

.GotSilverWing:
	writetext PewterCityGrampsText_GotSilverWing
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd pokecentersign

PewterCityMartSign:
	jumpstd martsign

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "Warst du schon in"
	line "der PKMN-ARENA von"
	cont "MARMORIA CITY?"

	para "Der LEITER dort"
	line "verwendet Gestein-"
	cont "#MON."
	done

PewterCityBugCatcherText:
	text "NACHTs spielen"
	line "PIEPI beim"
	cont "MONDBERG."

	para "Aber nicht in"
	line "jeder Nacht."
	done

PewterCityGrampsText:
	text "Oh, du bist den"
	line "ganzen Weg "
	cont "von JOHTO bis"
	cont "hierher gekommen?"

	para "Das weckt"
	line "Erinnerungen. Als"

	para "ich noch jung war,"
	line "habe ich in JOHTO"
	cont "oft trainiert."

	para "Du erinnerst"
	line "mich an mich"

	para "selbst als junger"
	line "Mann."

	para "Hier. Ich möchte,"
	line "dass du dieses"
	cont "Item, das ich in"
	cont "JOHTO fand,"
	cont "behältst."
	done

PewterCityGrampsText_GotSilverWing:
	text "Neue und un-"
	line "bekannte Orte zu"
	cont "erforschen und"
	cont "fremde Menschen"
	cont "kennen zu lernen…"

	para "Das ist das Schöne"
	line "am Reisen."
	done

PewterCitySignText:
	text "MARMORIA CITY"
	line "Eine Steingraue"
	cont "Stadt"
	done

PewterGymSignText:
	text "PKMN-ARENA von"
	line "MARMORIA CITY"
	cont "LEITUNG: ROCKO"

	para "Der Felsenharte"
	line "#MON-Trainer"
	done

PewterMuseumSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "MARMORIAS MUSEUM"
	line "DER WISSENSCHAFT"
	cont "ist wegen Reno-"
	cont "vierungsarbeiten"
	cont "geschlossen…"
	done

PewterCityMtMoonGiftShopSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "SOUVENIRLADEN AM"
	line "MONDBERG"
	cont "Jetzt geöffnet!"
	done

PewterCityWelcomeSignText:
	text "Willkommen in"
	line "MARMORIA CITY!"
	done

PewterCity_MapEvents::
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event 11, 17, BGEVENT_READ, PewterGymSign
	bg_event 15,  9, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	db 5 ; object events
	object_event 19, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 14, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 29, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
