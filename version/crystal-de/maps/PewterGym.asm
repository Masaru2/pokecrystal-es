INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUY


SECTION "maps/PewterGym", ROMX

PewterGym_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	waitbutton
	closetext
	end

.PewterGymGuyWinScript:
	writetext PewterGymGuyWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd gymstatue2

BrockIntroText:
	text "ROCKO: Wow, es"
	line "kommt nicht oft"

	para "vor, dass wir von"
	line "einem Heraus-"
	cont "forderer aus JOHTO"
	cont "besucht werden."

	para "Ich bin ROCKO, der"
	line "ARENALEITER von"

	para "MARMORIA. Ich habe"
	line "mich auf Gestein-"
	cont "#MON"
	cont "spezialisiert."

	para "Meine #MON sind"
	line "gegen die meisten"

	para "physischen Atta-"
	line "cken immun. Es"
	cont "wird dir schwer"

	para "fallen, ihnen"
	line "Schaden zuzufügen."
	cont "Na los!"
	done

BrockWinLossText:
	text "ROCKO: Die mäch-"
	line "tigen Attacken"
	cont "deiner #MON"
	cont "haben meine"
	cont "felsenfeste"
	cont "Verteidigung"
	cont "überwunden…"

	para "Du bist stärker,"
	line "als ich dachte…"

	para "Komm - Nimm dir"
	line "diesen ORDEN."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> erhält"
	line "FELSORDEN."
	done

BrockBoulderBadgeText:
	text "ROCKO: Danke,"
	line "<PLAY_G>. Es war"

	para "eine Freude, gegen"
	line "dich zu kämpfen."

	para "Auch wenn ich ein"
	line "bisschen beleidigt"
	cont "bin."

	para "Dieser FELSORDEN"
	line "wird deine #-"
	cont "MON noch stärker"
	cont "machen."
	done

BrockFightDoneText:
	text "ROCKO: Die Welt"
	line "ist groß. Es gibt"

	para "immer noch viele"
	line "starke Trainer wie"
	cont "dich."

	para "Warte nur ab. Ich"
	line "werde auch noch"
	cont "viel stärker."
	done

CamperJerrySeenText:
	text "Die Trainer dieser"
	line "PKMN-ARENA setzen"
	cont "Gestein-#MON"
	cont "ein."

	para "Gestein-#MON"
	line "haben hohe"
	cont "VERT-Werte."

	para "Die Kämpfe können"
	line "sehr lange"

	para "dauern. Bist du"
	line "bereit dafür?"
	done

CamperJerryBeatenText:
	text "Ich muss diese"
	line "Kämpfe gewinnen…"
	done

CamperJerryAfterBattleText:
	text "He, du da! Trainer"
	line "aus JOHTO! ROCKO"

	para "ist stark. Es wird"
	line "dir übel bekommen,"

	para "wenn du ihn nicht"
	line "ernst nimmst."
	done

PewterGymGuyText:
	text "He! Ein CHAMP"
	line "in spe!"

	para "Das ist cool!"
	line "Kämpfst du gegen"

	para "die ARENALEITER in"
	line "KANTO?"

	para "Sie sind stark und"
	line "ambitioniert, wie"

	para "die ARENALEITER in"
	line "JOHTO."
	done

PewterGymGuyWinText:
	text "He! Ein CHAMP"
	line "in spe!"

	para "Diese PKMN-ARENA"
	line "stellte kein"

	para "Problem für dich"
	line "dar."

	para "Dein Einsatz"
	line "ist wirklich"

	para "beeindruckend. Das"
	line "meine ich ehrlich."
	done

PewterGym_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	db 3 ; object events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1
