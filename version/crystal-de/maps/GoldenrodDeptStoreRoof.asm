INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const GOLDENRODDEPTSTOREROOF_CLERK
	const GOLDENRODDEPTSTOREROOF_POKEFAN_F
	const GOLDENRODDEPTSTOREROOF_FISHER
	const GOLDENRODDEPTSTOREROOF_TWIN
	const GOLDENRODDEPTSTOREROOF_SUPER_NERD
	const GOLDENRODDEPTSTOREROOF_POKEFAN_M
	const GOLDENRODDEPTSTOREROOF_TEACHER
	const GOLDENRODDEPTSTOREROOF_BUG_CATCHER


SECTION "maps/GoldenrodDeptStoreRoof", ROMX

GoldenrodDeptStoreRoof_MapScripts::
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .CheckSaleChangeBlock
	callback MAPCALLBACK_OBJECTS, .CheckSaleChangeClerk

.CheckSaleChangeBlock:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	return

.SaleIsOn:
	changeblock 0, 2, $3f ; cardboard boxes
	changeblock 0, 4, $0f ; vendor booth
	return

.CheckSaleChangeClerk:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	return

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	return

GoldenrodDeptStoreRoofClerkScript:
	opentext
	pokemart MARTTYPE_ROOFTOP, 0
	closetext
	end

GoldenrodDeptStoreRoofPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanFText

GoldenrodDeptStoreRoofFisherScript:
	faceplayer
	opentext
	writetext GoldenrodDeptStoreRoofFisherText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_FISHER, UP
	end

GoldenrodDeptStoreRoofTwinScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTwinText

GoldenrodDeptStoreRoofSuperNerdScript:
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdOhWowText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, UP
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, RIGHT
	end

GoldenrodDeptStoreRoofPokefanMScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanMText

GoldenrodDeptStoreRoofTeacherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTeacherText

GoldenrodDeptStoreRoofBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofBugCatcherText

Binoculars1:
	jumptext Binoculars1Text

Binoculars2:
	jumptext Binoculars2Text

Binoculars3:
	jumptext Binoculars3Text

PokeDollVendingMachine:
	jumptext PokeDollVendingMachineText

GoldenrodDeptStoreRoofPokefanFText:
	text "Puh, bin ich müde."

	para "Manchmal gehe ich"
	line "auf die Dach-"
	cont "terrasse, um eine"

	para "Einkaufspause"
	line "einzulegen."
	done

GoldenrodDeptStoreRoofFisherText:
	text "Bitte? Wer sagt,"
	line "dass das nichts"
	cont "für Erwachsene"
	cont "ist?"

	para "Ich komme jeden"
	line "Tag, um wirklich"

	para "alle Puppen zu"
	line "bekommen!"
	done

GoldenrodDeptStoreRoofTwinText:
	text "Oft gibt es hier"
	line "Sonderangebote."
	done

GoldenrodDeptStoreRoofSuperNerdOhWowText:
	text "Oh, wow!"
	done

GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText:
	text "Hörst du auf, mich"
	line "zu belästigen?"
	done

GoldenrodDeptStoreRoofPokefanMText:
	text "Es gibt etwas, das"
	line "ich unbedingt"

	para "möchte, aber mir"
	line "fehlt das nötige"
	cont "Kleingeld…"

	para "Soll ich meine"
	line "gesammelten BEEREN"
	cont "verkaufen…"
	done

GoldenrodDeptStoreRoofTeacherText:
	text "Oh, alles ist so"
	line "billig!"

	para "Ich habe soviel"
	line "gekauft, dass mein"
	cont "BEUTEL voll ist!"
	done

GoldenrodDeptStoreRoofBugCatcherText:
	text "Meine #MON"
	line "sind immer para-"
	cont "lysiert oder ver-"
	cont "giftet, wenn es"
	cont "darauf ankommt…"

	para "Daher möchte ich"
	line "HYPERHEILER"
	cont "kaufen."

	para "Hoffentlich gibt"
	line "es noch welche?"
	done

Binoculars1Text:
	text "Mit diesem Fern-"
	line "glas kann ich weit"

	para "sehen. Vielleicht"
	line "sogar mein Haus."

	para "Ist es das mit dem"
	line "grünen Dach?"
	done

Binoculars2Text:
	text "Heh! Einige"
	line "Trainer kämpfen"
	cont "auf dem Weg!"

	para "Ein #MON schoss"
	line "mit Blättern!"

	para "Wenn ich das sehe,"
	line "will ich sofort"
	cont "kämpfen!"
	done

Binoculars3Text:
	text "Ein ANGLER fing"
	line "viele KARPADOR…"

	para "Sie setzen alle"
	line "gleichzeitig"
	cont "PLATSCHER ein!"

	para "Sieh nur wie das"
	line "Wasser überall"
	cont "hinspritzt!"
	done

PokeDollVendingMachineText:
	text "Ein Automat, an"
	line "dem man #MON-"
	cont "Puppen kaufen"
	cont "kann."

	para "Wirf Geld ein und"
	line "dreh die Kurbel…"

	para "Er ist fast leer…"
	done

GoldenrodDeptStoreRoof_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  1, GOLDENROD_DEPT_STORE_6F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event 15,  3, BGEVENT_RIGHT, Binoculars1
	bg_event 15,  5, BGEVENT_RIGHT, Binoculars2
	bg_event 15,  6, BGEVENT_RIGHT, Binoculars3
	bg_event  3,  0, BGEVENT_UP, PokeDollVendingMachine

	db 8 ; object events
	object_event  1,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofClerkScript, EVENT_GOLDENROD_SALE_OFF
	object_event 10,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanFScript, -1
	object_event  2,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofFisherScript, -1
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTwinScript, EVENT_GOLDENROD_SALE_ON
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofSuperNerdScript, EVENT_GOLDENROD_SALE_ON
	object_event  7,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanMScript, EVENT_GOLDENROD_SALE_OFF
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTeacherScript, EVENT_GOLDENROD_SALE_OFF
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofBugCatcherScript, EVENT_GOLDENROD_SALE_OFF
