INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M


SECTION "maps/VermilionCity", ROMX

VermilionCity_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext VermilionCitySnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd pokecentersign

VermilionCityMartSign:
	jumpstd martsign

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "Der HAFEN von"
	line "ORANIA CITY ist"
	cont "das Tor KANTOs"
	cont "zum Meer."

	para "Hier legen Luxus-"
	line "dampfer aus aller"
	cont "Welt an."
	done

VermilionMachopOwnerText:
	text "Mein #MON"
	line "ebnet das Land"
	cont "für ein Bauwerk."

	para "Aber ich habe"
	line "nicht genug Geld"
	cont "für das Projekt…"
	done

VermilionMachopText1:
	text "MACHOLLO: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
	text "Ein MACHOLLO"
	line "brüllt laut,"
	cont "während es auf"
	cont "den Boden stampft."
	done

VermilionCitySuperNerdText:
	text "Es gibt acht"
	line "ARENEN in KANTO."

	para "Das große Gebäude"
	line "ist die PKMN-ARENA"
	cont "von ORANIA CITY."
	done

VermilionCitySnorlaxSleepingText:
	text "RELAXO schläft"
	line "friedlich…"
	done

VermilionCityRadioNearSnorlaxText:
	text "Der #COM wird"
	line "in der Nähe des"
	cont "schlafenden"
	cont "RELAXOs platziert…"

	para "…"

	para "RELAXO ist"
	line "aufgewacht!"
	done

VermilionCityBadgeGuyTrainerText:
	text "In KANTO treffen"
	line "sich talentierte"
	cont "Trainer."

	para "ARENALEITER sind"
	line "besonders stark."

	para "Es ist nicht"
	line "leicht, sie zu"
	cont "besiegen."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "Du sammelst ORDEN"
	line "der ARENEN in"
	cont "KANTO?"

	para "Findest du nicht"
	line "auch, dass die"
	cont "Trainer hier stark"
	cont "sind?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "Ich schätze, du"
	line "hast diesen Wett-"
	cont "kampf der ARENEN"
	cont "in KANTO bald"
	cont "beendet."

	para "Lass mich wissen,"
	line "wenn du alle acht"
	cont "ORDEN hast."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Gratuliere!"

	para "Du hast alle ORDEN"
	line "der ARENEN in"
	cont "KANTO."

	para "Ich habe hier eine"
	line "Belohnung für"
	cont "deine"
	cont "Anstrengungen."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Es ist vorteil-"
	line "haft, wenn du"

	para "#MON verschie-"
	line "dener Elemente"
	cont "kämpfen lässt."

	para "Ich bin sicher,"
	line "dass die ORDEN der"
	cont "ARENEN in KANTO"
	cont "dir helfen werden."
	done

VermilionCitySignText:
	text "ORANIA CITY"

	para "Der Hafen Der"
	line "Stimmungsvollen"
	cont "Sonnenuntergänge"
	done

VermilionGymSignText:
	text "PKMN-ARENA von"
	line "ORANIA CITY"

	para "LEITUNG: MAJOR BOB"
	line "Der Blitzschnelle"

	para "Amerikaner"
	done

PokemonFanClubSignText:
	text "#MON-FANCLUB"

	para "Alle #MON-Fans"
	line "sind willkommen!"
	done

VermilionCityDiglettsCaveSignText:
	text "DIGDAs HÖHLE"
	done

VermilionCityPortSignText:
	text "EINGANG zum HAFEN"
	line "von ORANIA CITY"
	done

VermilionCity_MapEvents::
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	db 6 ; object events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 26,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 14, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
