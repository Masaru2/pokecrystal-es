INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const TEAMROCKETBASEB3F_LANCE
	const TEAMROCKETBASEB3F_ROCKET1
	const TEAMROCKETBASEB3F_MOLTRES
	const TEAMROCKETBASEB3F_ROCKET_GIRL
	const TEAMROCKETBASEB3F_ROCKET2
	const TEAMROCKETBASEB3F_SCIENTIST1
	const TEAMROCKETBASEB3F_SCIENTIST2
	const TEAMROCKETBASEB3F_ROCKET3
	const TEAMROCKETBASEB3F_SILVER
	const TEAMROCKETBASEB3F_POKE_BALL1
	const TEAMROCKETBASEB3F_POKE_BALL2
	const TEAMROCKETBASEB3F_POKE_BALL3
	const TEAMROCKETBASEB3F_POKE_BALL4
	const TEAMROCKETBASEB3F_POKE_BALL5


SECTION "maps/TeamRocketBaseB3F", ROMX

TeamRocketBaseB3F_MapScripts::
	db 4 ; scene scripts
	scene_script .LanceGetsPassword ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB3F_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CheckGiovanniDoor

.LanceGetsPassword:
	prioritysjump LanceGetPasswordScript
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.CheckGiovanniDoor:
	checkevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	iftrue .OpenSesame
	return

.OpenSesame:
	changeblock 10, 8, $07 ; floor
	return

LanceGetPasswordScript:
	turnobject PLAYER, LEFT
	pause 5
	turnobject TEAMROCKETBASEB3F_MOLTRES, RIGHT
	pause 20
	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12a
	opentext
	writetext LanceGetPasswordText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_LANCE, MovementData_0x6e12c
	disappear TEAMROCKETBASEB3F_LANCE
	setscene SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER
	end

RocketBaseRival:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	appear TEAMROCKETBASEB3F_SILVER
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalEnterMovement
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext RocketBaseRivalText
	waitbutton
	closetext
	playsound SFX_TACKLE
	applymovement PLAYER, RocketBaseRivalShovesPlayerMovement
	applymovement TEAMROCKETBASEB3F_SILVER, RocketBaseRivalLeaveMovement
	disappear TEAMROCKETBASEB3F_SILVER
	setscene SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS
	special RestartMapMusic
	end

TeamRocketBaseB3FRocketScript:
	jumptextfaceplayer TeamRocketBaseB3FRocketText

RocketBaseBossLeft:
	applymovement PLAYER, MovementData_0x6e133
	sjump RocketBaseBoss

RocketBaseBossRight:
	applymovement PLAYER, MovementData_0x6e13a
RocketBaseBoss:
	pause 30
	showemote EMOTE_SHOCK, TEAMROCKETBASEB3F_ROCKET1, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TEAMROCKETBASEB3F_ROCKET1, DOWN
	opentext
	writetext ExecutiveM4BeforeText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e142
	winlosstext ExecutiveM4BeatenText, 0
	setlasttalked TEAMROCKETBASEB3F_ROCKET1
	loadtrainer EXECUTIVEM, EXECUTIVEM_4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_4
	opentext
	writetext ExecutiveM4AfterText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e144
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB3F_ROCKET1, MovementData_0x6e147
	disappear TEAMROCKETBASEB3F_ROCKET1
	setscene SCENE_TEAMROCKETBASEB3F_NOTHING
	end

RocketBaseMurkrow:
	opentext
	writetext RocketBaseMurkrowText
	waitbutton
	closetext
	setevent EVENT_LEARNED_HAIL_GIOVANNI
	end

SlowpokeTailGrunt:
	trainer GRUNTF, GRUNTF_5, EVENT_BEAT_ROCKET_GRUNTF_5, GruntF5SeenText, GruntF5BeatenText, 0, GruntF5Script

GruntF5Script:
	endifjustbattled
	opentext
	writetext GruntF5AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_SLOWPOKETAIL
	end

RaticateTailGrunt:
	trainer GRUNTM, GRUNTM_28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, GruntM28Script

GruntM28Script:
	endifjustbattled
	opentext
	writetext GruntM28AfterBattleText
	waitbutton
	closetext
	setevent EVENT_LEARNED_RATICATE_TAIL
	end

TrainerScientistRoss:
	trainer SCIENTIST, ROSS, EVENT_BEAT_SCIENTIST_ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRossAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer SCIENTIST, MITCH, EVENT_BEAT_SCIENTIST_MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMitchAfterBattleText
	waitbutton
	closetext
	end

TeamRocketBaseB3FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_SLOWPOKETAIL
	iffalse .NeedsPassword
	checkevent EVENT_LEARNED_RATICATE_TAIL
	iffalse .NeedsPassword
	sjump .OpenSesame

