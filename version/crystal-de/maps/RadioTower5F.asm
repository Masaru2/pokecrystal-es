INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL


SECTION "maps/RadioTower5F", ROMX

RadioTower5F_MapScripts::
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_RADIOTOWER5F_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScene:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOTHING
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_DEFAULT
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd magazinebookshelf

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "D-Du! Bist du"
	line "gekommen, um mich"
	cont "zu retten?"
	done

FakeDirectorTextBefore2:
	text "Ist es das, was du"
	line "erwartet hast?"

	para "Falsch! Ich bin"
	line "ein Betrüger!"

	para "Ich gebe vor, der"
	line "Echte zu sein, um"

	para "unsere Übernahme"
	line "vorzubereiten."

	para "Möchtest du wis-"
	line "sen, wo wir den"
	cont "echten INTENDANTEN"
	cont "versteckt haben?"

	para "Ich werde es dir"
	line "verraten, wenn"
	cont "du mich besiegst!"
	done

FakeDirectorWinText:
	text "O.K. Ich sage"
	line "dir, wo er ist."
	done

FakeDirectorTextAfter:
	text "Wir haben den"
	line "echten INTENDANTEN"

	para "in das UNTERGRUND-"
	line "LAGERHAUS"
	cont "verschleppt."

	para "Es ist am Ende"
	line "des UNTERGRUNDs."

	para "Ich bezweifle"
	line "aber, dass du"
	cont "so weit kommst."
	done

Executivef1SeenText:
	text "Kennst du mich"
	line "noch aus dem"
	cont "VERSTECK in"
	cont "MAHAGONIA CITY?"

	para "Damals habe ich"
	line "verloren, aber das"

	para "wird heute nicht"
	line "passieren."
	done

Executivef1BeatenText:
	text "Das darf nicht"
	line "wahr sein!"

	para "Ich habe mich so"
	line "angestrengt und"
	cont "dennoch verloren…"
	done

Executivef1AfterBattleText:
	text "<PLAYER>, oder?"

	para "Ein Balg wie du"
	line "weiß die Größe"

	para "von TEAM ROCKET"
	line "nicht zu würdigen."

	para "Das ist schade."
	line "Ich bewundere"
	cont "deine Stärke."
	done

RadioTower5FRocketBossBeforeText:
	text "Oh? Du bist"
	line "so weit gekommen?"

	para "Du musst ein aus-"
	line "gezeichneter Trai-"
	cont "ner sein."

	para "Wir planen, die"
	line "RADIOSTATION zu"

	para "annektieren und"
	line "unsere Rückkehr"
	cont "bekanntzugeben."

	para "Das sollte unseren"
	line "Anführer GIOVANNI"

	para "überzeugen, sein"
	line "Solo-Training"
	cont "abzubrechen und"
	cont "zurückzukehren."

	para "Wir werden unseren"
	line "früheren Ruhm"
	cont "wiedererlangen."

	para "Ich werde nicht"
	line "zulassen, dass du"
	cont "unsere Pläne"
	cont "durchkreuzt."
	done

RadioTower5FRocketBossWinText:
	text "Nein! Vergib mir,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "Wie kann das sein?"

	para "Unsere Träume wur-"
	line "den zerschlagen."

	para "Ich konnte meine"
	line "Aufgabe nicht"
	cont "erfüllen."

	para "Wie GIOVANNI"
	line "werde ich TEAM"

	para "ROCKET hier und"
	line "heute auflösen."

	para "Leb wohl."
	done

RadioTower5FDirectorThankYouText:
	text "INTENDANT:"
	line "<PLAY_G>!"
	cont "Vielen Dank!"

	para "Dein couragiertes"
	line "Handeln hat die"

	para "#MON im ganzen"
	line "Land gerettet."

	para "Ich weiß, es ist"
	line "nicht viel, aber"
	cont "nimm dies bitte."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Früher gab es hier"
	line "einen Turm in"
	cont "DUKATIA CITY."

	para "Aber er war alt"
	line "und baufällig."

	para "Also haben wir ihn"
	line "durch unseren"
	cont "RADIOTURM ersetzt."

	para "Beim Bau haben wir"
	line "diese Glocke"
	cont "gefunden."

	para "Ich hörte, dass"
	line "früher viele ver-"
	cont "schiedene #MON"

	para "in DUKATIA CITY"
	line "lebten."

	para "Vielleicht…"

	para "…hat diese Glocke"
	line "etwas mit dem"

	para "ZINNTURM in TEAK"
	line "CITY zu tun…"

	para "Ah!"

	para "Das erinnert mich…"

	para "Ich habe TEAM"
	line "ROCKET zufällig"
	cont "flüstern hören."

	para "Es scheint, als"
	line "führten sie etwas"
	cont "am ZINNTURM im"
	cont "Schilde."

	para "Ich habe keine"
	line "Ahnung, was vor"

	para "sich geht. Viel-"
	line "leicht solltest du"
	cont "es überprüfen."

	para "O.K., ich gehe in"
	line "mein BÜRO zurück."
	done

RadioTower5FDirectorText:
	text "INTENDANT: Hallo,"
	line "<PLAY_G>!"

	para "Du weißt, ich"
	line "liebe #MON."

	para "Ich errichtete"
	line "diesen RADIOTURM,"

	para "um meiner Liebe zu"
	line "#MON Ausdruck"
	cont "zu verleihen."

	para "Es wäre wunderbar,"
	line "wenn die Menschen"
	cont "unsere Sendungen"
	cont "liebten."
	done

BenText:
	text "BEN: Hörst du dir"
	line "unsere Musik an?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "4S BÜRO DES"
	line "   INTENDANTEN"
	done

RadioTower5FStudio1SignText:
	text "4S STUDIO 1"
	done

RadioTower5F_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	db 2 ; coord events
	coord_event  0,  3, SCENE_DEFAULT, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScene

	db 5 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	db 5 ; object events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
