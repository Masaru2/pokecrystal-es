INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BUENA
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS


SECTION "maps/BattleTowerOutside", ROMX

BattleTowerOutside_MapScripts::
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	return

.Callback2:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBuenaScript:
	jumptextfaceplayer BattleTowerOutsideBuenaText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideYoungsterText_NotYetOpen:
; unreferenced
	text "Wow, der DUELLTURM"
	line "ist riesig! Mein"

	para "Nacken ist schon"
	line "steif, weil ich"

	para "ständig hinauf-"
	line "schaue."
	done

BattleTowerOutsideYoungsterText_Mobile:
; unreferenced
	text "Wow, der DUELLTURM"
	line "ist riesig!"

	para "Da sich darin so"
	line "viele Trainer"

	para "tummeln, muss es"
	line "auch sehr viele"

	para "unterschiedliche"
	line "#MON geben."
	done

BattleTowerOutsideYoungsterText:
	text "Wow, der DUELLTURM"
	line "ist riesig!"

	para "Es muss dort viele"
	line "#MON geben!"
	done

BattleTowerOutsideBuenaText_NotYetOpen:
; unreferenced
	text "Was geht denn hier"
	line "vor sich?"

	para "Nomen est Omen:"
	line "Hier muss es"

	para "um #MON-Kämpfe"
	line "gehen."
	done

BattleTowerOutsideBuenaText:
	text "Du darfst nur drei"
	line "#MON einsetzen."

	para "Es fällt einem"
	line "nicht leicht, drei"

	para "#MON für den"
	line "Kampf auszuwählen…"
	done

BattleTowerOutsideSailorText_Mobile:
; unreferenced
	text "Ehehehe…"
	line "Ich schlich mich"

	para "von der Arbeit"
	line "weg, um hierher"
	cont "zu kommen"

	para "Ich werde nicht"
	line "eher aufgeben, bis"
	cont "ich ein"
	cont "PRIMUS bin!"
	done

BattleTowerOutsideSailorText:
	text "Hehehe, ich drücke"
	line "mich vor der Ar-"
	cont "beit. Ich kann"

	para "nicht zurück, bis"
	line "ich siege. Ich"

	para "muss alles gewin-"
	line "nen. Es ist ein"
	cont "Zwang!"
	done

BattleTowerOutsideSignText_NotYetOpen:
; unused; originally shown when the Battle Tower was closed
	text "DUELLTURM"
	done

BattleTowerOutsideSignText:
	text "DUELLTURM"

	para "Die ultimative"
	line "Herausforderung!"
	done

BattleTowerOutsideText_DoorsClosed:
; unused; originally shown when the Battle Tower was closed
	text "Der DUELLTURM"
	line "ist geschlossen…"
	done

BattleTowerOutsideText_DoorsOpen:
; unused; originally shown after the Battle Tower opened
	text "Geöffnet!"
	done

BattleTowerOutside_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign

	db 4 ; object events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBuenaScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