.NeedsPassword:
	writetext TeamRocketBaseB3FLockedDoorNeedsPasswordText
	waitbutton
	closetext
	end

.OpenSesame:
	writetext TeamRocketBaseB3FLockedDoorOpenSesameText
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 10, 8, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_GIOVANNIS_OFFICE
	waitsfx
	end

TeamRocketBaseB3FOathScript:
	jumpstd teamrocketoath

TeamRocketBaseB3FProtein:
	itemball PROTEIN

TeamRocketBaseB3FXSpecial:
	itemball X_SPECIAL

TeamRocketBaseB3FFullHeal:
	itemball FULL_HEAL

TeamRocketBaseB3FIceHeal:
	itemball ICE_HEAL

TeamRocketBaseB3FUltraBall:
	itemball ULTRA_BALL

MovementData_0x6e12a:
	step RIGHT
	step_end

MovementData_0x6e12c:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6e133:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6e13a:
	step UP
	step UP
	step LEFT
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6e142:
	step DOWN
	step_end

MovementData_0x6e144:
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x6e147:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	slow_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

RocketBaseRivalEnterMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RocketBaseRivalLeaveMovement:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RocketBaseRivalShovesPlayerMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

LanceGetPasswordText:
	text "SIEGFRIED: Man"
	line "benötigt zwei"

	para "Passwörter, um Zu-"
	line "tritt zum Quartier"
	cont "des Bosses zu"
	cont "bekommen."

	para "Nur ein paar Mit-"
	line "glieder von TEAM"
	cont "ROCKET kennen sie."

	para "Diese Auskunft hat"
	line "mir dieser"
	cont "ROCKET gegeben."

	para "<PLAY_G>, los!"
	line "Holen wir uns"
	cont "die Passwörter."
	done

TeamRocketBaseB3FRocketText:
	text "Urrggh… Der Typ"
	line "mit dem Umhang ist"
	cont "furchtbar stark…"
	done

RocketBaseRivalText:
	text "…"

	para "Habe ich dir nicht"
	line "gesagt, dass ich"

	para "TEAM ROCKET"
	line "zerschlage?"

	para "…Sag mir, wer war"
	line "der Typ mit dem"

	para "Umhang, der die"
	line "Drachen-#MON"
	cont "einsetzte?"

	para "Meine #MON"
	line "waren keine Gegner"
	cont "für ihn."

	para "Die Niederlage"
	line "macht mir nichts"

	para "aus. Mit stärkeren"
	line "#MON kann ich"
	cont "ihn besiegen."

	para "Was mich wurmt"
	line "ist, was er zu"
	cont "mir gesagt hat…"

	para "Er sagte, dass ich"
	line "meine #MON"

	para "nicht ausreichend"
	line "liebe und ihnen"
	cont "nicht vertraue."

	para "Ich bin wütend,"
	line "dass ich gegen so"
	cont "ein Großmaul"
	cont "verloren habe."

	para "…Humpf! Für Typen"
	line "wie dich habe"
	cont "ich keine Zeit!"
	done

ExecutiveM4BeforeText:
	text "Was? Wer bist du?"
	line "Dies ist das Büro"

	para "unseres Anführers"
	line "GIOVANNI."

	para "Er trainiert, seit"
	line "das TEAM ROCKET"

	para "vor drei Jahren"
	line "zerschlagen wurde."

	para "Wir sind sicher,"
	line "dass er eines"

	para "Tages zurückkehren"
	line "wird, um das"
	cont "Kommando wieder"
	cont "zu übernehmen."

	para "Darum halten wir"
	line "Wache."

	para "Ich lasse nicht"
	line "zu, dass es"
	cont "hier laut wird!"
	done

ExecutiveM4BeatenText:
	text "Ich… ich konnte"
	line "nichts machen…"

	para "Bitte vergib"
	line "mir, GIOVANNI…"
	done

ExecutiveM4AfterText:
	text "Das darf mich"
	line "nicht belasten."

	para "Ich muss es den"
	line "anderen sagen…"
	done

RocketBaseMurkrowText:
	text "KRAMURX: Das"
	line "Passwort lautet…"

	para "PREISET GIOVANNI."
	done

GruntF5SeenText:
	text "Ob ich das"
	line "Passwort weiß?"

	para "Vielleicht."

	para "Schwächlinge"
	line "werden es nie"
	cont "erfahren!"
	done

GruntF5BeatenText:
	text "O.K. Genug."
	line "Ich verrate es"
	cont "dir."
	done

GruntF5AfterBattleText:
	text "Das Passwort zum"
	line "Büro vom Boss"
	cont "lautet"

	para "FLEGMONRUTE."

	para "Es ist aber"
	line "nutzlos, denn du"
	cont "benötigst zwei"
	cont "Passwörter."
	done

