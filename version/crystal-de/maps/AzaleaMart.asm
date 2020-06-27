INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const AZALEAMART_CLERK
	const AZALEAMART_COOLTRAINER_M
	const AZALEAMART_BUG_CATCHER


SECTION "maps/AzaleaMart", ROMX

AzaleaMart_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AZALEA
	closetext
	end

AzaleaMartCooltrainerMScript:
	jumptextfaceplayer AzaleaMartCooltrainerMText

AzaleaMartBugCatcherScript:
	jumptextfaceplayer AzaleaMartBugCatcherText

AzaleaMartCooltrainerMText:
	text "Hier gibt es keine"
	line "SUPERBÄLLE. Ich"

	para "werde mit #-"
	line "BÄLLEN auskommen"
	cont "müssen."

	para "Ich wünschte, KURT"
	line "würde mir einen"
	cont "seiner BÄLLE"
	cont "machen."
	done

AzaleaMartBugCatcherText:
	text "Ein SUPERBALL eig-"
	line "net sich besser"
	cont "zum Fangen von"
	cont "#MON als ein"
	cont "#BALL."

	para "Aber manchmal sind"
	line "KURTs BÄLLE"
	cont "besser."
	done

AzaleaMart_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AZALEA_TOWN, 3
	warp_event  3,  7, AZALEA_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartClerkScript, -1
	object_event  2,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartCooltrainerMScript, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaMartBugCatcherScript, -1
