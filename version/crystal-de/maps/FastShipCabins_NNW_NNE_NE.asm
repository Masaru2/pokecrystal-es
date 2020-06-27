INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_M
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_F
	const FASTSHIPCABINS_NNW_NNE_NE_SUPER_NERD
	const FASTSHIPCABINS_NNW_NNE_NE_POKEFAN_M
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	const FASTSHIPCABINS_NNW_NNE_NE_GENTLEMAN
	const FASTSHIPCABINS_NNW_NNE_NE_PHARMACIST


SECTION "maps/FastShipCabins_NNW_NNE_NE", ROMX

FastShipCabins_NNW_NNE_NE_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainermSean:
	trainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermSeanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCarol:
	trainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCarolAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacEthan:
	trainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacEthanAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerNoland:
	trainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerNolandAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanEdward:
	trainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanEdwardAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarCorey:
	trainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarCoreyAfterBattleText
	waitbutton
	closetext
	end

FastShipLazySailorScript:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	opentext
	writetext SailorStanlySeenText
	waitbutton
	closetext
	winlosstext SailorStanlyBeatenText, 0
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	opentext
	writetext SailorStanlyAfterBattleText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FINISHED
	readvar VAR_FACING
	ifequal RIGHT, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd trashcan

FastShipLazySailorLeavesMovement1:
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

FastShipLazySailorLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

CooltrainermSeanSeenText:
	text "Ich werde mein"
	line "Können in KANTO"
	cont "testen."
	done

CooltrainermSeanBeatenText:
	text "Ich wollte"
	line "gewinnen!"
	done

CooltrainermSeanAfterBattleText:
	text "Trainer aus JOHTO"
	line "können gegen die"

	para "ARENALEITER aus"
	line "KANTO antreten."
	done

CooltrainerfCarolSeenText:
	text "Ich trainiere, um"
	line "der CHAMP zu"
	cont "werden!"
	done

CooltrainerfCarolBeatenText:
	text "Worin unter-"
	line "scheiden wir uns?"
	done

CooltrainerfCarolAfterBattleText:
	text "Eines Tages werde"
	line "ich dich besiegen!"
	done

PokemaniacEthanSeenText:
	text "Kennst du LILLY?"
	line "Sie ist ein klasse"
	cont "DJ in KANTO."
	done

PokemaniacEthanBeatenText:
	text "Uargh!"
	done

PokemaniacEthanAfterBattleText:
	text "LILLY ist gut,"
	line "aber MARGIT ist"
	cont "die Beste!"

	para "Ich möchte gerne"
	line "alle Radiosender"
	cont "von JOHTO anhören!"
	done

HikerNolandSeenText:
	text "Bist du allein?"
	line "Lass uns kämpfen!"
	done

HikerNolandBeatenText:
	text "Das ist zu viel"
	line "für mich!"
	done

HikerNolandAfterBattleText:
	text "Ich frage mich, ob"
	line "es in KANTO Berge"

	para "gibt, die eine"
	line "Besteigung wert"
	cont "sind?"
	done

SailorStanlySeenText:
	text "Richtig, ich bin"
	line "ein Matrose."

	para "Ich habe nicht"
	line "gefaulenzt!"

	para "Die Kabine war"
	line "frei, darum habe"
	cont "ich ein Nickerchen"
	cont "gemacht!"

	para "Was soll's!"
	line "Lass uns kämpfen!"
	done

SailorStanlyBeatenText:
	text "Es war alles meine"
	line "Schuld!"
	done

SailorStanlyAfterBattleText:
	text "Als Matrose muss"
	line "man körperlich"
	cont "arbeiten. Das ist"
	cont "sehr anstrengend!"
	done

GentlemanEdwardSeenText:
	text "Oh, nein. Ich"
	line "habe etwas sehr"
	cont "Wichtiges ver-"
	cont "loren."
	done

GentlemanEdwardBeatenText:
	text "Ich… ich kann es"
	line "nicht finden…"
	done

GentlemanEdwardAfterBattleText:
	text "Ich gebe auf. Du"
	line "musst nicht danach"

	para "suchen. Vergiss"
	line "es einfach!"
	done

BurglarCoreySeenText:
	text "Juhu!"
	line "Was für ein Glück!"
	done

BurglarCoreyBeatenText:
	text "Pech gehabt!"
	line "Ich habe verloren!"
	done

BurglarCoreyAfterBattleText:
	text "Ich habe hier"
	line "eine tolle Münze"

	para "gefunden. Jemand"
	line "muss sie verloren"
	cont "haben…"
	done

FastShipCabins_NNW_NNE_NE_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 13, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 19, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 31, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan

	db 7 ; object events
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
