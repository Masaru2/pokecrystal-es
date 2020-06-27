INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN


SECTION "maps/BillsFamilysHouse", ROMX

BillsFamilysHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText_BeforeEcruteak
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText_AfterEcruteak
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

BillTakeThisEeveeText:
	text "BILL: Hi, <PLAYER>!"
	line "Tu uns einen Ge-"
	cont "fallen und nimm"
	cont "dieses EVOLI."

	para "Es kam hierher,"
	line "als ich an der"
	cont "ZEITKAPSEL gear-"
	cont "beitet habe."

	para "Jemand sollte sich"
	line "darum kümmern,"

	para "aber ich gehe"
	line "nicht gerne raus."

	para "Wirst du für mich"
	line "mit ihm spielen,"
	cont "<PLAYER>?"
	done

BillImCountingOnYouText:
	text "BILL: Ich wusste,"
	line "dass du es"

	para "schaffst! Noch ein"
	line "kleines Stück! Du"
	cont "bist einzigartig!"

	para "O.K., ich zähle"
	line "auf dich."

	para "Pass auf dich auf!"
	done

ReceivedEeveeText:
	text "<PLAYER> erhält"
	line "EVOLI!"
	done

BillEeveeMayEvolveText:
	text "BILL: PROF. LIND"
	line "sagt, EVOLI kann"

	para "sich in neue, un-"
	line "bekannte Arten"
	cont "entwickeln."
	done

BillPartyFullText:
	text "Moment! Du hast"
	line "keinen Platz mehr"
	cont "in deinem Team."
	done

BillNoEeveeText:
	text "Oh… Was soll ich"
	line "tun?"
	done

BillPopWontWorkText:
	text "BILL: Mein Paps"
	line "arbeitet nicht. Er"

	para "geht den ganzen"
	line "Tag müßig."

	para "Er fängt an, zu"
	line "nerven…"
	done

BillsMomText_BeforeEcruteak:
	text "Oh, du sammelst"
	line "#MON? Mein Sohn"
	cont "BILL ist ein"
	cont "Experte."

	para "Er wurde gerade in"
	line "das #MON-CENTER"

	para "von TEAK CITY"
	line "gerufen."

	para "Mein Mann ging in"
	line "die SPIELHALLE,"

	para "ohne angerufen"
	line "zu werden…"
	done

BillsMomText_AfterEcruteak:
	text "Mein Mann war als"
	line "#MANIAC "

	para "bekannt. BILL"
	line "muss nach seinem"
	cont "Vater kommen."
	done

BillsSisterUsefulNumberText:
	text "Bist du ein"
	line "Trainer?"

	para "Ich habe eine"
	line "nützliche Telefon-"
	cont "nummer für dich."
	done

RecordedBillsNumberText:
	text "<PLAYER> speichert"
	line "BILLs Nummer."
	done

BillsSisterRefusedNumberText:
	text "Mein Bruder hat"
	line "das PC-#MON-"
	cont "LAGERUNGS-SYSTEM"
	cont "erfunden."

	para "Ich wollte dir ge-"
	line "rade BILLs Nummer"
	cont "geben…"
	done

BillsSisterPhoneFullText:
	text "Du kannst keine"
	line "Nummern mehr spei-"
	cont "chern."
	done

BillsSisterStorageSystemText:
	text "Mein großer Bruder"
	line "BILL hat das PC-"
	cont "#MON-LAGERUNGS-"
	cont "SYSTEM erfunden."
	done

BillsFamilysHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	db 3 ; object events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
