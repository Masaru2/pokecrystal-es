INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER


SECTION "maps/Route21", ROMX

Route21_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Mach weiter so!"
	done

SwimmermSethBeatenText:
	text "Gluck…"
	done

SwimmermSethAfterBattleText:
	text "Dieser arrogante"
	line "Typ war beim"
	cont "Vulkan auf der"
	cont "ZINNOBERINSEL."
	done

SwimmerfNikkiSeenText:
	text "Falls ich gewinne,"
	line "musst du mich mit"
	cont "der Sonnencreme"
	cont "einreiben!"
	done

SwimmerfNikkiBeatenText:
	text "Ich habe Angst vor"
	line "einem Sonnenbrand…"
	done

SwimmerfNikkiAfterBattleText:
	text "Ich muss mich"
	line "vor Hautreizungen"
	cont "in Acht nehmen."
	done

FisherArnoldSeenText:
	text "Angeln langweilt"
	line "mich. Lass uns"
	cont "kämpfen!"
	done

FisherArnoldBeatenText:
	text "Total versagt…"
	done

FisherArnoldAfterBattleText:
	text "Ich gehe zurück"
	line "zum Angeln…"
	done

Route21_MapEvents::
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 11, 16, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  2, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event 14, 22, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
