INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_COOLTRAINER_M
	const CHERRYGROVEMART_YOUNGSTER


SECTION "maps/CherrygroveMart", ROMX

CherrygroveMart_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveMartClerkScript:
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

.PokeBallsInStock:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

CherrygroveMartCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .PokeBallsInStock
	writetext CherrygroveMartCooltrainerMText
	waitbutton
	closetext
	end

.PokeBallsInStock:
	writetext CherrygroveMartCooltrainerMText_PokeBallsInStock
	waitbutton
	closetext
	end

CherrygroveMartYoungsterScript:
	jumptextfaceplayer CherrygroveMartYoungsterText

CherrygroveMartCooltrainerMText:
	text "Die #BÄLLE"
	line "sind leider aus-"
	cont "verkauft!"

	para "Hoffentlich kommt"
	line "bald eine neue"
	cont "Lieferung!"
	done

CherrygroveMartCooltrainerMText_PokeBallsInStock:
	text "#BÄLLE sind"
	line "wieder auf Lager!"
	cont "Jetzt kann ich"
	cont "#MON fangen!"
	done

CherrygroveMartYoungsterText:
	text "Als ich durch das"
	line "Gras spazierte,"

	para "hat ein Käfer-"
	line "#MON mein"

	para "#MON ver-"
	line "giftet!"

	para "Ich ging einfach"
	line "weiter, aber dann"
	cont "wurde mein #-"
	cont "MON plötzlich be-"
	cont "siegt."

	para "Du solltest stän-"
	line "dig ein GEGENGIFT"
	cont "mit dir führen."
	done

CherrygroveMart_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 1
	warp_event  3,  7, CHERRYGROVE_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveMartCooltrainerMScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveMartYoungsterScript, -1
