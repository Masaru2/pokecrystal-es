INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER


SECTION "maps/Route40", ROMX

Route40_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MonicaCallback

.MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	return

.MonicaAppears:
	appear ROUTE40_MONICA
	return

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer Route40PokefanMText

.mobile
	jumptextfaceplayer Route40PokefanMText_Mobile

Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd smashrock

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

MovementData_0x1a621c:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a6224:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a622a:
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermSimonSeenText:
	text "Du musst dich erst"
	line "aufwärmen, bevor"
	cont "du schwimmen"
	cont "gehst."

	para "Das ist"
	line "Grundwissen."
	done

SwimmermSimonBeatenText:
	text "O.K.! Onkel! Ich"
	line "gebe auf!"
	done

SwimmermSimonAfterBattleText:
	text "ANEMONIA CITY ist"
	line "ziemlich weit"
	cont "weg von hier."
	done

SwimmermRandallSeenText:
	text "Heh, du bist jung"
	line "und fit!"

	para "Surfe nicht auf"
	line "deinem #MON!"
	cont "Schwimme!"
	done

SwimmermRandallBeatenText:
	text "Oh, oh. Ich habe"
	line "verloren…"
	done

SwimmermRandallAfterBattleText:
	text "Schwimmen hält"
	line "deinen ganzen"
	cont "Körper fit und"
	cont "gesund."
	done

SwimmerfElaineSeenText:
	text "Gehst du nach"
	line "ANEMONIA CITY?"

	para "Wie wäre es erst"
	line "mit einem kleinen"
	cont "Kampftraining?"
	done

SwimmerfElaineBeatenText:
	text "Diesmal habe ich"
	line "verloren!"
	done

SwimmerfElaineAfterBattleText:
	text "Ich behaupte,"
	line "dass ich besser"
	cont "schwimme als du!"
	done

SwimmerfPaulaSeenText:
	text "Ich habe keine"
	line "Schwimmreifen."

	para "Ich halte mich an"
	line "einem Wasser-"
	cont "#MON fest!"
	done

SwimmerfPaulaBeatenText:
	text "Oh, ich fühle mich"
	line "so schwindelig!"
	done

SwimmerfPaulaAfterBattleText:
	text "Ich lasse mich im"
	line "Wasser treiben und"
	cont "von den Wellen"
	cont "davontragen."
	done

Route40Lass1Text:
	text "Du kannst es zwar"
	line "nicht von hier"

	para "sehen, aber ANEMO-"
	line "NIA CITY liegt"
	cont "jenseits des"
	cont "Meeres."
	done

Route40PokefanMText:
	text "Hm! Das ist ein"
	line "hohes Gebäude!"

	para "Was ist das?"
	done

Route40PokefanMText_Mobile:
	text "Hm! Sieh die"
	line "entschlossenen"
	cont "Trainer, die"
	cont "hineingehen."

	para "Was? Was?"
	done

Route40Lass2Text:
	text "Ich reiste mit dem"
	line "Schiff nach"

	para "OLIVIANA, um die"
	line "Sehenswürdigkeiten"

	para "und die Atmosphäre"
	line "zu genießen."

	para "Da es eine Hafen-"
	line "stadt ist, unter-"

	para "scheidet sie sich"
	line "von anderen"
	cont "großen Städten."
	done

Route40StandingYoungsterText:
	text "Warst du schon am"
	line "DUELLTURM?"

	para "Ich denke, dass"
	line "sich bereits viele"

	para "starke Trainer"
	line "dort versammeln."

	para "Da du so viele"
	line "ORDEN besitzt,"

	para "wirst du dich dort"
	line "wacker schlagen."
	done

MeetMonicaText:
	text "MONJA: Es freut"
	line "mich, dich kennen"

	para "zu lernen. Ich bin"
	line "MONJA von Montag."
	done

MonicaGivesGiftText:
	text "Als Zeichen"
	line "unserer Freund-"
	cont "schaft schenke ich"
	cont "dir dies!"
	done

MonicaGaveGiftText:
	text "MONJA: Dieses"
	line "Item verstärkt"

	para "Flug-Attacken."

	para "Damit solltest du"
	line "ein Vogel-#MON"
	cont "ausstatten."
	done

MonicaMondayText:
	text "MONJA: Meine"
	line "Geschwister"

	para "findest du"
	line "überall."

	para "Du solltest sie"
	line "alle finden!"
	done

MonicaNotMondayText:
	text "MONJA: Ich"
	line "fürchte, heute ist"
	cont "nicht Montag. Wie"
	cont "schade…"
	done

Route40SignText:
	text "ROUTE 40"

	para "ANEMONIA CITY -"
	line "OLIVIANA CITY"
	done

Route40_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 10, BGEVENT_READ, Route40Sign
	bg_event  7,  8, BGEVENT_ITEM, Route40HiddenHyperPotion

	db 12 ; object events
	object_event 14, 18, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 18, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 10, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8, 10, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event 12,  9, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
