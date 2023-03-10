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
	text "ANCIANO: Eres muy"
	line "h??bil entrenando"
	cont "#MON."

	para "Como te promet??,"
	line "aqu?? tienes tu MO."

	para "Pero d??jame que te"
	line "diga que deber??as"

	para "tratar mejor a"
	line "tus #MON."

	para "Luchas de forma"
	line "muy violenta."

	para "Los #MON no son"
	line "armas de guerra."
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "???"

	para "??Bah!"
	line "Afirma ser el"

	para "ANCIANO, pero"
	line "es muy d??bil."

	para "Es evidente."

	para "Jam??s perder??a"
	line "ante quienes dicen"

	para "que hay que ser"
	line "bueno con los"
	cont "#MON."

	para "S??lo me interesan"
	line "los #MON"
	cont "ganadores."

	para "Paso de los"
	line "#MON d??biles."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "??<RIVAL>"
	line "us?? CUERDA HUIDA!"
	done

SageLiSeenText:
	text "??Encantado de"
	line "verte por aqu??!"

	para "TORRE BELLSPROUT"
	line "es un lugar de"
	cont "entrenamiento."

	para "La gente y los"
	line "#MON eval??an"

	para "sus v??nculos para"
	line "construir juntos"
	cont "un futuro mejor."

	para "Yo soy la prueba"
	line "final."

	para "??D??jame evaluar"
	line "tus v??nculos con"
	cont "los #MON!"
	done

SageLiBeatenText:
	text "??Ah, excelente!"
	done

SageLiTakeThisFlashText:
	text "T?? y tus #MON"
	line "no deber??ais tener"

	para "problemas con este"
	line "movimiento."

	para "Toma esta MO."
	line "Es DESTELLO."
	done

SageLiFlashExplanationText:
	text "DESTELLO ilumina"
	line "hasta el lugar m??s"
	cont "oscuro."

	para "Y, con la MEDALLA"
	line "de CIUDAD MALVA,"

	para "podr??s usarlo"
	line "fuera del combate."
	done

SageLiAfterBattleText:
	text "??Ojal?? aprendas y"
	line "madures con tu"
	cont "viaje!"
	done

SageJinSeenText:
	text "??Me entreno para"
	line "saberlo todo"
	cont "sobre los #MON!"
	done

SageJinBeatenText:
	text "Mi entrenamiento"
	line "es incompleto???"
	done

SageJinAfterBattleText:
	text "Cuanto m??s fuerte"
	line "sea el #MON,"

	para "m??s fuerte ser??"
	line "su entrenador."

	para "No, espera. Cuanto"
	line "m??s fuerte sea el"

	para "entrenador, m??s"
	line "fuerte el #MON."
	done

SageTroySeenText:
	text "A ver cu??nto"
	line "conf??as en tus"
	cont "#MON."
	done

SageTroyBeatenText:
	text "??S??, tu confianza"
	line "es aut??ntica!"
	done

SageTroyAfterBattleText:
	text "No est??s lejos del"
	line "ANCIANO."
	done

SageNealSeenText:
	text "La MO del ANCIANO"
	line "alumbra hasta lo"
	cont "m??s oscuro."
	done

SageNealBeatenText:
	text "??Mi cerebro s?? que"
	line "es brillante!"
	done

SageNealAfterBattleText:
	text "??Que haya luz en"
	line "tus viajes!"
	done

SproutTower3FPaintingText:
	text "Es un bonito"
	line "cuadro de un"
	cont "BELLSPROUT."
	done

SproutTower3FStatueText:
	text "Estatua #MON???"

	para "Parece muy"
	line "ilustre."
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
