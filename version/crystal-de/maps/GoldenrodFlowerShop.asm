INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA


SECTION "maps/GoldenrodFlowerShop", ROMX

GoldenrodFlowerShop_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .Lalala
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	checkevent EVENT_MET_FLORIA
	iffalse .HaventMetFloria
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iffalse .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	promptbutton
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	setevent EVENT_FLORIA_AT_SUDOWOODO
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	end

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	end

.GotSquirtbottle:
	jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText

.NoPlainBadge:
	jumptextfaceplayer GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText

.HaventMetFloria:
	jumptextfaceplayer GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	writetext GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	clearevent EVENT_FLORIA_AT_SUDOWOODO
	end

.GotSquirtbottle:
	writetext GoldenrodFlowerShopFloriaYouBeatWhitneyText
	waitbutton
	closetext
	end

.FoughtSudowoodo:
	writetext GoldenrodFlowerShopFloriaItReallyWasAMonText
	waitbutton
	closetext
	end

FlowerShopShelf1:
; unused
	jumpstd picturebookshelf

FlowerShopShelf2:
; unused
	jumpstd magazinebookshelf

FlowerShopRadio:
; unused
	jumpstd radio2

GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "Hast du den wacke-"
	line "ligen Baum auf"
	cont "ROUTE 36 gesehen?"

	para "Meine kleine"
	line "Schwester war auf-"
	cont "geregt und wollte"
	cont "ihn sich ansehen…"

	para "Ich bin besorgt…"
	line "Ist das riskant?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "Möchtest du auch"
	line "die Gießkanne aus-"
	cont "leihen? Ich werde"
	cont "nicht zulassen,"

	para "dass du etwas Ge-"
	line "fährliches damit"
	cont "anstellst."
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Oh, du bist besser"
	line "als BIANKA…"

	para "Dann bist du in"
	line "Ordnung. Hier, die"
	cont "SCHIGGYKANNE!"
	done

GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "Unternimm nichts"
	line "Gefährliches!"
	done

GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText:
	text "Lalala lalalala."
	line "Da hast du Wasser,"
	cont "mein Hübsches!"
	done

GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "Als ich meiner"
	line "Schwester von dem"

	para "wackeligen Baum"
	line "erzählte, sagte"

	para "sie mir, dass er"
	line "gefährlich sei."

	para "Ich frage mich, ob"
	line "sie mir ihre Gieß-"
	cont "kanne leiht, wenn"
	cont "ich BIANKA"
	cont "besiege…"
	done

GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Wow, du hast gegen"
	line "BIANKA gewonnen?"
	done

GoldenrodFlowerShopFloriaItReallyWasAMonText:
	text "Es war tatsächlich"
	line "ein #MON!"
	done

GoldenrodFlowerShop_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
