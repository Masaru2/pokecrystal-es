INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUY


SECTION "maps/SeafoamGym", ROMX

SeafoamGym_MapScripts::
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUY
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

SeafoamGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue .TalkedToSeafoamGymGuyScript
	writetext SeafoamGymGuyWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	end

.TalkedToSeafoamGymGuyScript:
	writetext SeafoamGymGuyWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "PYRO: Wuah!"

	para "Meine PKMN-ARENA"
	line "auf der ZINNOBER-"
	cont "INSEL ist abge-"
	cont "brannt. Meine"

	para "Feuer-#MON und"
	line "ich sind wegen des"

	para "Vulkanausbruchs"
	line "obdachlos."

	para "Buah!"

	para "Aber ich führe"
	line "meine Tätigkeit"

	para "als ARENALEITER in"
	line "dieser Höhle"
	cont "weiter aus."

	para "Wenn du mich"
	line "besiegst, bekommst"
	cont "du einen ORDEN."

	para "Es wäre besser,"
	line "du hast"
	cont "FEUERHEILER!"
	done

BlaineWinLossText:
	text "PYRO: Gut gemacht."
	line "Ich bin"
	cont "ausgebrannt…"

	para "Hier nimm den"
	line "VULKANORDEN!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> erhält"
	line "VULKANORDEN."
	done

BlaineAfterBattleText:
	text "PYRO: Diesmal habe"
	line "ich verloren, aber"

	para "beim nächsten Mal"
	line "werde ich"
	cont "gewinnen."

	para "Ich werde meine"
	line "PKMN-ARENA auf der"

	para "ZINNOBERINSEL"
	line "wieder aufbauen"
	cont "und dann wirst du"
	cont "erneut gegen mich"
	cont "antreten."
	done

BlaineFightDoneText:
	text "PYRO: Meine Feuer-"
	line "#MON werden"

	para "noch stärker sein."
	line "Du wirst schon"
	cont "sehen!"
	done

SeafoamGymGuyWinText:
	text "Jawohl!"

	para "…Huh? Es ist"
	line "schon vorüber?"

	para "Sorry, Kumpel!"

	para "Die PKMN-ARENA auf"
	line "der ZINNOBERINSEL"

	para "existiert nicht"
	line "mehr und ich"
	cont "wusste nicht, wo"
	cont "du steckst."

	para "Aber egal! Du"
	line "bist auch ohne"

	para "meinen Ratschlag"
	line "zurechtgekommen."
	cont "Ich wusste, du"
	cont "würdest gewinnen."
	done

SeafoamGymGuyWinText2:
	text "Eine PKMN-ARENA"
	line "kann überall sein,"

	para "solange der ARENA-"
	line "LEITER dort ist."

	para "Man braucht dafür"
	line "kein Gebäude."
	done

SeafoamGym_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  5, ROUTE_20, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuyScript, EVENT_SEAFOAM_GYM_GYM_GUY
