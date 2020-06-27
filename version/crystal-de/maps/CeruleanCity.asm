INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_FISHER
	const CERULEANCITY_YOUNGSTER


SECTION "maps/CeruleanCity", ROMX

CeruleanCity_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CeruleanCityCooltrainerMText1
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CeruleanCityCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanCitySuperNerdScript:
	jumptextfaceplayer CeruleanCitySuperNerdText

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	end

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	closetext
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	opentext
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	closetext
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	opentext
	writetext CeruleanCityCooltrainerFText3
	waitbutton
	closetext
	end

CeruleanCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .MetCeruleanRocket
.ReturnedMachinePart:
	writetext CeruleanCityFisherText
	waitbutton
	closetext
	end

.MetCeruleanRocket:
	writetext CeruleanCityFisherRocketTipText
	waitbutton
	closetext
	end

CeruleanCityYoungsterScript:
	faceplayer
	opentext
	writetext CeruleanCityYoungsterText1
	waitbutton
	closetext
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse .BerserkGenePingsItemfinder
	end

.BerserkGenePingsItemfinder:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext CeruleanCityYoungsterText2
	waitbutton
	closetext
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokecenterSign:
	jumpstd pokecentersign

CeruleanCityMartSign:
	jumpstd martsign

CeruleanCityHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

CeruleanCityCooltrainerMText1:
	text "Das KRAFTWERK von"
	line "KANTO?"

	para "Es befindet"
	line "sich am Ende von"

	para "ROUTE 9, auf der"
	line "Straße östlich"
	cont "von hier."

	para "Es muss dort einen"
	line "Störfall gegeben"
	cont "haben."
	done

CeruleanCityCooltrainerMText2:
	text "Sammelst du jede"
	line "Art von #MON?"

	para "Das ist bestimmt"
	line "sehr schwer. Aber"
	cont "Spaß macht es"
	cont "sicher auch."
	done

CeruleanCitySuperNerdText:
	text "Am KAP im Norden"
	line "treffen sich viele"

	para "Pärchen. Gerade"
	line "Mädchen gehen dort"
	cont "gerne hin!"
	done

CeruleanCitySlowbroText:
	text "LAHMUS: Jarah?"
	done

CeruleanCityCooltrainerFText1:
	text "Mein LAHMUS und"
	line "ich sind ein un-"
	cont "schlagbares Team!"
	done

CeruleanCityCooltrainerFText2:
	text "LAHMUS, mach deine"
	line "KONFUSION vor!"
	done

CeruleanCityCooltrainerFText3:
	text "…"
	done

CeruleanCityFisherText:
	text "Ich bin ein großer"
	line "Fan von der ARENA-"
	cont "LEITERIN in AZURIA"
	cont "CITY. Ihr Name ist"
	cont "MISTY."
	done

CeruleanCityFisherRocketTipText:
	text "Ich habe so einen"
	line "zwielichtigen Typ"
	cont "zum KAP bei AZURIA"
	cont "CITY gehen sehen."
	done

CeruleanCityYoungsterText1:
	text "Hier soll es mal"
	line "eine Höhle gegeben"

	para "haben, in der"
	line "mächtige und"
	cont "grässliche #MON"
	cont "gehaust haben."
	done

CeruleanCityYoungsterText2:
	text "Ach ja?"

	para "Mein DETEKTOR"
	line "schlägt aus…"
	done

CeruleanCitySignText:
	text "AZURIA CITY"

	para "Umgeben Von Einer"
	line "Mystischen Blauen"
	cont "Aura"
	done

CeruleanGymSignText:
	text "PKMN-ARENA von"
	line "AZURIA CITY"
	cont "LEITUNG: MISTY"

	para "Die Jungenhafte"
	line "Meerjungfrau"
	done

CeruleanBikeShopSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "Der FAHRRADLADEN"
	line "ist jetzt in"
	cont "JOHTO, in"
	cont "DUKATIA CITY…"
	done

CeruleanPoliceSignText:
	text "Hier ist eine"
	line "Nachricht…"

	para "Stoppt die Krimi-"
	line "nalität und macht"

	para "aus dieser Stadt"
	line "einen Ort, an dem"
	cont "man sicher ist und"
	cont "gerne lebt!"

	para "ORDNUNGSAMT VON"
	line "AZURIA CITY"
	done

CeruleanCapeSignText:
	text "KAP bei AZURIA"
	line "CITY voraus"
	done

CeruleanLockedDoorText:
	text "Abgeschlossen…"
	done

CeruleanCity_MapEvents::
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7, 15, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 28, 17, CERULEAN_POLICE_STATION, 1
	warp_event 13, 19, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 21, CERULEAN_POKECENTER_1F, 1
	warp_event 30, 23, CERULEAN_GYM, 1
	warp_event 25, 29, CERULEAN_MART, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event 23, 23, BGEVENT_READ, CeruleanCitySign
	bg_event 27, 25, BGEVENT_READ, CeruleanGymSign
	bg_event 11, 29, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 25, 17, BGEVENT_READ, CeruleanPoliceSign
	bg_event 23,  7, BGEVENT_READ, CeruleanCapeSign
	bg_event 14, 29, BGEVENT_READ, CeruleanLockedDoor
	bg_event 20, 21, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 26, 29, BGEVENT_READ, CeruleanCityMartSign
	bg_event  2, 12, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene

	db 6 ; object events
	object_event 15, 23, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 23, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerdScript, -1
	object_event 20, 24, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event 21, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event 30, 26, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  6, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
