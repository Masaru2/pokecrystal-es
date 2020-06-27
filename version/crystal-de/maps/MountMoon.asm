INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const MOUNTMOON_SILVER


SECTION "maps/MountMoon", ROMX

MountMoon_MapScripts::
	db 2 ; scene scripts
	scene_script .RivalEncounter ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.RivalEncounter:
	prioritysjump .RivalBattle
	end

.DummyScene:
	end

.RivalBattle:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonSilverTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonSilverTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementAfter
	disappear MOUNTMOON_SILVER
	setscene SCENE_FINISHED
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoonSilverMovementBefore:
	step LEFT
	step LEFT
	step LEFT
	step_end

MountMoonSilverMovementAfter:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoonSilverTextBefore:
	text "<……> <……> <……>"

	para "Es ist schon lange"
	line "her, <PLAYER>."

	para "…Seit ich gegen"
	line "dich verlor, mache"

	para "ich mir Gedanken,"
	line "was meinen #MON"
	cont "noch fehlt…"

	para "Nun, wir haben"
	line "eine Antwort"
	cont "gefunden."

	para "<PLAYER>, wir"
	line "beweisen es dir!"
	done

MountMoonSilverTextWin:
	text "<……> <……> <……>"

	para "Ich glaubte immer,"
	line "meine #MON so"

	para "aufgezogen zu ha-"
	line "ben, dass sie un-"
	cont "schlagbar seien.…"

	para "…Aber ich"
	line "habe versagt…"
	done

MountMoonSilverTextAfter:
	text "<……> <……> <……>"

	para "…Du hast mich"
	line "fair besiegt."

	para "Das muss ich dir"
	line "lassen. Wir werden"
	cont "uns wiedersehen."

	para "Ich werde der"
	line "beste #MON-"
	cont "Trainer aller"
	cont "Zeiten sein."

	para "Und sie werden"
	line "mir dabei helfen."

	para "…Hör mal, <PLAYER>."

	para "Eines Tages werde"
	line "ich es dir bewei-"

	para "sen. Dann besiege"
	line "ich dich."
	done

MountMoonSilverTextLoss:
	text "<……> <……> <……>"

	para "Ich habe meine"
	line "Schuld bei dir"
	cont "abgegolten."

	para "Mit meinen #MON"
	line "werde ich den"

	para "CHAMP besiegen"
	line "und weltbester"
	cont "Trainer werden."
	done

MountMoon_MapEvents::
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  3,  3, ROUTE_3, 1
	warp_event 15, 15, ROUTE_4, 1
	warp_event 13,  3, MOUNT_MOON, 7
	warp_event 15, 11, MOUNT_MOON, 8
	warp_event 25,  5, MOUNT_MOON_SQUARE, 1
	warp_event 25, 15, MOUNT_MOON_SQUARE, 2
	warp_event 25,  3, MOUNT_MOON, 3
	warp_event 25, 13, MOUNT_MOON, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
