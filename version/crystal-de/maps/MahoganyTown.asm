INCLUDE "constants/maps_common.inc"

MAHOGANYTOWN_RAGECANDYBAR_PRICE EQU 300

	object_const_def ; object_event constants
	const MAHOGANYTOWN_POKEFAN_M
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_LASS


SECTION "maps/MahoganyTown", ROMX

MahoganyTown_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_MAHOGANY
	return

MahoganyTownTryARageCandyBarScript:
	showemote EMOTE_SHOCK, MAHOGANYTOWN_POKEFAN_M, 15
	applymovement MAHOGANYTOWN_POKEFAN_M, MovementData_0x1900a9
	follow PLAYER, MAHOGANYTOWN_POKEFAN_M
	applymovement PLAYER, MovementData_0x1900a7
	stopfollow
	turnobject PLAYER, RIGHT
	scall RageCandyBarMerchantScript
	applymovement MAHOGANYTOWN_POKEFAN_M, MovementData_0x1900ad
	end

MahoganyTownPokefanMScript:
	faceplayer
RageCandyBarMerchantScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	scall .SellRageCandyBars
	end

.ClearedRocketHideout:
	opentext
	writetext RageCandyBarMerchantSoldOutText
	waitbutton
	closetext
	end

.SellRageCandyBars:
	opentext
	writetext RageCandyBarMerchantTryOneText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NoRoom
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	special PlaceMoneyTopRight
	writetext RageCandyBarMerchantSavorItText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext RageCandyBarMerchantNotEnoughMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext RageCandyBarMerchantRefusedText
	waitbutton
	closetext
	end

.NoRoom:
	writetext RageCandyBarMerchantNoRoomText
	waitbutton
	closetext
	end

MahoganyTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext MahoganyTownGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MahoganyTownGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

MahoganyTownFisherScript:
	jumptextfaceplayer MahoganyTownFisherText

MahoganyTownLassScript:
	jumptextfaceplayer MahoganyTownLassText

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyTownRagecandybarSign:
	jumptext MahoganyTownRagecandybarSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokecenterSign:
	jumpstd pokecentersign

MovementData_0x1900a4:
	step DOWN
	big_step UP
	turn_head DOWN
MovementData_0x1900a7:
	step LEFT
	step_end

MovementData_0x1900a9:
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end

MovementData_0x1900ad:
	step UP
	turn_head DOWN
	step_end

RageCandyBarMerchantTryOneText:
	text "Hi, Zwerg!"

	para "Ich sehe, du bist"
	line "neu in MAHAGONIA."

	para "Du musst unbedingt"
	line "einen WUTKEKS"
	cont "probieren!"

	para "Ich habe einen da-"
	line "bei. F??r nur ??300"
	cont "geh??rt er dir."
	done

RageCandyBarMerchantSavorItText:
	text "Gut! Genie??e ihn!"
	done

RageCandyBarMerchantNotEnoughMoneyText:
	text "Du hast nicht ge-"
	line "nug Geld."
	done

RageCandyBarMerchantRefusedText:
	text "Dann eben nicht???"
	done

RageCandyBarMerchantNoRoomText:
	text "Du hast keinen"
	line "Platz mehr."
	done

RageCandyBarMerchantSoldOutText:
	text "Die WUTKEKSE sind"
	line "ausverkauft."

	para "Ich verschwinde."
	line "St??r mich nicht,"
	cont "Kind."
	done

MahoganyTownGrampsText:
	text "Hast du vor, die"
	line "GARADOS am SEE an-"
	cont "zusehen?"
	done

MahoganyTownGrampsText_ClearedRocketHideout:
	text "Die KARPADOR sind"
	line "zum SEE DES ZORNS"
	cont "zur??ckgekehrt."

	para "Das sind gute Neu-"
	line "igkeiten f??r die"
	cont "Angler."
	done

MahoganyTownFisherText:
	text "Wenn du schon so"
	line "weit gekommen"

	para "bist, solltest du"
	line "dir die Zeit neh-"
	cont "men, um etwas"

	para "Sightseeing zu un-"
	line "ternehmen."

	para "Geh nach Norden"
	line "und sieh dir den"

	para "SEE DES ZORNS an."
	done

MahoganyTownLassText:
	text "Besuche Gro??mut-"
	line "ters Laden. Sie"

	para "verkauft Artikel,"
	line "die du sonst nir-"
	cont "gends bekommen"
	cont "kannst."
	done

MahoganyTownSignText:
	text "MAHAGONIA CITY"

	para "Willkommen in der"
	line "Stadt der Ninja"
	done

MahoganyTownRagecandybarSignText:
	text "Versuchen Sie den"
	line "leckeren WUTKEKS!"
	done

MahoganyGymSignText:
	text "PKMN-ARENA von"
	line "MAHAGONIA CITY"

	para "LEITUNG: NORBERT"
	line "Der Lehrer der"

	para "H??rte des Winters"
	done

MahoganyTown_MapEvents::
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	db 2 ; coord events
	coord_event 19,  8, SCENE_DEFAULT, MahoganyTownTryARageCandyBarScript
	coord_event 19,  9, SCENE_DEFAULT, MahoganyTownTryARageCandyBarScript

	db 4 ; bg events
	bg_event  1,  5, BGEVENT_READ, MahoganyTownSign
	bg_event  9,  7, BGEVENT_READ, MahoganyTownRagecandybarSign
	bg_event  3, 13, BGEVENT_READ, MahoganyGymSign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign

	db 4 ; object events
	object_event 19,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownPokefanMScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisherScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event 12,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLassScript, EVENT_MAHOGANY_MART_OWNERS
