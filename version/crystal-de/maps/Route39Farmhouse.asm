INCLUDE "constants/maps_common.inc"

ROUTE39FARMHOUSE_MILK_PRICE EQU 500

	object_const_def ; object_event constants
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F


SECTION "maps/Route39Farmhouse", ROMX

Route39Farmhouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegiveitem TM_SNORE
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd picturebookshelf

FarmerMText_SickCow:
	text "Mein MILTANK gibt"
	line "keine Milch"
	cont "mehr."

	para "Diese FARM ist"
	line "berühmt für die"
	cont "Milch, die hier"
	cont "produziert wird."

	para "Fast jeder trinkt"
	line "sie gern."

	para "Es würde mir viel"
	line "Milch geben, wenn"

	para "ich es mit vielen"
	line "BEEREN füttern"
	cont "würde. Glaube ich"
	cont "zumindest."
	done

FarmerMText_BuyMilk:
	text "Wie findest du"
	line "die MILCH von"
	cont "meinem MILTANK?"

	para "Sie ist mein gan-"
	line "zer Stolz."

	para "Gib sie einem"
	line "#MON, um dessen"
	cont "KP aufzufrischen!"

	para "Ich gebe sie dir"
	line "für nur ¥500."
	done

FarmerMText_GotMilk:
	text "Bitte sehr!"
	line "Trink aus und"
	cont "genieße es!"
	done

FarmerMText_NoMoney:
	text "Tut mir Leid, mein"
	line "Kind. Wenn du kein"
	cont "Geld hast, kann"
	cont "ich dir nichts"
	cont "verkaufen!"
	done

FarmerMText_NoRoom:
	text "Ich schätze,"
	line "dein BEUTEL ist"
	cont "voll."
	done

FarmerMText_NoSale:
	text "Du hast kein"
	line "Interesse? Komm"
	cont "aber wieder, hörst"
	cont "du?"
	done

FarmerMText_Milking:
	text "Dann melke ich"
	line "mal weiter."
	done

FarmerFText_InTrouble:
	text "Unsere Milch wird"
	line "sogar nach KANTO"
	cont "geliefert."

	para "Wenn uns unser"
	line "MILTANK keine"

	para "Milch mehr gibt,"
	line "haben wir echte"
	cont "Probleme."
	done

FarmerFText_HealedMiltank:
	text "Du hast unserem"
	line "MILTANK geholfen!"

	para "Jetzt gibt es"
	line "wieder Milch!"

	para "Hier, für deine"
	line "Mühe."
	done

Text_ReceivedTM13:
	text "<PLAYER> erhält"
	line "TM13."
	done

FarmerFText_SnoreSpeech:
	text "Das hier ist"
	line "SCHNARCHER."

	para "Das ist eine"
	line "seltene Attacke,"

	para "die nur ein schla-"
	line "fendes #MON"
	cont "einsetzen kann."

	para "Überlege dir gut,"
	line "wie du sie"
	cont "anwendest."
	done

Route39Farmhouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	db 2 ; object events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
