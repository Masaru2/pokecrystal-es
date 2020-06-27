INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ECRUTEAKITEMFINDERHOUSE_COOLTRAINER_M
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX


SECTION "maps/EcruteakItemfinderHouse", ROMX

EcruteakItemfinderHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakTwoTowersText
	yesorno
	iftrue .KeepReading
	closetext
	end

.KeepReading:
	writetext EcruteakThreeMonText
	waitbutton
	closetext
	end

ItemFinderHouseRadio:
	jumpstd radio2

EcruteakItemfinderAdventureText:
	text "Ah, suchst du mit"
	line "deinen #MON"
	cont "nach Abenteuern?"

	para "Was wäre ein Aben-"
	line "teuer ohne eine"
	cont "Schatzsuche?"

	para "Hab ich Recht oder"
	line "hab ich Recht?"
	done

EcruteakItemfinderTrueSpiritText:
	text "Gut! Du trägst den"
	line "wahren Abenteurer-"
	cont "geist in dir."

	para "Das mag ich! Nimm"
	line "dies mit dir."
	done

ItemfinderExplanationText:
	text "Manchmal liegen"
	line "Items herum, die"

	para "man leicht über-"
	line "sieht."

	para "Setze den DETEKTOR"
	line "ein, um Items auf-"
	cont "zuspüren, die sich"

	para "in der Nähe befin-"
	line "den."

	para "Den exakten Fund-"
	line "ort musst du aber"

	para "selbst herausfin-"
	line "den."

	para "Ich hörte auch,"
	line "dass in der TURM-"
	cont "RUINE von TEAK"

	para "CITY Items zu fin-"
	line "den wären."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Oh… Jedem das"
	line "Seine…"
	done

EcruteakHistoryBookText:
	text "GESCHICHTE VON"
	line "TEAK CITY"

	para "Lesen?"
	done

EcruteakTwoTowersText:
	text "In TEAK CITY gab"
	line "es zwei Türme."

	para "Jeder Turm war das"
	line "Zuhause mächtiger"
	cont "fliegender #-"
	cont "MON."

	para "Doch einer der"
	line "Türme brannte ab."

	para "Die beiden #MON"
	line "wurden seitdem"
	cont "nicht mehr gese-"
	cont "hen…"

	para "Weiterlesen?"
	done

EcruteakThreeMonText:
	text "TEAK CITY war auch"
	line "die Heimat dreier"

	para "#MON, die"
	line "durch die Stadt"
	cont "rannten."

	para "Es heißt, sie ent-"
	line "standen durch Was-"
	cont "ser, Blitz und"
	cont "Feuer."

	para "Doch konnten sie"
	line "ihre Kräfte nicht"
	cont "beherrschen."

	para "Also sind sie wie"
	line "der Wind ins offe-"
	cont "ne Grasland ge-"
	cont "rannt."
	done

EcruteakItemfinderHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, ItemFinderHouseRadio

	db 2 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
