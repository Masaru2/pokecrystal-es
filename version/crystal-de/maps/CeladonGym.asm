INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BUENA
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2


SECTION "maps/CeladonGym", ROMX

CeladonGym_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	promptbutton
	verbosegiveitem TM_GIGA_DRAIN
	iffalse .GotGigaDrain
	setevent EVENT_GOT_TM19_GIGA_DRAIN
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd gymstatue2

ErikaBeforeBattleText:
	text "ERIKA: Hallo…"
	line "Schönes Wetter,"

	para "nicht?"
	line "Einfach herrlich…"

	para "…Ich könnte gleich"
	line "einschlafen…"

	para "Ich heiße ERIKA."
	line "Ich bin die ARENA-"
	cont "LEITERIN von"
	cont "PRISMANIA CITY."

	para "…Wirklich? Den"
	line "ganzen Weg von "
	cont "JOHTO? Wie nett…"

	para "Oh, entschuldige."
	line "Ich wusste"

	para "nicht, dass du"
	line "gegen mich kämpfen"
	cont "willst."

	para "Nun gut. Ich werde"
	line "jedenfalls nicht"
	cont "verlieren."
	done

ErikaBeatenText:
	text "ERIKA: Oh!"
	line "Ich gebe mich"
	cont "geschlagen…"

	para "Du bist außerge-"
	line "wöhnlich stark…"

	para "Ich gebe dir den"
	line "FARBORDEN…"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> erhält"
	line "FARBORDEN."
	done

ErikaExplainTMText:
	text "ERIKA: Das war ein"
	line "herrlicher Kampf."

	para "Das spornt zu"
	line "neuen Taten an."

	para "Nimm bitte diese"
	line "TM an."

	para "Es ist GIGASAUGER."

	para "Das ist eine"
	line "schöne Attacke."

	para "Die Hälfte des zu-"
	line "gefügten Schadens"
	cont "wird zur Heilung"

	para "deines #MON"
	line "verwendet."

	para "Verwende sie,"
	line "wann immer du"
	cont "möchtest…"
	done

ErikaAfterBattleText:
	text "ERIKA: Eine"
	line "Niederlage ist"

	para "nicht sehr"
	line "angenehm…"

	para "Aber es ist ein"
	line "Ansporn, sich"

	para "mehr anzustrengen,"
	line "wenn man weiß,"

	para "dass es starke"
	line "Trainer gibt…"
	done

LassMichelleSeenText:
	text "Glaubst du, dass"
	line "eine PKMN-ARENA"
	cont "nur mit Mädchen"
	cont "selten ist?"
	done

LassMichelleBeatenText:
	text "Ach nee!"
	done

LassMichelleAfterBattleText:
	text "Ich wurde nur"
	line "unvorsichtig, das"
	cont "ist alles!"
	done

PicnickerTanyaSeenText:
	text "Oh, ein Kampf?"
	line "Das macht mir ein"
	cont "bisschen Angst,"
	cont "aber von mir aus!"
	done

PicnickerTanyaBeatenText:
	text "Ach, das war es?"
	done

PicnickerTanyaAfterBattleText:
	text "Oh, sieh nur, all"
	line "die ORDEN. Kein"

	para "Wunder, dass ich"
	line "verloren habe!"
	done

BeautyJuliaSeenText:
	text "Hast du die"
	line "Blumen betrachtet"
	cont "oder mich?"
	done

BeautyJuliaBeatenText:
	text "Wie ärgerlich!"
	done

BeautyJuliaAfterBattleText:
	text "Wie werde ich nur"
	line "so damenhaft"
	cont "wie ERIKA?"
	done

TwinsJoAndZoe1SeenText:
	text "Wir zeigen dir"
	line "#MON-Attacken,"
	cont "die ERIKA uns"
	cont "beigebracht hat!"
	done

TwinsJoAndZoe1BeatenText:
	text "Oh… Wir haben"
	line "verloren…"
	done

TwinsJoAndZoe1AfterBattleText:
	text "ERIKA wird es dir"
	line "heimzahlen!"
	done

TwinsJoAndZoe2SeenText:
	text "Wir werden ERIKA"
	line "beschützen!"
	done

TwinsJoAndZoe2BeatenText:
	text "Wir hatten keine"
	line "Chance…"
	done

TwinsJoAndZoe2AfterBattleText:
	text "ERIKA ist viel"
	line "stärker!"
	done

CeladonGym_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	db 6 ; object events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
