INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_GRANNY1
	const ECRUTEAKGYM_GRANNY2
	const ECRUTEAKGYM_GYM_GUY
	const ECRUTEAKGYM_GRAMPS


SECTION "maps/EcruteakGym", ROMX

EcruteakGym_MapScripts::
	db 2 ; scene scripts
	scene_script .ForcedToLeave ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.ForcedToLeave:
	prioritysjump EcruteakGymClosed
	end

.DummyScene:
	end

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	readvar VAR_BADGES
	scall EcruteakGymActivateRockets
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_FINISHED
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end

EcruteakGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

EcruteakGymClosed:
	applymovement PLAYER, EcruteakGymPlayerStepUpMovement
	applymovement ECRUTEAKGYM_GRAMPS, EcruteakGymGrampsSlowStepDownMovement
	opentext
	writetext EcruteakGymClosedText
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, 6, 27
	end

TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end

EcruteakGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuyText
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript:
	writetext EcruteakGymGuyWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, MORTY, MORTY1
	jumpstd gymstatue2

EcruteakGymPlayerStepUpMovement:
	step UP
	step_end

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

EcruteakGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Gut, dass du ge-"
	line "kommen bist."

	para "Hier in TEAK CITY"
	line "werden #MON"
	cont "verehrt."

	para "Man sagt, dass le-"
	line "gendäre #MON"

	para "nur wahrlich star-"
	line "ken Trainern er-"
	cont "scheinen werden."

	para "Ich glaube an die-"
	line "se Legende. Daher"

	para "habe ich mein gan-"
	line "zes Leben lang im"

	para "Geheimen trai-"
	line "niert."

	para "Als Resultat kann"
	line "ich nun Dinge"

	para "sehen, die andere"
	line "nicht sehen kön-"
	cont "nen."

	para "Noch ein wenig…"

	para "Mit ein wenig Mehr"
	line "könnte ich eine"

	para "Zukunft sehen, in"
	line "der ich das legen-"
	cont "däre regenbogen-"
	cont "farbene #MON"
	cont "treffe."

	para "Du könntest mir"
	line "dabei helfen!"
	done

MortyWinLossText:
	text "Ich bin noch nicht"
	line "gut genug…"

	para "Dieser ORDEN soll"
	line "dir gehören."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> erhält"
	line "PHANTOMORDEN."
	done

MortyText_FogBadgeSpeech:
	text "Durch den PHANTOM-"
	line "ORDEN gehorchen"

	para "dir #MON bis zu"
	line "LV 50."

	para "Außerdem können"
	line "#MON, die SUR-"
	cont "FER beherrschen,"

	para "diesen auch außer-"
	line "halb eines Kampfes"
	cont "einsetzen."

	para "Bitte nimm auch"
	line "dies an."
	done

MortyText_ShadowBallSpeech:
	text "Das ist SPUKBALL."
	line "Er verursacht"

	para "Schaden und ver-"
	line "ringert die SPE-"
	cont "ZIAL-VERT."

	para "Setze ihn ein,"
	line "wenn er dir ge-"
	cont "fällt."
	done

MortyFightDoneText:
	text "Ich verstehe…"

	para "Deine Reise hat"
	line "dich an die ent-"
	cont "legensten Orte ge-"
	cont "führt."

	para "Du hast viel mehr"
	line "gesehen als ich."

	para "Dafür beneide ich"
	line "dich…"
	done

SageJeffreySeenText:
	text "Ich habe den Früh-"
	line "ling mit meinen"

	para "#MON verbracht."
	line "Dann den Sommer,"

	para "den Herbst und den"
	line "Winter…"

	para "Dann kam wieder"
	line "der Frühling. Wir"

	para "haben viel Zeit"
	line "miteinander ver-"
	cont "bracht."
	done

SageJeffreyBeatenText:
	text "Siege und Nieder-"
	line "lagen - ich hatte"
	cont "beides."
	done

SageJeffreyAfterBattleText:
	text "Woher kommen"
	line "#MON?"
	done

SagePingSeenText:
	text "Hältst du unseren"
	line "#MON stand?"
	done

SagePingBeatenText:
	text "Ah! Gut gemacht!"
	done

SagePingAfterBattleText:
	text "Wir setzen nur"
	line "Geist-#MON ein."

	para "Normal-Attacken"
	line "zeigen bei ihnen"
	cont "keine Wirkung!"
	done

MediumMarthaSeenText:
	text "Ich werde siegen!"
	done

MediumMarthaBeatenText:
	text "I-I-Ich habe"
	line "verloren!"
	done

MediumMarthaAfterBattleText:
	text "Wer siegen will,"
	line "wird es auch tun!"
	done

MediumGraceSeenText:
	text "Verwirrt dich un-"
	line "ser unsichtbarer"

	para "Boden? Besiege"
	line "mich und ich gebe"
	cont "dir einen Tipp!"
	done

MediumGraceBeatenText:
	text "W-Was?"
	done

MediumGraceAfterBattleText:
	text "Gut, ich verrate"
	line "dir das Geheimnis"

	para "des unsichtbaren"
	line "Bodens."

	para "Der Weg liegt vor"
	line "unseren Augen!"
	done

EcruteakGymGuyText:
	text "Die Trainer hier"
	line "haben geheime Mo-"
	cont "tive."

	para "Gewinnst du, so"
	line "verraten sie dir"

	para "vielleicht ein"
	line "paar Geheimnisse"
	cont "über TEAK CITY."
	done

EcruteakGymGuyWinText:
	text "Wow, <PLAYER>."
	line "Du warst großar-"
	cont "tig!"

	para "Vor lauter Angst"
	line "habe ich mich in"
	cont "die Ecke gekauert!"
	done

EcruteakGymClosedText:
	text "JENS, der ARENA-"
	line "LEITER ist nicht"
	cont "hier."

	para "Du musst leider"
	line "wieder gehen."

	para "Hohohoho."
	done

EcruteakGym_MapEvents::
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  6,  7, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	db 7 ; object events
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	object_event  3, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumGrace, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1
	object_event  4, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