GruntM28SeenText:
	text "Hiuck-hiuck-hiuck!"

	para "Du forderst mich"
	line "zu einem Kampf"

	para "heraus? Pah! Du"
	line "bist dumm, aber du"
	cont "hast Mumm!"

	para "Das mag ich!"

	para "Falls du mich"
	line "besiegst, verrate"

	para "ich dir ein"
	line "Passwort für das"
	cont "Büro vom Boss!"
	done

GruntM28BeatenText:
	text "Hiuck-hiuck-hiuck!"
	line "Du bist gut!"
	done

GruntM28AfterBattleText:
	text "Hiuck-hiuck-hiuck!"

	para "Das Passwort für"
	line "das Büro vom Boss…"

	para "Uh… ich glaube,"
	line "es lautet"
	cont "RATTIKARLRUTE."
	done

ScientistRossSeenText:
	text "Früher arbeitete"
	line "ich für SILPH,"

	para "aber jetzt leite"
	line "ich TEAM ROCKETs"
	cont "Forschungen."

	para "Ein Kind wie du,"
	line "das sich überall"
	cont "einmischt, muss"
	cont "bestraft werden."
	done

ScientistRossBeatenText:
	text "Nur wegen eines"
	line "kleinen taktischen"
	cont "Fehlers…"
	done

ScientistRossAfterBattleText:
	text "Ein Radiosignal,"
	line "das #MON um den"
	cont "Verstand bringt…"

	para "Mein Experiment"
	line "war ein voller"
	cont "Erfolg."

	para "Meine Beförderung"
	line "ist gewiss. Dieser"

	para "Verlust bedeutet"
	line "nichts."
	done

ScientistMitchSeenText:
	text "Es ist mir egal,"
	line "dass #MON bei"
	cont "unserem Experiment"
	cont "Schmerzen"
	cont "zugefügt werden."
	done

ScientistMitchBeatenText:
	text "Meine Stärke ist"
	line "das Denken, nicht"
	cont "das Kämpfen."
	done

ScientistMitchAfterBattleText:
	text "Wenn wir das"
	line "Radiosignal ver-"
	cont "stärken, könnte"

	para "man es im ganzen"
	line "Land empfangen…"

	para "Allein der Gedanke"
	line "entzückt mich!"
	done

TeamRocketBaseB3FLockedDoorNeedsPasswordText:
	text "Die Tür ist"
	line "verschlossen…"

	para "Zum Öffnen werden"
	line "zwei Passwörter"
	cont "benötigt."
	done

TeamRocketBaseB3FLockedDoorOpenSesameText:
	text "Die Tür ist"
	line "verschlossen…"

	para "<PLAYER> gibt beide"
	line "Passwörter ein."

	para "Die Tür wird"
	line "entriegelt!"
	done

TeamRocketBaseB3F_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  2, TEAM_ROCKET_BASE_B2F, 2
	warp_event 27,  2, TEAM_ROCKET_BASE_B2F, 3
	warp_event  3,  6, TEAM_ROCKET_BASE_B2F, 4
	warp_event 27, 14, TEAM_ROCKET_BASE_B2F, 5

	db 3 ; coord events
	coord_event 10,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossLeft
	coord_event 11,  8, SCENE_TEAMROCKETBASEB3F_ROCKET_BOSS, RocketBaseBossRight
	coord_event  8, 10, SCENE_TEAMROCKETBASEB3F_RIVAL_ENCOUNTER, RocketBaseRival

	db 10 ; bg events
	bg_event 10,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 11,  9, BGEVENT_IFNOTSET, TeamRocketBaseB3FLockedDoor
	bg_event 10,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 11,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 12,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event 13,  1, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  4, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  5, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  6, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript
	bg_event  7, 13, BGEVENT_READ, TeamRocketBaseB3FOathScript

	db 14 ; object events
	object_event 25, 14, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LanceGetPasswordScript, EVENT_TEAM_ROCKET_BASE_B3F_LANCE_PASSWORDS
	object_event  8,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B3F_EXECUTIVE
	object_event  7,  2, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RocketBaseMurkrow, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, SlowpokeTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  5, 14, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, RaticateTailGrunt, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 23, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerScientistRoss, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerScientistMitch, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 24, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeamRocketBaseB3FRocketScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_TEAM_ROCKET_BASE
	object_event  1, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FProtein, EVENT_TEAM_ROCKET_BASE_B3F_PROTEIN
	object_event  3, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FXSpecial, EVENT_TEAM_ROCKET_BASE_B3F_X_SPECIAL
	object_event 28,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FFullHeal, EVENT_TEAM_ROCKET_BASE_B3F_FULL_HEAL
	object_event 17,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FIceHeal, EVENT_TEAM_ROCKET_BASE_B3F_ICE_HEAL
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB3FUltraBall, EVENT_TEAM_ROCKET_BASE_B3F_ULTRA_BALL
