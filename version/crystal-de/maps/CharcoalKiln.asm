INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CHARCOALKILN_BLACK_BELT
	const CHARCOALKILN_YOUNGSTER
	const CHARCOALKILN_MOLTRES


SECTION "maps/CharcoalKiln", ROMX

CharcoalKiln_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CharcoalKilnBoss:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SavedSlowpoke
	writetext CharcoalKilnBossText1
	waitbutton
	closetext
	end

.SavedSlowpoke:
	writetext CharcoalKilnBossText2
	waitbutton
	closetext
	end

.GotCut:
	writetext CharcoalKilnBossText3
	waitbutton
	closetext
	end

CharcoalKilnApprentice:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue .YoureTheCoolest
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Thanks
	writetext CharcoalKilnApprenticeText1
	waitbutton
	closetext
	end

.Thanks:
	writetext CharcoalKilnApprenticeText2
	promptbutton
	verbosegiveitem CHARCOAL
	iffalse .Done
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	closetext
	end

.YoureTheCoolest:
	writetext CharcoalKilnApprenticeText3
	waitbutton
.Done:
	closetext
	end

CharcoalKilnFarfetchd:
	faceplayer
	opentext
	writetext FarfetchdText
	cry FARFETCH_D
	waitbutton
	closetext
	end

CharcoalKilnBookshelf:
	jumpstd magazinebookshelf

CharcoalKilnRadio:
	jumpstd radio2

CharcoalKilnBossText1:
	text "Alle FLEGMON sind"
	line "aus der Stadt ver-"
	cont "schwunden."

	para "Vielleicht ist der"
	line "Patron des Waldes"
	cont "zornig auf uns…"

	para "Es kann ein böses"
	line "Omen sein. Besser,"
	cont "wir bleiben zu"
	cont "Hause."
	done

CharcoalKilnBossText2:
	text "Die FLEGMON sind"
	line "zurückgekehrt…"

	para "Aber mein LEHRLING"
	line "kam noch nicht aus"
	cont "dem STEINEICHEN-"
	cont "WALD zurück."

	para "Wo in aller Welt"
	line "steckt der faule"
	cont "Kerl?"
	done

CharcoalKilnBossText3:
	text "Du hast TEAM"
	line "ROCKET vertrieben"

	para "und bist allein in"
	line "den STEINEICHEN-"
	cont "WALD gegangen?"

	para "Du hast ja Mut!"
	line "Das mag ich! Komm,"
	cont "trainiere mit uns."
	done

CharcoalKilnApprenticeText1:
	text "Wo sind nur all"
	line "die FLEGMON hin?"

	para "Sind sie irgendwo"
	line "zum Spielen hinge-"
	cont "gangen?"
	done

CharcoalKilnApprenticeText2:
	text "Es tut mir Leid."
	line "Ich habe dir noch"
	cont "nicht gedankt."

	para "Das ist HOLZKOHLE,"
	line "die ich selbst ge-"
	cont "macht habe."

	para "Feuer-#MON"
	line "wären froh, so et-"
	cont "was halten zu"
	cont "dürfen."
	done

CharcoalKilnApprenticeText3:
	text "Die FLEGMON sind"
	line "wieder da, und du"
	cont "hast auch PORENTA"
	cont "gefunden."

	para "Du bist der"
	line "Coolste!"
	done

FarfetchdText:
	text "PORENTA: Kwaa!"
	done

CharcoalKiln_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AZALEA_TOWN, 2
	warp_event  3,  7, AZALEA_TOWN, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  1,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  7,  1, BGEVENT_READ, CharcoalKilnRadio

	db 3 ; object events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  5,  6, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchd, EVENT_CHARCOAL_KILN_FARFETCH_D
