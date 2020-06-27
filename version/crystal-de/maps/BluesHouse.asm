INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const BLUESHOUSE_DAISY


SECTION "maps/BluesHouse", ROMX

BluesHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	faceplayer
	opentext
	readvar VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	promptbutton
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end

DaisyHelloText:
	text "SARAH: Hi! Mein"
	line "kleiner Bruder ist"

	para "ARENALEITER in"
	line "VERTANIA CITY."

	para "Aber er verlässt"
	line "die Stadt so oft,"

	para "dass die Trainer"
	line "Schwierigkeiten"
	cont "bekommen."
	done

DaisyOfferGroomingText:
	text "SARAH: Hi! Gutes"
	line "Timing. Ich war"
	cont "gerade dabei, Tee"
	cont "zu machen."

	para "Hättest du auch"
	line "gern eine"
	cont "Tasse Tee?"

	para "Oh, deine #MON"
	line "sehen ein bisschen"
	cont "mitgenommen aus."

	para "Möchtest du, dass"
	line "ich eines für dich"
	cont "verschönere?"
	done

DaisyWhichMonText:
	text "SARAH: Welches"
	line "soll ich ver-"
	cont "schönern?"
	done

DaisyAlrightText:
	text "SARAH: Gut. In"
	line "kürzester Zeit"
	cont "wird es hübsch und"
	cont "adrett aussehen."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " sieht"
	line "zufrieden aus."
	done

DaisyAllDoneText:
	text "SARAH: Hier bitte."
	line "Schon fertig."

	para "Siehst du? Ist es"
	line "jetzt nicht"
	cont "wunderschön?"

	para "Es ist so ein"
	line "süßes #MON."
	done

DaisyAlreadyGroomedText:
	text "SARAH: Um diese"
	line "Zeit trinke ich"

	para "immer meinen Tee."
	line "Möchtest du auch"
	cont "eine Tasse Tee?"
	done

DaisyRefusedText:
	text "SARAH: Möchtest du"
	line "keines deiner"

	para "#MON ver-"
	line "schönern lassen?"
	cont "Gut, dann trinken"
	cont "wir eben nur Tee."
	done

DaisyCantGroomEggText:
	text "SARAH: Es tut mir"
	line "Leid, aber ich"
	cont "kann wirklich kein"
	cont "EI verschönern."
	done

BluesHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
