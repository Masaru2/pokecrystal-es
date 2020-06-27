INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN


SECTION "maps/TrainerHouse1F", ROMX

TrainerHouse1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "Willkommen im"
	line "TRAINER-HAUS, dem"

	para "neuesten und"
	line "erlebnisreichsten"
	cont "Ort von VERTANIA"
	cont "CITY."

	para "Nur Trainer haben"
	line "hier Zutritt."

	para "Du kannst gegen"
	line "die Besten der"

	para "Besten antreten!"
	line "Geh nur die Treppe"
	cont "hinunter."
	done

TrainerHouse1FCooltrainerMText:
	text "VERTANIA CITY ist"
	line "dem INDIGO PLATEAU"
	cont "am nächsten."

	para "Man hat diesen Ort"
	line "erbaut, weil ihn"

	para "so viele Trainer"
	line "auf ihrem Weg zum"

	para "INDIGO PLATEAU "
	line "passieren."
	done

TrainerHouse1FCooltrainerFText:
	text "Hier unten werden"
	line "Übungskämpfe"
	cont "abgehalten."

	para "Ich würde liebend"
	line "gerne sehen, wie"

	para "Trainer aus JOHTO"
	line "kämpfen."
	done

TrainerHouse1FYoungsterText:
	text "Ich nehme an, du"
	line "kannst nur dann"

	para "CHAMP werden, wenn"
	line "du viel herum-"
	cont "kommst und so"

	para "viele Kämpfe wie"
	line "möglich austrägst."

	para "Der CHAMP von"
	line "ALABASTIA bereiste"

	para "alle großen und"
	line "kleinen Städte"
	cont "in KANTO."
	done

TrainerHouse1FGentlemanText:
	text "Puh… Ich höre"
	line "eine Zeit lang auf"
	cont "mit Kämpfen."
	done

TrainerHouseSign1Text:
	text "Übungskämpfe"
	line "werden unten in"

	para "der ÜBUNGSHALLE"
	line "abgehalten."

	para "Auch erfahrene"
	line "Trainer können"
	cont "gerne teilnehmen."
	done

TrainerHouseSign2Text:
	text "Bei den Trainings-"
	line "kämpfen gelten"

	para "keine Regeln oder"
	line "Vorgaben. Wie bei"

	para "den Feldkämpfen"
	line "ist alles erlaubt!"
	done

TrainerHouseIllegibleText:
	text "…Was ist das?"
	line "Eine strategische"
	cont "Notiz?"

	para "Dieses Schrift-"
	line "stück sieht aus"

	para "wie die Spur eines"
	line "ONIX…"
	cont "Völlig unlesbar…"
	done

TrainerHouse1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 13, VIRIDIAN_CITY, 3
	warp_event  3, 13, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	db 5 ; object events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  4,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
