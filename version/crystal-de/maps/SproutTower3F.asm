INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_SILVER


SECTION "maps/SproutTower3F", ROMX

SproutTower3F_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, MovementData_0x184a1d
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a22
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_SILVER, 15
	turnobject SPROUTTOWER3F_SILVER, DOWN
	pause 15
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a24
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_SILVER, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_SILVER
	waitsfx
	special FadeInQuickly
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	promptbutton
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

MovementData_0x184a1d:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x184a22:
	step UP
	step_end

MovementData_0x184a24:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "WEISER: Du bist "
	line "wirklich ein"
	cont "begabter Trainer."

	para "Wie abgemacht, be-"
	line "kommst du die VM."

	para "Eines gebe ich dir"
	line "noch mit: "

	para "Behandle deine"
	line "#MON besser."

	para "Dein Kampfstil"
	line "ist zu aggressiv."

	para "#MON sind keine"
	line "Kampfspielzeuge…"
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…"
	line "…Hmpf!"

	para "Er behauptet,"
	line "ein WEISER zu"
	cont "sein. Aber er ist"
	cont "schwach."

	para "Das muss noch"
	line "geklärt werden."

	para "Ich würde nie ge-"
	line "gen so einen Nar-"
	cont "ren verlieren, der"

	para "mir rät, meine"
	line "#MON gut zu"
	cont "behandeln."

	para "Für mich zählen"
	line "nur starke"
	cont "#MON."

	para "Schwache #MON"
	line "interessieren mich"
	cont "gar nicht."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> benutzt"
	line "FLUCHTSEIL!"
	done

SageLiSeenText:
	text "Schön, dass du"
	line "gekommen bist!"

	para "Der KNOFENSA-TURM"
	line "ist eine"

	para "Trainingsstätte."
	line "Trainer und"

	para "#MON prüfen"
	line "ihre Freundschaft,"

	para "um gemeinsam eine"
	line "rosige Zukunft"

	para "aufzubauen."
	line "Und ich bin der"

	para "letzte Test."
	line "Erlaube, dass ich"

	para "die Freundschaft"
	line "zwischen dir und"

	para "deinen #MON"
	line "überprüfe!"
	done

SageLiBeatenText:
	text "Ah, sehr gut!"
	done

SageLiTakeThisFlashText:
	text "Du und dein #-"
	line "MON dürftet keine"

	para "Probleme mit die-"
	line "ser Attacke haben."

	para "Nimm diese VM."
	line "Sie enthält BLITZ."
	done

SageLiFlashExplanationText:
	text "Mit BLITZ kannst"
	line "du die dunkelsten"
	cont "Orte erhellen."

	para "Um BLITZ auch"
	line "außerhalb eines"

	para "Kampfes anwenden"
	line "zu können, benö-"
	cont "tigst du den ORDEN"
	cont "des ARENALEITERs"
	cont "von VIOLA CITY."
	done

SageLiAfterBattleText:
	text "Ich hoffe, du"
	line "lernst viel auf"
	cont "deiner Reise."
	done

SageJinSeenText:
	text "Ich trainiere, um"
	line "durch #MON die"
	cont "Erleuchtung"
	cont "zu finden!"
	done

SageJinBeatenText:
	text "Mein Training ist"
	line "unvollständig…"
	done

SageJinAfterBattleText:
	text "Je stärker die"
	line "#MON werden,"
	cont "desto stärker wird"
	cont "auch ihr Trainer."

	para "Nein, warte! Je"
	line "stärker der Trai-"
	cont "ner wird, desto"
	cont "stärker werden"
	cont "auch die #MON."
	done

SageTroySeenText:
	text "Ich will sehen,"
	line "wie sehr du deinen"
	cont "#MON vertraust."
	done

SageTroyBeatenText:
	text "Ja, du vertraust"
	line "ihnen wirklich!"
	done

SageTroyAfterBattleText:
	text "Du triffst bald"
	line "auf den WEISEN."
	done

SageNealSeenText:
	text "Mit der VM des"
	line "WEISEN kannst du"
	cont "selbst dunkelste"
	cont "Orte erhellen."
	done

SageNealBeatenText:
	text "Denken ist eben"
	line "meine Stärke!"
	done

SageNealAfterBattleText:
	text "Möge dein Weg"
	line "erleuchtet sein."
	done

SproutTower3FPaintingText:
	text "Dies ist ein dy-"
	line "namisches Gemälde"
	cont "von KNOFENSA."
	done

SproutTower3FStatueText:
	text "Eine PKMN-Statue…"

	para "Sie sieht sehr"
	line "erhaben aus."
	done

SproutTower3F_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	db 1 ; coord events
	coord_event 11,  9, SCENE_DEFAULT, SproutTower3FRivalScene

	db 6 ; bg events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	db 7 ; object events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
