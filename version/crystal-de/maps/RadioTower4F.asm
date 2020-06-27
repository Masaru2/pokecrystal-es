INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST


SECTION "maps/RadioTower4F", ROMX

RadioTower4F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .GotPinkBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

.GotPinkBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EXECUTIVEM, EXECUTIVEM_2, EVENT_BEAT_ROCKET_EXECUTIVEM_2, Executivem2SeenText, Executivem2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivem2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FFisherText:
	text "Als ich bei"
	line "den RUINEN war,"
	cont "hörte ich Radio."

	para "Ich empfing eine"
	line "seltsame Sendung."
	done

RadioTower4FDJMaryText:
	text "MARGIT: Warum?"
	line "Warum muss ich"
	cont "das über mich"
	cont "ergehen lassen?"

	para "MAUZI, hilf mir!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "MARGIT: Oh! Du"
	line "hast mich geret-"
	cont "tet! Nimm dies als"

	para "Zeichen meines"
	line "Dankes!"
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "MARGIT: Für #-"
	line "MON mit Normal-"
	cont "attacken ist das"

	para "genau das"
	line "Richtige."
	done

RadioTower4FDJMaryText_After:
	text "MARGIT: Wir hören"
	line "uns in PROF."

	para "EICHs #MON-"
	line "TALKSHOW wieder."
	done

RadioTowerMeowthText:
	text "MAUZI: Mauzi…"
	done

GruntM10SeenText:
	text "Du hast vor, den"
	line "INTENDANTEN zu"
	cont "retten?"

	para "Dies wird nicht"
	line "möglich sein, da"
	cont "ich dich besiege!"
	done

GruntM10BeatenText:
	text "Nein! Unglaublich!"
	done

GruntM10AfterBattleText:
	text "Ich kann es nicht"
	line "glauben, ich"
	cont "wurde besiegt!"
	done

Executivem2SeenText:
	text "Stopp! Ich bin als"
	line "TEAM ROCKET-"
	cont "Festung bekannt!"

	para "Keinen Schritt"
	line "weiter!"
	done

Executivem2BeatenText:
	text "Die Festung wurde"
	line "gestürmt!"
	done

Executivem2AfterBattleText:
	text "Du hast dir meinen"
	line "Respekt verdient."
	cont "Hier ist ein Tipp"
	cont "für dich."

	para "Es ist noch nicht"
	line "zu spät. Noch"
	cont "kannst du"
	cont "umkehren."
	done

GruntF4SeenText:
	text "Sind #MON"
	line "nicht wirklich"
	cont "niedlich?"

	para "Ich denke, meine"
	line "#MON sind"

	para "niedlich - nachdem"
	line "sie deine besiegt"
	cont "haben!"
	done

GruntF4BeatenText:
	text "Oh, nein! Sie sind"
	line "absolut unnütz!"
	done

GruntF4AfterBattleText:
	text "Ich liebe mein"
	line "hübsches Äußeres!"

	para "Wer schert sich"
	line "um #MON?"
	done

ScientistRichSeenText:
	text "Exzellent."

	para "Mit dem RADIOTURM"
	line "können wir"
	cont "unser Vorhaben in"
	cont "die Tat umsetzen."
	done

ScientistRichBeatenText:
	text "Hmmm…"

	para "Jeder große Plan"
	line "hat einen Haken."
	done

ScientistRichAfterBattleText:
	text "Glaubst du allen"
	line "Ernstes, TEAM"
	cont "ROCKET aufhalten"
	cont "zu können?"
	done

RadioTower4FProductionSignText:
	text "3S PRODUKTION"
	done

RadioTower4FStudio2SignText:
	text "3S STUDIO 2"
	done

RadioTower4F_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	db 7 ; object events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
