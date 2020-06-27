INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2
	const FASTSHIPB1F_SAILOR3
	const FASTSHIPB1F_LASS
	const FASTSHIPB1F_SUPER_NERD
	const FASTSHIPB1F_SAILOR4
	const FASTSHIPB1F_FISHER
	const FASTSHIPB1F_BLACK_BELT
	const FASTSHIPB1F_SAILOR5
	const FASTSHIPB1F_TEACHER
	const FASTSHIPB1F_YOUNGSTER1
	const FASTSHIPB1F_YOUNGSTER2


SECTION "maps/FastShipB1F", ROMX

FastShipB1F_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FastShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 30, 6
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FastShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 31, 6
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
	end

FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .FirstTime
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue .AlreadyInformed
	writetext FastShipB1FOnDutySailorText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

.AlreadyInformed:
	writetext FastShipB1FOnDutySailorRefusedText
	waitbutton
	closetext
	end

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse .NotFoundGirl
	waitbutton
	closetext
	end

.NotFoundGirl:
	promptbutton
	writetext FastShipB1FOnDutySailorSawLittleGirlText
	waitbutton
	closetext
	end

.FirstTime:
	writetext FastShipB1FOnDutySailorDirectionsText
	waitbutton
	closetext
	end

TrainerSailorJeff:
	trainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeffAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDebra:
	trainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDebraAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerFritz:
	trainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerFritzAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltWai:
	trainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltWaiAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKenneth:
	trainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKennethAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherShirley:
	trainer TEACHER, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherShirleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyNate:
	trainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyNateAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyRicky:
	trainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyRickyAfterBattleText
	waitbutton
	closetext
	end

FastShipB1FTrashcan:
	jumpstd trashcan

FastShipB1FSailorBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FSailorBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FOnDutySailorText:
	text "Heh, könntest"
	line "du mal nach meinem"
	cont "Kollegen suchen?"

	para "Er faulenzt"
	line "irgendwo. Dieser"
	cont "Müßiggänger!"

	para "Ich würde ihn"
	line "selbst suchen,"
	cont "aber ich bin"
	cont "gerade im Dienst."
	done

FastShipB1FOnDutySailorRefusedText:
	text "Oh, oh…"

	para "Der KAPITÄN"
	line "wird wütend sein…"
	done

FastShipB1FOnDutySailorThanksText:
	text "Danke!"
	line "Ich habe mit ihm"

	para "geredet, er wird"
	line "nicht mehr"
	cont "faulenzen!"
	done

FastShipB1FOnDutySailorSawLittleGirlText:
	text "Ein kleines"
	line "Mädchen?"

	para "Ich glaube, sie"
	line "ist hier vorbei-"
	cont "gekommen."
	done

FastShipB1FOnDutySailorDirectionsText:
	text "Der Speisesaal"
	line "ist geradeaus."

	para "Die Treppen am"
	line "Ende führen in"
	cont "die KAPITÄNS-"
	cont "KAJÜTE."
	done

SailorJeffSeenText:
	text "In den Pausen ist"
	line "Kämpfen meine"
	cont "Lieblingsbeschäf-"
	cont "tigung."
	done

SailorJeffBeatenText:
	text "Sieg oder"
	line "Niederlage, meine"
	cont "Pause ist vorüber!"
	done

SailorJeffAfterBattleText:
	text "Ich denke, ich"
	line "werde nie"
	cont "gewinnen, wenn ich"
	cont "die Sache nicht"
	cont "ernst nehme."
	done

PicnickerDebraSeenText:
	text "Mir ist lang-"
	line "weilig. Willst du"
	cont "kämpfen?"
	done

PicnickerDebraBeatenText:
	text "Au! Du bist zu"
	line "stark!"
	done

PicnickerDebraAfterBattleText:
	text "SAFFRONIA,"
	line "PRISMANIA…"
	cont "Ich habe gehört,"

	para "es gibt viele"
	line "große Städte"
	cont "in KANTO."
	done

JugglerFritzSeenText:
	text "Uff…"
	line "Ich bin seekrank!"
	done

