INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BUENA1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BUENA2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUY


SECTION "maps/MahoganyGym", ROMX

MahoganyGym_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuyWinScript
	writetext MahoganyGymGuyText
	waitbutton
	closetext
	end

.MahoganyGymGuyWinScript:
	writetext MahoganyGymGuyWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd gymstatue2

PryceText_Intro:
	text "#MON machen in"
	line "ihrem Leben viele"

	para "Erfahrungen. Genau"
	line "wie Menschen."

	para "Auch ich habe in"
	line "meinem Leben viel"
	cont "gesehen und er-"
	cont "litten."

	para "Da ich der Ältere"
	line "bin, lass mich dir"
	cont "zeigen, was ich"
	cont "meine."

	para "Ich war schon mit"
	line "#MON zusammen,"

	para "bevor du geboren"
	line "wurdest."

	para "Ich verliere nicht"
	line "gerne."

	para "Ich, NORBERT, der"
	line "Wintertrainer,"

	para "werde meine Macht"
	line "demonstrieren!"
	done

PryceText_Impressed:
	text "Ich bin von deinem"
	line "Können beein-"
	cont "druckt."

	para "Mit deinem starken"
	line "Willen, wirst du"

	para "alle Widrigkeiten"
	line "in deinem Leben"
	cont "überstehen."

	para "Du bist dieses"
	line "ORDENS würdig!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> erhält"
	line "EISORDEN."
	done

PryceText_GlacierBadgeSpeech:
	text "Dieser ORDEN hebt"
	line "den SPEZ-Wert dei-"
	cont "ner #MON."

	para "Außerdem können"
	line "deine #MON"
	cont "WHIRLPOOL einset-"
	cont "zen, um echte"
	cont "Strudel zu"
	cont "überwinden."

	para "Und dies… dies ist"
	line "ein Geschenk von"
	cont "mir!"
	done

PryceText_IcyWindSpeech:
	text "Diese TM enthält"
	line "EISSTURM."

	para "Sie verursacht"
	line "Schaden und ver-"
	cont "ringert die Ge-"
	cont "schwindigkeit."

	para "Sie stellt die"
	line "Härte des Winters"
	cont "dar."
	done

PryceText_CherishYourPokemon:
	text "Wenn Eis und"
	line "Schnee geschmolzen"
	cont "sind, kehrt der"
	cont "Frühling wieder."

	para "Du und deine"
	line "#MON werden"

	para "noch viele Jahre"
	line "zusammen sein."

	para "Genießt eure ge-"
	line "meinsame Zeit!"
	done

BoarderRonaldSeenText:
	text "Ich werde deine"
	line "#MON einfrie-"
	cont "ren, so dass sie"
	cont "sich nicht bewegen"
	cont "können."
	done

BoarderRonaldBeatenText:
	text "Mist! Ich konnte"
	line "nichts tun."
	done

BoarderRonaldAfterBattleText:
	text "Ich glaube, es"
	line "gibt eine Attacke,"

	para "die #MON"
	line "auch ausführen"

	para "können, wenn sie"
	line "gefroren sind."
	done

BoarderBradSeenText:
	text "Diese PKMN-ARENA"
	line "hat einen rutschi-"
	cont "gen Boden. Das ist"
	cont "doch lustig, oder?"

	para "Aber wir sind"
	line "nicht hier, um zu"
	cont "spielen!"
	done

BoarderBradBeatenText:
	text "Siehst du jetzt,"
	line "wie ernst wir es"
	cont "meinen?"
	done

BoarderBradAfterBattleText:
	text "Diese PKMN-ARENA"
	line "ist toll. Ich"
	cont "liebe es, mit mei-"
	cont "nen #MON hier"
	cont "zu snowboarden!"
	done

BoarderDouglasSeenText:
	text "Ich kenne NORBERTs"
	line "Geheimnis."
	done

BoarderDouglasBeatenText:
	text "O.K. Ich verrate"
	line "dir NORBERTs Ge-"
	cont "heimnis."
	done

BoarderDouglasAfterBattleText:
	text "Das Geheimnis von"
	line "NORBERTs Kraft…"

	para "Er meditiert täg-"
	line "lich unter einem"

	para "Wasserfall, um"
	line "Geist und Körper"
	cont "zu stärken."
	done

SkierRoxanneSeenText:
	text "Um zu NORBERT, un-"
	line "serem ARENALEITER,"

	para "zu gelangen, musst"
	line "du denken, bevor"
	cont "du loslegst."
	done

SkierRoxanneBeatenText:
	text "Beim Skifahren"
	line "würde ich nie ge-"
	cont "gen dich verlie-"
	cont "ren."
	done

SkierRoxanneAfterBattleText:
	text "Wenn du nicht ge-"
	line "nau rutschst,"

	para "kommst du in die-"
	line "ser PKMN-ARENA"
	cont "nicht weit."
	done

SkierClarissaSeenText:
	text "Sieh dir meinen"
	line "Parallelschwung"
	cont "an!"
	done

SkierClarissaBeatenText:
	text "Nein! Jetzt bin"
	line "ich weggerutscht!"
	done

SkierClarissaAfterBattleText:
	text "Ich hätte mit mei-"
	line "nen Ski-Künsten"
	cont "nicht so angeben"
	cont "sollen…"
	done

MahoganyGymGuyText:
	text "NORBERT ist ein"
	line "Veteran, der seine"

	para "#MON schon"
	line "seit fast 50 Jah-"
	cont "ren trainiert."

	para "Angeblich friert"
	line "er seine Gegner"

	para "gerne mit Eis-"
	line "Attacken ein."

	para "Das heißt, du"
	line "solltest ihn mit"

	para "deinem brennenden"
	line "Ehrgeiz schmelzen!"
	done

MahoganyGymGuyWinText:
	text "NORBERT ist nicht"
	line "übel, aber du"
	cont "bist noch besser!"

	para "Das war ein heißer"
	line "Kampf, der die"

	para "Kluft zwischen den"
	line "Generationen über-"
	cont "wunden hat."
	done

MahoganyGym_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	db 7 ; object events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1
