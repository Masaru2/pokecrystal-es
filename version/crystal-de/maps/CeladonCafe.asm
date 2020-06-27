INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CELADONCAFE_SUPER_NERD
	const CELADONCAFE_FISHER1
	const CELADONCAFE_FISHER2
	const CELADONCAFE_FISHER3
	const CELADONCAFE_TEACHER


SECTION "maps/CeladonCafe", ROMX

CeladonCafe_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonCafeChef:
	faceplayer
	opentext
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

CeladonCafeFisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER1, LEFT
	end

CeladonCafeFisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER2, RIGHT
	end

CeladonCafeFisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher3Text_GoldenrodIsBest
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER3, RIGHT
	end

CeladonCafeTeacher:
	checkitem COIN_CASE
	iftrue .HasCoinCase
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext TeacherText_NoCoinCase
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

.HasCoinCase:
	opentext
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, RIGHT
	opentext
	writetext TeacherText_MoreChef
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafeTrashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem LEFTOVERS
	iffalse .PackFull
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end

.PackFull:
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	promptbutton
	writetext NoRoomForLeftoversText
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd trashcan

ChefText_Eatathon:
	text "Hi!"

	para "Wir halten gerade"
	line "ein Wettessen ab."

	para "Wir können dich"
	line "im Moment leider"
	cont "nicht bedienen."
	done

Fisher1Text_Snarfle:
	text "…Schlürf,"
	line "schlabber…"
	done

Fisher1Text_Concentration:
	text "Sprich mich"
	line "nicht an!"

	para "Du störst meine"
	line "Konzentration!"
	done

Fisher2Text_GulpChew:
	text "…Schluck…"
	line "Schling…"
	done

Fisher2Text_Quantity:
	text "Quantität ist mir"
	line "wichtiger als"
	cont "Qualität!"

	para "Ich bin erst"
	line "glücklich, wenn"
	cont "ich platze!"
	done

Fisher3Text_MunchMunch:
	text "Mampf, mampf…"
	done

Fisher3Text_GoldenrodIsBest:
	text "Das Essen hier ist"
	line "gut, aber in"
	cont "DUKATIA CITY gibt"
	cont "es die besten"
	cont "Speisen der Welt."
	done

TeacherText_CrunchCrunch:
	text "Krümel… Mampf…"
	done

TeacherText_NoCoinCase:
	text "Hier wird dir"
	line "niemand einen"

	para "MÜNZKORB geben."
	line "Den bekommst du"
	cont "in JOHTO."
	done

TeacherText_KeepEating:
	text "Krümel… Kau…"

	para "Ich esse immer"
	line "weiter!"
	done

TeacherText_MoreChef:
	text "Nachschub,"
	line "CHEFKOCH!"
	done

EatathonContestPosterText:
	text "Wettessen! Essen"
	line "bis zum Umfallen!"

	para "Kein Zeitlimit!"
	line "Der größte"

	para "Vielfraß bekommt"
	line "alles umsonst!"
	done

FoundLeftoversText:
	text "<PLAYER> hat"
	line "@"
	text_ram wStringBuffer3
	text_start
	cont "gefunden."
	done

NoRoomForLeftoversText:
	text "Aber <PLAYER> kann"
	line "kein weiteres Item"
	cont "aufnehmen…"
	done

CeladonCafe_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  7, CELADON_CITY, 9
	warp_event  7,  7, CELADON_CITY, 9

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  7,  1, BGEVENT_READ, CeladonCafeTrashcan

	db 5 ; object events
	object_event  9,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCafeChef, -1
	object_event  4,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, -1
	object_event  1,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, -1
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, -1
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, -1
