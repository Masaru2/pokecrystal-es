INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN


SECTION "maps/Route40BattleTowerGate", ROMX

Route40BattleTowerGate_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer Route40BattleTowerGateRockerText

Route40BattleTowerGateTwinScript:
	jumptextfaceplayer Route40BattleTowerGateTwinText

UnknownText_0x9f66f:
	text "Bist du auch ge-"
	line "kommen, um den"
	cont "DUELLTURM zu"
	cont "sehen?"

	para "Aber du kannst"
	line "noch nicht hinein."
	done

UnknownText_0x9f6ba:
	text "Der DUELLTURM ist"
	line "geöffnet."

	para "Ich möchte hinein,"
	line "aber ich habe mir"

	para "noch keinen guten"
	line "Spruch ausgedacht,"
	cont "wenn ich gewinne."
	done

Route40BattleTowerGateRockerText:
	text "Gehst du zum"
	line "DUELLTURM?"

	para "Das ist ein Ge-"
	line "heimnis, aber du"

	para "erhältst spezielle"
	line "Preise, wenn du"
	cont "oft gewinnst."
	done

UnknownText_0x9f783:
	text "Ich trainiere"
	line "meine #MON,"

	para "damit ich bereit"
	line "für den DUELLTURM"
	cont "bin."
	done

Route40BattleTowerGateTwinText:
	text "Die Level der"
	line "#MON, die ich"

	para "einsetzen möchte,"
	line "sind unter-"
	cont "schiedlich."

	para "Ich muss sie jetzt"
	line "trainieren!"
	done

Route40BattleTowerGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
