INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6


SECTION "maps/WiseTriosRoom", ROMX

WiseTriosRoom_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WiseTrioCallback

.DummyScene0:
	end

.DummyScene1:
	end

.WiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, MovementData_0x98622
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, MovementData_0x98625
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	promptbutton
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, MovementData_0x98628
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_FINISHED
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

MovementData_0x98622:
	step LEFT
	step LEFT
	step_end

MovementData_0x98625:
	step RIGHT
	step DOWN
	step_end

MovementData_0x98628:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:
	text "Erstaunlich…"

	para "SUICUNE, ENTEI und"
	line "RAIKOU sind aus"
	cont "dem Schlaf"
	cont "erwacht…"

	para "Wird die Legende"
	line "wahr?"
	done

WiseTriosRoomSage2Text:
	text "Wir trainieren bei"
	line "der TURMRUINE,"

	para "aber wir haben nie"
	line "von einem Loch ge-"
	cont "hört, das sich"
	cont "dort geöffnet"

	para "haben soll. Jemand"
	line "muss das absicht-"
	cont "lich getan haben."
	done

WiseTriosRoomSage3BlocksExitText:
	text "Zutritt zum ZINN-"
	line "TURM haben jene,"

	para "die den ORDEN der"
	line "PKMN-ARENA von"
	cont "TEAK CITY tragen."

	para "Da SUICUNE, RAIKOU"
	line "und ENTEI jetzt"

	para "aber erwacht sind,"
	line "muss ich dich"

	para "bitten, nicht"
	line "einzutreten!"
	done

WiseTriosRoomSage3Text:
	text "Wir, das TRIO der"
	line "WEISEN, sind die"

	para "Hüter der legen-"
	line "dären #MON."
	done

SageGakuSeenText:
	text "Die Legende be-"
	line "sagt, dass beim"

	para "Erscheinen eines"
	line "Trainers, der die"

	para "Fähigkeit besitzt,"
	line "die Seelen der"

	para "#MON zu be-"
	line "rühren, ein #-"
	cont "MON kommt, das ihn"

	para "beim ZINNTURM auf"
	line "die Probe stellt."

	para "Die Legende ist"
	line "wahr!"

	para "Das legendäre"
	line "#MON SUICUNE"
	cont "ist gekommen!"

	para "Wir, das TRIO der"
	line "WEISEN, werden"

	para "prüfen, ob du"
	line "würdig bist,"
	cont "einzutreten!"
	done

SageGakuBeatenText:
	text "Stärker als wir"
	line "dachten? Wer weiß…"
	done

SageGakuAfterBattleText:
	text "Ah, du behauptest"
	line "also, SUICUNE,"

	para "ENTEI und RAIKOU"
	line "während sie"

	para "schliefen"
	line "gesehen zu haben?"

	para "Unglaublich!"

	para "Der Legende nach"
	line "können sie während"

	para "des Schlafs nicht"
	line "gesehen werden…"
	done

SageMasaSeenText:
	text "Kann man dir die"
	line "Wahrheit"
	cont "anvertrauen?"

	para "Ich muss prüfen,"
	line "ob du würdig bist."
	done

SageMasaBeatenText:
	text "…Ich sage dir"
	line "die Wahrheit…"
	done

SageMasaAfterBattleText:
	text "Es gab früher zwei"
	line "8-stöckige"
	cont "Türme hier."

	para "Den BRONZETURM,"
	line "der die #MON"

	para "erwecken sollte,"
	line "und den ZINNTURM,"

	para "in dem die #MON"
	line "ruhen sollten."

	para "Die Aussicht von"
	line "den beiden Spitzen"

	para "der TÜRME muss"
	line "atemberaubend"
	cont "gewesen sein."

	para "Zu dieser Zeit"
	line "soll sich ein"

	para "gigantisches, sil-"
	line "bernes #MON auf"

	para "der Spitze des"
	line "BRONZETURMs"

	para "niedergelassen"
	line "haben."

	para "Jedoch…"

	para "Vor 150 Jahren"
	line "schlug ein Blitz"

	para "in einen der"
	line "beiden TÜRME ein."

	para "Die Flammen"
	line "wüteten für ganze"
	cont "drei Tage."

	para "Ein plötzlicher"
	line "Platzregen löschte"
	cont "das Feuer."

	para "Und so ist die"
	line "TURMRUINE"
	cont "entstanden."
	done

SageKojiSeenText:
	text "Beweise mir deine"
	line "Kraft!"
	done

SageKojiBeatenText:
	text "Zu stark!"
	line "Warum?"
	done

SageKojiAfterBattleQuestionText:
	text "Du… bist du der"
	line "Trainer, der von"

	para "dem legendären"
	line "#MON erwartet"
	cont "wird?"
	done

SageKojiAfterBattleSpeechText:
	text "Ich verstehe…"

	para "Wir, das TRIO der"
	line "WEISEN, sind ver-"
	cont "antwortlich für"
	cont "den Schutz der"

	para "legendären #-"
	line "MON. Wir gestatten"

	para "nur jenen Zutritt,"
	line "die eine reine"

	para "Seele und wahre"
	line "Kraft besitzen."

	para "Schreite voran und"
	line "betritt den"
	cont "ZINNTURM."

	para "SUICUNE wird dich"
	line "prüfen."
	done

SageKojiAfterBattleFinalText:
	text "Schreite voran!"

	para "SUICUNE wird dich"
	line "prüfen."
	done

WiseTriosRoom_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	db 1 ; coord events
	coord_event  7,  4, SCENE_DEFAULT, WiseTriosRoom_CannotEnterTinTowerScript

	db 0 ; bg events

	db 6 ; object events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