JugglerFritzBeatenText:
	text "Ich kann mich"
	line "nicht bewegen…"
	done

JugglerFritzAfterBattleText:
	text "Ich reise nie"
	line "mehr mit dem"

	para "Schiff. Das"
	line "nächste Mal nehme"
	cont "ich den MAGNETZUG."
	done

SailorGarrettSeenText:
	text "Hier arbeiten wir"
	line "Matrosen!"
	done

SailorGarrettBeatenText:
	text "Ich habe auf"
	line "eigenem Terrain"
	cont "verloren…"
	done

SailorGarrettAfterBattleText:
	text "Wir bringen unsere"
	line "Passagiere von"

	para "ORANIA CITY nach"
	line "OLIVIANA CITY."
	done

FisherJonahSeenText:
	text "Auch wenn wir"
	line "mit dem Schiff"
	cont "fahren, kann ich"
	cont "nicht angeln!"

	para "Wie langweilig!"
	line "Lass uns kämpfen!"
	done

FisherJonahBeatenText:
	text "M-mir ist nicht"
	line "mehr langweilig…"
	done

FisherJonahAfterBattleText:
	text "Ich werde am Kai"
	line "von ORANIA angeln."
	done

BlackbeltWaiSeenText:
	text "Ich trainiere"
	line "meine Beine, indem"

	para "ich das Schaukeln"
	line "des Schiffes"
	cont "ausgleiche!"
	done

BlackbeltWaiBeatenText:
	text "Gestürzt und platt"
	line "gemacht!"
	done

BlackbeltWaiAfterBattleText:
	text "Ich konnte den"
	line "KARATE-MEISTER in"
	cont "JOHTO nicht"
	cont "finden."

	para "Er soll irgendwo"
	line "in einer Höhle"
	cont "trainieren."
	done

SailorKennethSeenText:
	text "Ich bin Matrose!"

	para "Aber ich trainiere"
	line "#MON, um"
	cont "der CHAMP zu"
	cont "werden!"
	done

SailorKennethBeatenText:
	text "Mein Trainings-"
	line "rückstand ist"
	cont "offensichtlich…"
	done

SailorKennethAfterBattleText:
	text "Acht ORDEN!"
	line "Das heißt, du"

	para "hast die ARENA-"
	line "LEITER besiegt."

	para "Kein Wunder, dass"
	line "du so stark bist!"
	done

TeacherShirleySeenText:
	text "Lass die Finger"
	line "von meinen"
	cont "Schülern!"
	done

TeacherShirleyBeatenText:
	text "Ah!"
	done

TeacherShirleyAfterBattleText:
	text "Wir machen einen"
	line "Ausflug zu den"
	cont "RUINEN bei"
	cont "VIOLA CITY."
	done

SchoolboyNateSeenText:
	text "Kennst du die"
	line "ALPH-RUINEN?"
	done

SchoolboyNateBeatenText:
	text "Ah!"
	done

SchoolboyNateAfterBattleText:
	text "In den RUINEN"
	line "empfängt das Radio"
	cont "seltsame Signale."
	done

SchoolboyRickySeenText:
	text "In den ALPH-RUINEN"
	line "gibt es seltsame"
	cont "Steinplatten."
	done

SchoolboyRickyBeatenText:
	text "Ich wurde"
	line "vermöbelt!"
	done

SchoolboyRickyAfterBattleText:
	text "Ich habe gelesen,"
	line "dass es vier von"
	cont "den Steinplatten"
	cont "gibt."
	done

FastShipB1F_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, FAST_SHIP_1F, 11
	warp_event 31, 13, FAST_SHIP_1F, 12

	db 2 ; coord events
	coord_event 30,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksLeft
	coord_event 31,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksRight

	db 1 ; bg events
	bg_event 27,  9, BGEVENT_READ, FastShipB1FTrashcan

	db 12 ; object events
	object_event 30,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 31,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  9, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 26,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 17,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 25,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 15, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 23,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  9, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
