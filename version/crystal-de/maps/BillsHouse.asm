INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const BILLSHOUSE_GRAMPS


SECTION "maps/BillsHouse", ROMX

BillsHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

BillsGrandpa:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext BillsGrandpaIntroText
	promptbutton
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iftrue .ShowedPichu
	checkevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	iftrue .ShowedGrowlitheVulpix
	checkevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	iftrue .ShowedStaryu
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext BillsGrandpaLickitungText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal LICKITUNG, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	sjump .ShowedLickitung

.GotEverstone:
	writetext BillsGrandpaOddishText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal ODDISH, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	sjump .ShowedOddish

.GotLeafStone:
	writetext BillsGrandpaStaryuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal STARYU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	sjump .ShowedStaryu

.GotWaterStone:
	checkver
	iftrue .AskVulpix
	writetext BillsGrandpaGrowlitheText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal GROWLITHE, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	sjump .ShowedGrowlitheVulpix

.AskVulpix:
	writetext BillsGrandpaVulpixText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal VULPIX, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	sjump .ShowedGrowlitheVulpix

.GotFireStone:
	writetext BillsGrandpaPichuText
	promptbutton
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal PICHU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	sjump .ShowedPichu

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedOddish:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue .GotLeafStone
	scall .ReceiveItem
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedStaryu:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .GotWaterStone
	scall .ReceiveItem
	verbosegiveitem WATER_STONE
	iffalse .BagFull
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedGrowlitheVulpix:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .GotFireStone
	scall .ReceiveItem
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedPichu:
	scall .ReceiveItem
	verbosegiveitem THUNDERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	promptbutton
	end

.SaidNo:
	writetext BillsGrandpaYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	promptbutton
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	promptbutton
	end

.JustShowedSomething:
	writetext BillsGrandpaComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext BillsGrandpaShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext BillsGrandpaWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

BillsGrandpaIntroText:
	text "Hm? Kennst du"
	line "BILL? Er ist mein"
	cont "Enkel."

	para "Er ist in JOHTO."
	line "Er kümmert sich"

	para "um PCs und ich"
	line "passe auf das"
	cont "Haus auf."
	done

BillsGrandpaAskToSeeMonText:
	text "Hast du dieses"
	line "#MON? Darf ich"
	cont "es sehen?"
	done

BillsGrandpaExcitedToSeeText:
	text "Du zeigst es mir?"
	line "Wie lieb von dir!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "Du hast es nicht?"
	line "Das ist schade…"
	done

BillsGrandpaShownPokemonText:
	text "Ah, das ist"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Ist das nicht"
	line "niedlich!"
	cont "Das ist nett "
	cont "von dir."
	done

BillsGrandpaTokenOfAppreciationText:
	text "Danke!"

	para "Das ist ein"
	line "Zeichen meiner"
	cont "Anerkennung."
	done

BillsGrandpaComeAgainText:
	text "Besuche mich bitte"
	line "wieder."
	done

BillsGrandpaShownAllThePokemonText:
	text "Danke, dass du mir"
	line "so viele niedliche"
	cont "#MON gezeigt"
	cont "hast."

	para "Ich habe mich"
	line "wirklich amüsiert."

	para "Ich bin froh, dass"
	line "ich das noch"
	cont "erleben durfte."
	done

BillsGrandpaWrongPokemonText:
	text "Hm?"

	para "Das ist nicht das"
	line "#MON, von dem"
	cont "ich gehört habe."
	done

BillsGrandpaLickitungText:
	text "Mein Enkel BILL"
	line "hat mir von einem"

	para "#MON mit einer"
	line "langen Zunge"
	cont "erzählt."
	done

BillsGrandpaOddishText:
	text "Ah, mein Enkel"
	line "erwähnte ein"

	para "rundes, grünes "
	line "#MON, auf"
	cont "dessen Kopf Blät-"
	cont "ter wachsen."
	done

BillsGrandpaStaryuText:
	text "Kennst du ein"
	line "Wasser-#MON"

	para "mit einer roten"
	line "Kugel im Körper?"

	para "Es sieht aus wie"
	line "ein Stern!"

	para "Ich hörte, es"
	line "taucht NACHTs auf."

	para "Ich würde es"
	line "gerne sehen."
	done

BillsGrandpaGrowlitheText:
	text "BILL erzählte mir"
	line "von einem #MON,"

	para "das seinem Trainer"
	line "gegenüber sehr"
	cont "loyal ist."

	para "Es scheint ein"
	line "guter BRÜLLER zu"
	cont "sein."
	done

BillsGrandpaVulpixText:
	text "Ich hörte von"
	line "einem niedlichen"
	cont "#MON, das"
	cont "sechs Schwänze"
	cont "hat."

	para "So ein niedliches"
	line "#MON würde ich"
	cont "gerne umarmen."
	done

BillsGrandpaPichuText:
	text "Kennst du dieses"
	line "sehr beliebte"
	cont "#MON?"

	para "Das #MON, mit"
	line "dem gelben Körper"
	cont "und den roten"
	cont "Wangen."

	para "Ich würde gerne"
	line "sehen, wie es vor"

	para "seiner Entwicklung"
	line "aussieht."
	done

BillsHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_25, 1
	warp_event  3,  7, ROUTE_25, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
