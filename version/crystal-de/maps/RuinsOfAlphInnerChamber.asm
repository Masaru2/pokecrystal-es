INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const RUINSOFALPHINNERCHAMBER_FISHER
	const RUINSOFALPHINNERCHAMBER_TEACHER
	const RUINSOFALPHINNERCHAMBER_GRAMPS


SECTION "maps/RuinsOfAlphInnerChamber", ROMX

RuinsOfAlphInnerChamber_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHINNERCHAMBER_NOTHING
	scene_script .UnownAppear ; SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE

	db 0 ; callbacks

.DummyScene0:
	end

.UnownAppear:
	prioritysjump .StrangePresenceScript
	end

.StrangePresenceScript:
	opentext
	writetext RuinsOfAlphStrangePresenceText
	waitbutton
	closetext
	setscene SCENE_RUINSOFALPHINNERCHAMBER_NOTHING
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	end

RuinsOfAlphInnerChamberFisherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberFisherText

RuinsOfAlphInnerChamberTeacherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberTeacherText

RuinsOfAlphInnerChamberGrampsScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberGrampsText

RuinsOfAlphInnerChamberStatue:
	jumptext RuinsOfAlphInnerChamberStatueText

RuinsOfAlphStrangePresenceText:
	text "Eine seltsame"
	line "Anwesenheit ist"
	cont "hier zu spüren…"
	done

RuinsOfAlphInnerChamberFisherText:
	text "Dies ist ein"
	line "großer Raum, aber"
	cont "er ist leer."
	done

RuinsOfAlphInnerChamberTeacherText:
	text "Dieser Ort strahlt"
	line "eine eigenartige"
	cont "Mystik aus."

	para "Man könnte es fast"
	line "schon als äthe-"
	cont "risch bezeichnen."
	done

RuinsOfAlphInnerChamberGrampsText:
	text "Antike Bauten sind"
	line "oft Grabstätten"
	cont "für Könige."

	para "Wie zum Beispiel"
	line "die Pyramiden."
	done

RuinsOfAlphInnerChamberStatueText:
	text "Dies ist eine"
	line "Nachbildung eines"
	cont "antiken #MON."
	done

RuinsOfAlphInnerChamber_MapEvents::
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 10, 13, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  3, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 3
	warp_event  4, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 4
	warp_event 15,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 3
	warp_event 16,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 4
	warp_event  3, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 3
	warp_event  4, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 4
	warp_event 15, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 3
	warp_event 16, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 4

	db 0 ; coord events

	db 26 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue

	db 3 ; object events
	object_event  3,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberFisherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 14, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberTeacherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 11, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberGrampsScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
