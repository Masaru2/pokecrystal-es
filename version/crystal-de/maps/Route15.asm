INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL


SECTION "maps/Route15", ROMX

Route15_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerTeacherColette:
	trainer TEACHER, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer TEACHER, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHillaryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyKipp:
	trainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyKippAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyTommyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJohnnyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyBilly:
	trainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyBillyAfterBattleText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball PP_UP

TeacherColetteSeenText:
	text "Hast du etwas"
	line "vergessen?"
	done

TeacherColetteBeatenText:
	text "Uah!"
	done

TeacherColetteAfterBattleText:
	text "Ehe ich Lehrer"
	line "wurde, vergaß ich"

	para "immer eine Menge"
	line "Dinge."
	done

TeacherHillarySeenText:
	text "Bei schönem Wetter"
	line "würden die Kinder"

	para "lieber im Schulhof"
	line "spielen, als in"

	para "den Klassenzimmern"
	line "zu lernen."
	done

TeacherHillaryBeatenText:
	text "Ich wollte nicht"
	line "verlieren…"
	done

TeacherHillaryAfterBattleText:
	text "Lernen ist sehr"
	line "wichtig, aber"
	cont "Bewegung ist"
	cont "genauso essen-"
	cont "tiell."
	done

SchoolboyKippSeenText:
	text "Warte! Ich muss"
	line "meine Mutter"
	cont "anrufen."
	done

SchoolboyKippBeatenText:
	text "Tut mir Leid,"
	line "Mutter!"
	cont "Ich wurde besiegt!"
	done

SchoolboyKippAfterBattleText:
	text "Meine Mutter macht"
	line "sich immer große"

	para "Sorgen um mich."
	line "Ständig muss ich"
	cont "sie anrufen."
	done

SchoolboyTommySeenText:
	text "Lass uns kämpfen."
	line "Ich werde nicht"
	cont "verlieren!"
	done

SchoolboyTommyBeatenText:
	text "Ich hätte meine"
	line "Hausaufgaben"
	cont "machen sollen!"
	done

SchoolboyTommyAfterBattleText:
	text "Sayonara! Das habe"
	line "ich in meinem"
	cont "Japanischkurs"
	cont "gelernt."
	done

SchoolboyJohnnySeenText:
	text "Wir machen einen"
	line "Ausflug zum RADIO-"
	cont "TURM in LAVANDIA,"

	para "um dort etwas in"
	line "Sozialkunde zu"
	cont "lernen."
	done

SchoolboyJohnnyBeatenText:
	text "Du bist unheimlich"
	line "stark!"
	done

SchoolboyJohnnyAfterBattleText:
	text "Ich bin müde vom"
	line "Laufen. Ich muss"
	cont "eine Pause machen."
	done

SchoolboyBillySeenText:
	text "Sport ist mein"
	line "Lieblingsfach!"
	done

SchoolboyBillyBeatenText:
	text "Oh, nein!"
	line "Wie konnte ich nur"

	para "verlieren?"
	done

SchoolboyBillyAfterBattleText:
	text "Wenn #MON ein"
	line "Unterrichtsfach"
	cont "wäre, dann wäre"
	cont "ich bestimmt der"
	cont "Beste!"
	done

Route15SignText:
	text "ROUTE 15"

	para "FUCHSANIA CITY -"
	line "LAVANDIA"
	done

Route15_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  2,  5, ROUTE_15_FUCHSIA_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19,  9, BGEVENT_READ, Route15Sign

	db 7 ; object events
	object_event 10, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	object_event 33, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	object_event 27, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyBilly, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
