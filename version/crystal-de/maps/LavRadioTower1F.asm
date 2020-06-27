INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2


SECTION "maps/LavRadioTower1F", ROMX

LavRadioTower1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd receiveitem
	end

.expncardname
	db "ZUSATZSET@"

LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavRadioTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary:
; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavRadioTower1FReceptionistText:
	text "Willkommen!"
	line "Schau dich auf"

	para "dieser Etage"
	line "ruhig um."
	done

LavRadioTower1FOfficerText:
	text "Du darfst leider"
	line "nur das Erd-"
	cont "geschoss erkunden."

	para "Seit der RADIOTURM"
	line "in JOHTO von einer"

	para "Verbrechergang"
	line "besetzt wurde,"

	para "mussten wir unsere"
	line "Sicherheitsmaß-"
	cont "nahmen erhöhen."
	done

LavRadioTower1FSuperNerd1Text:
	text "Viele Menschen"
	line "arbeiten sehr hart"
	cont "im RADIOTURM."

	para "Sie müssen ihr"
	line "Bestes geben für"
	cont "eine gute Sendung."
	done

LavRadioTower1FGentlemanText:
	text "Nein, nein, nein!"

	para "Wir sind nicht"
	line "mehr auf Sendung,"

	para "seit das KRAFTWERK"
	line "nicht mehr läuft."

	para "Alle Bemühungen,"
	line "diese Station zum"

	para "Laufen zu bringen,"
	line "sind vergebens,"
	cont "wenn ich nichts"
	cont "senden kann."

	para "Ich bin ruiniert!"
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "Ah! Dann bist du"
	line "<PLAY_G>. Du hast"

	para "das Problem mit"
	line "dem KRAFTWERK"
	cont "gelöst?"

	para "Dir habe ich es zu"
	line "verdanken, dass"

	para "ich nicht arbeits-"
	line "los wurde! Du bist"
	cont "mein Lebensretter!"

	para "Zum Dank gebe ich"
	line "dir das hier."
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "Damit kannst du"
	line "die Radioprogramme"

	para "in KANTO"
	line "empfangen."

	para "Hahahahaha!"
	done

LavRadioTower1FSuperNerd2Text:
	text "Hi!"

	para "Ich bin der"
	line "tolle MUSIK-"
	cont "REDAKTEUR!"

	para "Was? Dein #COM"
	line "kann meine Musik-"
	cont "sendungen nicht"

	para "empfangen? Wie"
	line "traurig!"

	para "Wenn du dir ein"
	line "ZUSATZSET be-"
	cont "sorgst, empfängst"

	para "du meine Send-"
	line "ungen. Hol es dir"
	cont "bald!"
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Hi, mein Freund!"

	para "Ich bin der"
	line "tolle MUSIK-"
	cont "REDAKTEUR!"

	para "Ich bin derjenige,"
	line "der diese wunder-"
	cont "vollen Melodien"

	para "auf Sendung"
	line "bringt."

	para "Sei so frei"
	line "und lausche der"
	cont "schönen Melodei!"
	done

LavRadioTower1FDirectoryText:
	text "EG REZEPTION"
	line "1S VERKAUF"
	cont "2S PERSONAL"
	cont "3S PRODUKTION"
	cont "4S BÜRO DES"
	cont "   INTENDANTEN"
	done

LavRadioTower1FPokeFluteSignText:
	text "Mach deine #MON"
	line "mit den Fröhlichen"

	para "Melodien der #-"
	line "FLÖTE auf PROGRAMM"
	cont "20 wieder munter."
	done

LavRadioTower1FReferenceLibraryText:
	text "Wow! Ein ganzes"
	line "Regal voller #-"
	cont "MON CDs und"
	cont "Videos."

	para "Das muss die"
	line "Bibliothek sein."
	done

LavRadioTower1F_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	db 5 ; object events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
