INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const GOLDENRODDEPTSTORE2F_CLERK1
	const GOLDENRODDEPTSTORE2F_CLERK2
	const GOLDENRODDEPTSTORE2F_YOUNGSTER
	const GOLDENRODDEPTSTORE2F_COOLTRAINER_F
	const GOLDENRODDEPTSTORE2F_GENTLEMAN


SECTION "maps/GoldenrodDeptStore2F", ROMX

GoldenrodDeptStore2F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_1
	closetext
	end

GoldenrodDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2
	closetext
	end

GoldenrodDeptStore2FYoungsterScript:
	jumptextfaceplayer GoldenrodDeptStore2FYoungsterText

GoldenrodDeptStore2FCooltrainerFScript:
	jumptextfaceplayer GoldenrodDeptStore2FCooltrainerFText

GoldenrodDeptStore2FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore2FGentlemanText

GoldenrodDeptStore2FDirectory:
	jumptext GoldenrodDeptStore2FDirectoryText

GoldenrodDeptStore2FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore2FUnusedText1:
; unused
	text "Wir wollen Items"
	line "verkaufen, die von"
	cont "#MON getragen"
	cont "werden können."

	para "Das ist ein Werbe-"
	line "Geschenk. Lass ein"
	cont "#MON es tragen."
	done

GoldenrodDeptStore2FUnusedText2:
; unused
	text "Trägt ein #MON"
	line "ein Item, könnte"
	cont "das einen Kampf zu"
	cont "deinen Gunsten"
	cont "entscheiden."
	done

GoldenrodDeptStore2FYoungsterText:
	text "Der #COM kann"
	line "bis zu zehn Num-"
	cont "mern speichern."

	para "Es ist schwer zu"
	line "entscheiden, wel-"
	cont "che Nummer man be-"
	cont "halten soll."
	done

GoldenrodDeptStore2FCooltrainerFText:
	text "Ich habe mein ABRA"
	line "in der SPIELHALLE"

	para "gewonnen. Jetzt"
	line "ist es mein bester"

	para "Partner."
	done

GoldenrodDeptStore2FGentlemanText:
	text "Dieses KAUFHAUS"
	line "zeigt mir, dass"

	para "DUKATIA CITY eine"
	line "sehr große Stadt"
	cont "ist."

	para "Dieses Angebot ist"
	line "unübertrefflich!"
	done

GoldenrodDeptStore2FDirectoryText:
	text "Ihr Reise-"
	line "begleiter"

	para "1S TRAINER-"
	line "   MARKT"
	done

GoldenrodDeptStore2F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_3F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_1F, 3
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore2FElevatorButton

	db 5 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk1Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FYoungsterScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FGentlemanScript, -1
