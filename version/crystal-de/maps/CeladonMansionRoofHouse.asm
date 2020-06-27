INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CELADONMANSIONROOFHOUSE_PHARMACIST


SECTION "maps/CeladonMansionRoofHouse", ROMX

CeladonMansionRoofHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext CeladonMansionRoofHousePharmacistIntroText
	promptbutton
	checktime NITE
	iftrue .Night
	writetext CeladonMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext CeladonMansionRoofHousePharmacistStoryText
	promptbutton
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext CeladonMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

CeladonMansionRoofHousePharmacistIntroText:
	text "Lass mich eine"
	line "gruselige Ge-"
	cont "schichte erzählen…"
	done

CeladonMansionRoofHousePharmacistNotNightText:
	text "Allerdings so"
	line "unheimlich ist"

	para "sie gar nicht,"
	line "wenn es draußen"
	cont "noch hell ist."

	para "Komm wieder, wenn"
	line "die Sonne unterge-"
	cont "gangen ist, O.K.?"
	done

CeladonMansionRoofHousePharmacistStoryText:
	text "Es war einmal ein"
	line "kleiner Junge. Er"

	para "hat eines Tages"
	line "ein neues FAHRRAD"
	cont "bekommen…"

	para "Er wollte sofort"
	line "darauf fahren…"

	para "Das machte ihm so"
	line "viel Spaß, dass er"

	para "gar nicht be-"
	line "merkte, dass die"

	para "Sonne unterge-"
	line "gangen war…"

	para "Auf dem Weg nach"
	line "Hause durch die"

	para "pechschwarze Nacht"
	line "wurde das Rad"
	cont "langsamer!"

	para "Die Pedale wurden"
	line "schwer wie Blei!"

	para "Als er aufhörte,"
	line "in die Pedale zu"

	para "treten, rollte das"
	line "Rad rückwärts!"

	para "Es schien fast,"
	line "als wäre das Rad"

	para "verhext und ver-"
	line "suche, ihn ins"

	para "Verderben zu"
	line "bringen!"

	para "…"

	para "…"

	para "Kreiiisch!"

	para "Der Junge war den"
	line "RADWEG bergauf"
	cont "gefahren!"

	para "…"
	line "Ba-dum ba-dum!"

	para "Es ist schön, dass"
	line "du meiner Ge-"
	cont "schichte so"
	cont "aufmerksam"
	cont "gelauscht hast."
	cont "Nimm dies - TM03!"
	done

CeladonMansionRoofHousePharmacistCurseText:
	text "TM03 enthält"
	line "FLUCH."

	para "Das ist eine"
	line "schreckliche"

	para "Attacke, bei der"
	line "die KP des Opfers"
	cont "verringert werden."
	done

CeladonMansionRoofHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1
