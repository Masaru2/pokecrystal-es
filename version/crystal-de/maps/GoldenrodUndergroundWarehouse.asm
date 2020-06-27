INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET1
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET2
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET3
	const GOLDENRODUNDERGROUNDWAREHOUSE_GENTLEMAN
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL1
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL2
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL3


SECTION "maps/GoldenrodUndergroundWarehouse", ROMX

GoldenrodUndergroundWarehouse_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ResetSwitches

.ResetSwitches:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	return

TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	writetext DirectorIntroText
	promptbutton
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	promptbutton
.GotCardKey:
	writetext DirectorAfterText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseMaxEther:
	itemball MAX_ETHER

GoldenrodUndergroundWarehouseTMSleepTalk:
	itemball TM_SLEEP_TALK

GoldenrodUndergroundWarehouseUltraBall:
	itemball ULTRA_BALL

GruntM24SeenText:
	text "Wie bist du"
	line "so weit gekommen?"

	para "Ich denke, es gibt"
	line "keine andere"
	cont "Lösung, um dich"
	cont "loszuwerden."
	done

GruntM24BeatenText:
	text "Er wurde mich los…"
	done

GruntM24AfterBattleText:
	text "TEAM ROCKET wird"
	line "weitermachen."
	cont "Sie warten auf die"
	cont "Rückkehr von"
	cont "GIOVANNI."

	para "Wir werden alles"
	line "dafür geben."
	done

GruntM14SeenText:
	text "Weiter kommst"
	line "du nicht!"

	para "Ich habe niemals"
	line "Mitleid mit meinen"
	cont "Gegnern, auch"
	cont "nicht mit Kindern!"
	done

GruntM14BeatenText:
	text "Verdammt!"
	done

GruntM14AfterBattleText:
	text "Ich habe verloren…"

	para "Bitte vergib mir,"
	line "GIOVANNI!"
	done

GruntM15SeenText:
	text "Hiuck-hiuck-hiuck!"
	line "Ich kenne dich!"

	para "Du hast mich in"
	line "unserem Versteck"
	cont "richtig vermöbelt!"
	done

GruntM15BeatenText:
	text "Hiuck-hiuck-hiuck!"
	line "So ist das also?"
	done

GruntM15AfterBattleText:
	text "Hiuck-hiuck-hiuck!"
	line "Das war grandios!"
	cont "Ich werde dich"
	cont "nicht vergessen!"
	done

DirectorIntroText:
	text "INTENDANT: Wie?"
	line "Was? Du willst"
	cont "mich retten?"

	para "Danke!"

	para "Der RADIOTURM!"

	para "Was geschieht"
	line "dort?"

	para "Von TEAM ROCKET"
	line "besetzt?"

	para "Hier, nimm diesen"
	line "TÜRÖFFNER."
	done

DirectorCardKeyText:
	text "INTENDANT: Damit"
	line "kannst du den"
	cont "Rollladen im 2S"
	cont "öffnen."
	done

DirectorAfterText:
	text "Ich flehe dich an,"
	line "uns zu helfen."

	para "Niemand weiß, was"
	line "sie vorhaben, wenn"

	para "sie erst Kontrolle"
	line "über den Trans-"
	cont "mitter erlangen."

	para "Sie könnten sogar"
	line "mit einem Spezial-"
	cont "signal alle #-"
	cont "MON kontrollieren!"

	para "Bitte hilf mir!"
	line "Du bist meine"
	cont "letzte Rettung."

	para "Bitte rette den"
	line "RADIOTURM…"

	para "Und alle #MON"
	line "in diesem Land!"
	done

GoldenrodUndergroundWarehouse_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseMaxEther, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	object_event 13,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseTMSleepTalk, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	object_event  2,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseUltraBall, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL
