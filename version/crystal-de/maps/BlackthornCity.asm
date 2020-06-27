INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2


SECTION "maps/BlackthornCity", ROMX

BlackthornCity_MapScripts::
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return

.Santos:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	return

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	return

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornGramps1Script:
	jumptextfaceplayer BlackthornGrampsRefusesEntryText

BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext BlackBeltText_WeirdRadio
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext BlackBeltText_VoicesInMyHead
	waitbutton
	closetext
	end

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	jumptextfaceplayer BlackthornCooltrainerF2Text

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	promptbutton
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	promptbutton
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	jumpstd pokecentersign

BlackthornCityMartSign:
	jumpstd martsign

Text_ClairIsOut:
	text "Tut mir Leid."

	para "SANDRA, unsere"
	line "ARENALEITERIN,"

	para "ist in die"
	line "DRACHENHÖHLE"

	para "hinter der PKMN-"
	line "ARENA gegangen."

	para "Ich weiß nicht,"
	line "wann sie wieder-"
	cont "kommt."
	done

Text_ClairIsIn:
	text "SANDRA, unsere"
	line "ARENALEITERIN,"
	cont "erwartet dich."

	para "Für einen gewöhn-"
	line "lichen Trainer"

	para "ist es jedoch un-"
	line "möglich zu siegen."
	done

Text_ClairIsBeaten:
	text "Du hast SANDRA"
	line "besiegt?"

	para "Wie erstaunlich!"

	para "Soweit ich weiß,"
	line "hat sie bis jetzt"

	para "nur gegen"
	line "SIEGFRIED"
	cont "verloren."
	done

BlackthornGrampsRefusesEntryText:
	text "Nein. Nur auser-"
	line "wählte Trainer"

	para "dürfen hier"
	line "trainieren."
	cont "Gehe hinfort."
	done

BlackthornGrampsGrantsEntryText:
	text "Wenn SANDRA es dir"
	line "gestattet, dann"

	para "wird auch ihr Opa"
	line "- unser MEISTER -"
	cont "zustimmen."

	para "Tritt ein."
	done

BlackBeltText_WeirdRadio:
	text "Mein Radio ist im"
	line "Eimer. Seit kurzem"
	cont "empfange ich nur"
	cont "dieses eigenartige"
	cont "Signal."
	done

BlackBeltText_VoicesInMyHead:
	text "Aruuu! Stimmen in"
	line "meinem Kopf!"

	para "Häh? Ich höre"
	line "Radio!"
	done

BlackthornCooltrainerF1Text:
	text "Willst du, dass"
	line "deine #MON ei-"
	cont "nige Attacken ver-"
	cont "gessen?"
	done

BlackthornYoungsterText:
	text "Alle Drachen-"
	line "meister kommen aus"
	cont "EBENHOLZ CITY."
	done

MeetSantosText:
	text "SAMSON: …"

	para "Heute ist Samstag…"

	para "Ich bin SAMSON von"
	line "Samstag…"
	done

SantosGivesGiftText:
	text "Du kannst das"
	line "haben…"
	done

SantosGaveGiftText:
	text "SAMSON: …"

	para "BANNSTICKER…"

	para "Geist-Attacken"
	line "werden stärker…"

	para "Es ist geradezu"
	line "beängstigend…"
	done

SantosSaturdayText:
	text "SAMSON: …"

	para "Wir sehen uns an"
	line "einem anderen"
	cont "Samstag wieder…"

	para "Aber ich werde"
	line "dann keine Ge-"
	cont "schenke mehr"
	cont "haben…"
	done

SantosNotSaturdayText:
	text "SAMSON: Heute ist"
	line "nicht Samstag…"
	done

BlackthornCooltrainerF2Text:
	text "Wow, du bist über"
	line "den EISPFAD gekom-"
	cont "men?"

	para "Du musst ein rich-"
	line "tiger Heißsporn"
	cont "sein!"
	done

BlackthornCitySignText:
	text "EBENHOLZ CITY"

	para "Ein ruhiger Ort in"
	line "den Bergen"
	done

BlackthornGymSignText:
	text "PKMN-ARENA von"
	line "EBENHOLZ CITY"

	para "LEITUNG: SANDRA"
	line "Die gesegnete Dra-"
	cont "chen-#MON-"
	cont "Trainerin"
	done

MoveDeletersHouseSignText:
	text "HAUS DES ATTACKEN-"
	line "VERLERNERs"
	done

DragonDensSignText:
	text "DRACHENHÖHLE"
	line "GERADEAUS"
	done

BlackthornCityTrainerTipsText:
	text "TIPPS FÜR TRAINER"

	para "Ein #MON, das"
	line "eine WUNDERBEERE"

	para "trägt, kann von"
	line "sich aus Status-"
	cont "veränderungen hei-"
	cont "len."
	done

BlackthornCity_MapEvents::
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event  9, 31, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 34, 24, BGEVENT_READ, BlackthornCitySign
	bg_event 17, 13, BGEVENT_READ, BlackthornGymSign
	bg_event  7, 31, BGEVENT_READ, MoveDeletersHouseSign
	bg_event 21,  3, BGEVENT_READ, DragonDensSign
	bg_event  5, 25, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 16, 29, BGEVENT_READ, BlackthornCityMartSign
	bg_event 22, 29, BGEVENT_READ, BlackthornCityPokecenterSign

	db 9 ; object events
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 19, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 13, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 22, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 35, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
