INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const KOGASROOM_KOGA


SECTION "maps/KogasRoom", ROMX

KogasRoom_MapScripts::
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .KogasRoomDoors

.LockDoor:
	prioritysjump .KogasDoorLocksBehindYou
	end

.DummyScene:
	end

.KogasRoomDoors:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.KogasDoorLocksBehindYou:
	applymovement PLAYER, KogasRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue KogaScript_AfterBattle
	writetext KogaScript_KogaBeforeText
	waitbutton
	closetext
	winlosstext KogaScript_KogaBeatenText, 0
	loadtrainer KOGA, KOGA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

KogaScript_AfterBattle:
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	end

KogasRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KogaScript_KogaBeforeText:
	text "Fwahahahaha!"

	para "Ich bin KOGA."
	line "Einer der TOP"

	para "VIER. Da ich ein"
	line "Ninja bin, lebe"
	cont "ich in der Dunkel-"
	cont "heit."

	para "Mein komplizierter"
	line "Stil wird dich"
	cont "verwirren und"
	cont "vernichten!"

	para "Verwirrung,"
	line "Schlaf, Gift…"

	para "Auch du wirst ein"
	line "Opfer meiner"
	cont "hinterhältigen"
	cont "Strategie!"

	para "Fwahahahaha!"

	para "Bei #MON geht"
	line "es nicht nur um"

	para "Kraft allein - das"
	line "wirst du noch"
	cont "herausfinden!"
	done

KogaScript_KogaBeatenText:
	text "Ah!"
	line "Du hast dich als"
	cont "würdig erwiesen!"
	done

KogaScript_KogaDefeatText:
	text "Ich habe alle"
	line "meine Register"
	cont "gezogen."

	para "Alles war umsonst."
	line "Ich muss meine"
	cont "Fertigkeiten"
	cont "verbessern."

	para "Betritt den"
	line "nächsten Raum und"
	cont "stelle dein Können"
	cont "unter Beweis!"
	done

KogasRoom_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, WILLS_ROOM, 2
	warp_event  5, 17, WILLS_ROOM, 3
	warp_event  4,  2, BRUNOS_ROOM, 1
	warp_event  5,  2, BRUNOS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KogaScript_Battle, -1
