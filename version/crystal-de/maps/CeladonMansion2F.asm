INCLUDE "constants/maps_common.inc"


SECTION "maps/CeladonMansion2F", ROMX

CeladonMansion2F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FMeetingRoomSign:
	jumptext CeladonMansion2FMeetingRoomSignText

CeladonMansion2FBookshelf:
	jumpstd difficultbookshelf

CeladonMansion2FComputerText:
	text "<PLAYER> hat den"
	line "PC eingeschaltet."

	para "…"

	para "Jemand war gerade"
	line "dabei, eine E-Mail"
	cont "aufzusetzen."

	para "…Ich hoffe, du"
	line "kommst einmal nach"
	cont "KANTO."

	para "Ich glaube, du"
	line "wärst überrascht,"

	para "wie viel sich hier"
	line "verändert hat."

	para "Man sieht auch"
	line "viele #MON, die"

	para "nicht aus JOHTO"
	line "stammen."

	para "An den PRODUZENTEN"

	para "…"
	done

CeladonMansion2FMeetingRoomSignText:
	text "GAME FREAK"
	line "KONFERENZRAUM"
	done

CeladonMansion2F_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FMeetingRoomSign
	bg_event  2,  3, BGEVENT_READ, CeladonMansion2FBookshelf

	db 0 ; object events
