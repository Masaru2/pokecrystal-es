INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const KARENSROOM_KAREN


SECTION "maps/KarensRoom", ROMX

KarensRoom_MapScripts::
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .KarensRoomDoors

.LockDoor:
	prioritysjump .KarensDoorLocksBehindYou
	end

.DummyScene:
	end

.KarensRoomDoors:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.KarensDoorLocksBehindYou:
	applymovement PLAYER, KarensRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarenScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue KarenScript_AfterBattle
	writetext KarenScript_KarenBeforeText
	waitbutton
	closetext
	winlosstext KarenScript_KarenBeatenText, 0
	loadtrainer KAREN, KAREN1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opentext
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

KarenScript_AfterBattle:
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	end

KarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenScript_KarenBeforeText:
	text "Ich bin MELANIE."
	line "Nummer 4 der"
	cont "TOP VIER."

	para "Du heißt <PLAYER>?"
	line "Sehr amüsant."

	para "Ich liebe #MON"
	line "des Typs Unlicht."

	para "Ihr wilder, harter"
	line "Ruf gefällt mir."

	para "Und sie sind"
	line "wirklich stark."

	para "Glaubst du, du"
	line "kannst es mit uns"
	cont "aufnehmen? Los,"
	cont "ich will mich"
	cont "amüsieren."

	para "Auf geht's."
	done

KarenScript_KarenBeatenText:
	text "Nun, du bist"
	line "gut. Das gefällt"
	cont "mir an einem"
	cont "Trainer."
	done

KarenScript_KarenDefeatText:
	text "Starke #MON."

	para "Schwache #MON."

	para "Das ist nur eine"
	line "subjektive Ein-"
	cont "schätzung anderer"
	cont "Menschen."

	para "Wirklich begabte"
	line "Trainer gewinnen"

	para "mit ihren Lieb-"
	line "lings-#MON."

	para "Ich mag deinen"
	line "Stil. Du weißt,"
	cont "was wichtig ist."

	para "Schreite voran!"
	line "Der CHAMP"
	cont "wartet."
	done

KarensRoom_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenScript_Battle, -1
