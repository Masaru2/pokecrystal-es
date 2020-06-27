INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2


SECTION "maps/Route39", ROMX

Route39_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	endifjustbattled
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue .NumberAccepted
	checkpoke PIKACHU
	iffalse .WantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokefanMDerekText_NotBragging
	promptbutton
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.WantsPikachu:
	writetext PokefanMDerekPikachuIsItText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Gift:
	jumpstd giftm
	end

.PackFull:
	jumpstd packfullm
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "MILTANK: Muh!"
	done

SailorEugeneSeenText:
	text "Ich bin gerade"
	line "wieder in OLIVIANA"
	cont "angekommen."

	para "Wie steht es nun"
	line "mit dem #MON-"
	cont "Kampf?"
	done

SailorEugeneBeatenText:
	text "Aah!"
	done

SailorEugeneAfterBattleText:
	text "Meine #MON"
	line "wurden eingefangen"
	cont "und sind im Aus-"
	cont "land aufgezogen"
	cont "worden."

	para "Sie begleiten mich"
	line "auf meinen langen"
	cont "Reisen."
	done

PokefanmDerekSeenText:
	text "Genau der richtige"
	line "Moment, um mit"
	cont "PIKACHU anzugeben!"
	done

PokefanmDerekBeatenText:
	text "Ich hatte keine"
	line "Zeit, mit PIKACHU"
	cont "zu prahlen…"
	done

PokefanMDerekText_NotBragging:
	text "Ich höre mir deine"
	line "Prahlerei gar"
	cont "nicht an!"

	para "Wir #-FANS"
	line "haben ein Gelübde,"

	para "das uns verbietet,"
	line "Leuten beim"
	cont "Prahlen zuzuhören!"
	done

PokefanfRuthSeenText:
	text "Was für süße"
	line "#MON!"

	para "Zeigen wir uns"
	line "gegenseitig unsere"
	cont "#MON, und zwar"
	cont "gleichzeitig!"
	done

PokefanfRuthBeatenText:
	text "Mir macht es"
	line "nichts aus,"
	cont "zu verlieren."
	done

PokefanfRuthAfterBattleText:
	text "Weißt du über"
	line "Baby-#MON"
	cont "Bescheid?"

	para "Die sind bestimmt"
	line "super-süß!"
	done

PokefanMDerekPikachuIsItText:
	text "PIKACHU muss sein!"
	line "Was meinst du?"
	done

PsychicNormanSeenText:
	text "Zeig doch mal, was"
	line "deine #MON"
	cont "drauf haben."
	done

PsychicNormanBeatenText:
	text "He, deine #MON"
	line "sind sehr fähig!"
	done

PsychicNormanAfterBattleText:
	text "Du weißt von den"
	line "unterschiedlichen"
	cont "#-Fähigkeiten?"

	para "Bei den Menschen"
	line "ist das ganz"
	cont "ähnlich. Jeder hat"
	cont "unterschiedliche"
	cont "Talente."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Ufu… Ich hoffe, es"
	line "wird bald dunkel."
	done

PokefanfJaimeSeenText:
	text "Du kommst gerade"
	line "recht."

	para "Auf in den Kampf."
	done

PokefanfJaimeBeatenText:
	text "Oh, wie"
	line "ernüchternd…"
	done

PokefanfJaimeAfterBattleText:
	text "Ich traf MAUZI"
	line "NACHTs, genau hier"
	cont "auf ROUTE 39."

	para "Ich weiß nicht"
	line "warum, aber es"

	para "scheint es zu"
	line "mögen, wenn ich"
	cont "hier trainiere."

	para "Es scheint mich"
	line "durch das Training"

	para "hier mehr zu"
	line "mögen, als wenn"

	para "ich woanders"
	line "trainiere."
	done

Route39SignText:
	text "ROUTE 39"

	para "OLIVIANA CITY -"
	line "TEAK CITY"
	done

MoomooFarmSignText:
	text "KUHMUH-FARM"

	para "Unsere Bekömmliche"
	line "Milch Ist Sehr"
	cont "Erfrischend"
	done

Route39TrainerTipsText:
	text "TIPPS für TRAINER"
	line "Benutze KOPFNUSS,"

	para "um #MON"
	line "aus den Bäumen"
	cont "zu schütteln."

	para "Auf den Bäumen"
	line "leben verschiedene"
	cont "Arten von #MON."

	para "Benutze KOPFNUSS"
	line "an jedem Baum, den"
	cont "du siehst!"
	done

Route39_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5, 31, BGEVENT_READ, Route39TrainerTips
	bg_event  9,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 15,  7, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget

	db 10 ; object events
	object_event 13, 29, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSailorEugene, -1
	object_event 10, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 11, 19, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanfRuth, -1
	object_event  3, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  8, 13, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13,  7, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	object_event  9,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
	object_event  4, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
