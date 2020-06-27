INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL


SECTION "maps/SlowpokeWellB1F", ROMX

SlowpokeWellB1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

SlowpokeWellB1FKurtScript:
	jumptextfaceplayer SlowpokeWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_SILVER
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	waitbutton
	closetext
	end

SlowpokeWellB1FTaillessSlowpokeScript:
	faceplayer
	opentext
	writetext SlowpokeWellB1FTaillessSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd strengthboulder

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "KURT: Hallo!"
	line "<PLAYER>!"

	para "Die Wache ganz"
	line "oben ist"
	cont "weggelaufen, als"
	cont "ich sie anschrie."

	para "Aber dann bin"
	line "ich in den"
	cont "BRUNNEN gefallen."

	para "Ich bin so hart "
	line "auf meinem Rücken"
	cont "gelandet, dass ich"
	cont "mich nicht mehr"
	cont "bewegen kann."

	para "Mist! Wenn ich"
	line "fit wäre, würden"

	para "meine #MON"
	line "sie bestrafen…"

	para "Ah, mir ist nicht"
	line "zu helfen."

	para "<PLAYER>, zeig"
	line "ihnen, wie mutig"
	cont "du bist. Tu es für"
	cont "mich!"
	done

KurtLeaveSlowpokeWellText:
	text "KURT: Weiter so,"
	line "<PLAYER>!"

	para "TEAM ROCKET ist"
	line "abgehauen."

	para "Meinem Rücken geht"
	line "es schon besser."
	cont "Lass uns gehen."
	done

GruntM29SeenText:
	text "Mist! Ich stand"
	line "da oben Wache, als"

	para "ein Verrückter"
	line "vorbeikam und"
	cont "mich anschrie."

	para "Ich bin so"
	line "erschrocken, dass"
	cont "ich hier hinunter"
	cont "gefallen bin."

	para "Ich glaube, ich"
	line "lasse meine Wut"
	cont "an dir aus!"
	done

GruntM29BeatenText:
	text "Arrgh! Heute ist"
	line "NICHT mein Tag!"
	done

GruntM29AfterBattleText:
	text "Klar haben wir den"
	line "FLEGMON die"

	para "RUTEN abgetrennt"
	line "und dann verkauft."

	para "Wir wollen nur"
	line "Profit machen."

	para "Genau! Wir sind"
	line "TEAM ROCKET und"

	para "für Geld machen"
	line "wir alles!"
	done

GruntM1SeenText:
	text "Was willst du?"
	line "Wenn du uns bei"

	para "der Arbeit störst,"
	line "gibt es für dich"
	cont "keine Gnade!"
	done

GruntM1BeatenText:
	text "Für heute war es"
	line "O.K., aber beim"
	cont "nächsten Mal wird"
	cont "alles anders!"
	done

TrainerGruntM1WhenTalkText:
	text "Yeah, TEAM ROCKET"
	line "wurde vor drei"
	cont "Jahren zer-"
	cont "schlagen."

	para "Aber wir haben"
	line "unsere Arbeit im"
	cont "Untergrund"
	cont "fortgesetzt."

	para "Nun kannst du"
	line "zusehen, wie wir"
	cont "für Unruhe sorgen!"
	done

GruntM2SeenText:
	text "Wir sollen auf-"
	line "hören, den"
	cont "FLEGMON ihre"
	cont "RUTEN abzutrennen?"

	para "Wenn wir auf dich"
	line "hören würden, wäre"
	cont "der Ruf von TEAM"
	cont "ROCKET ruiniert!"
	done

GruntM2BeatenText:
	text "Du bist…"
	line "zu stark…"
	done

GruntM2AfterBattleText:
	text "Wir brauchen das"
	line "Geld, aber mit"
	cont "FLEGMONRUTEN?"

	para "Manchmal ist es"
	line "hart, ein ROCKET"
	cont "RÜPEL zu sein!"
	done

GruntF1SeenText:
	text "Wir sollen auf-"
	line "hören, den"
	cont "FLEGMON ihre"
	cont "RUTEN abzutrennen?"

	para "Ja, versuche, uns"
	line "alle zu besiegen!"
	done

GruntF1BeatenText:
	text "Du vorlautes Balg!"
	done

GruntF1AfterBattleText:
	text "FLEGMONRUTEN"
	line "wachsen schnell"
	cont "nach!"

	para "Was ist falsch"
	line "daran, sie"
	cont "zu verkaufen?"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "Ein FLEGMON mit"
	line "abgetrennter"
	cont "RUTE…"

	para "Huh? Es trägt"
	line "einen BRIEF."
	cont "BRIEF lesen?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> liest den"
	line "BRIEF."

	para "Sei so lieb und"
	line "kümmere dich bitte"

	para "um Opa und das"
	line "FLEGMON."

	para "Danke, Papa"
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "Ein FLEGMON mit"
	line "abgetrennter"
	cont "RUTE…"
	done

SlowpokeWellB1F_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
