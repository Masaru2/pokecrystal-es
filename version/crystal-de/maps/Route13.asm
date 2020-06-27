INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3


SECTION "maps/Route13", ROMX

Route13_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

PokefanmAlexSeenText:
	text "Verbeuge dich vor"
	line "meinen königlichen"
	cont "#MON!"
	done

PokefanmAlexBeatenText:
	text "Wie… wie kannst"
	line "du es wagen, die"
	cont "Monarchie zu"
	cont "verspotten?"
	done

PokefanmAlexAfterBattleText:
	text "Möchte nicht jeder"
	line "eines Tages einmal"
	cont "König sein?"
	done

PokefanmJoshuaSeenText:
	text "Hihi! Möchtest du"
	line "gegen mein"
	cont "PIKACHU-Team"
	cont "antreten?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "Es scheint, dass"
	line "du viele #MON"

	para "hast, aber PIKACHU"
	line "ist immer noch das"
	cont "Beste."
	done

BirdKeeperPerrySeenText:
	text "Agilität ist die"
	line "wichtigste Eigen-"
	cont "schaft von Vogel-"
	cont "#MON."
	done

BirdKeeperPerryBeatenText:
	text "Du hast mich"
	line "aufgrund deiner"
	cont "Schnelligkeit"
	cont "besiegt…"
	done

BirdKeeperPerryAfterBattleText:
	text "Deine #MON sind"
	line "in der Tat sehr"
	cont "gut trainiert."
	done

BirdKeeperBretSeenText:
	text "Schau dir meine"
	line "#MON an. Sieh"

	para "ihre Farben und"
	line "ihr Gefieder."
	done

BirdKeeperBretBeatenText:
	text "Verflixt!"
	line "Nicht gut genug!"
	done

BirdKeeperBretAfterBattleText:
	text "Wenn du deine"
	line "#MON pflegst,"
	cont "sind sie fröhlich."
	done

HikerKennySeenText:
	text "Ich sollte zum"
	line "FELSTUNNEL gehen"
	cont "und mir ein ONIX"
	cont "fangen."
	done

HikerKennyBeatenText:
	text "Ich habe verloren…"
	done

HikerKennyAfterBattleText:
	text "Es scheint, als"
	line "würden sich geo-"
	cont "logische Gegeben-"
	cont "heiten nicht"
	cont "ändern."

	para "Aber sie ändern"
	line "sich; langsam,"
	cont "ganz langsam."
	done

Route13TrainerTipsText:
	text "TIPPS für TRAINER"

	para "Schau! Hier, an"
	line "der linken Seite"
	cont "des Pfostens."
	done

Route13SignText:
	text "ROUTE 13"

	para "NÖRDLICH ZUR"
	line "SCHWEIGEBRÜCKE"
	done

Route13DirectionsSignText:
	text "Nördlich nach"
	line "LAVANDIA"

	para "Westlich nach"
	line "FUCHSANIA CITY"
	done

Route13_MapEvents::
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 4 ; bg events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	db 5 ; object events
	object_event 42,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 43,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
