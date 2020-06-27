INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_POKEFAN_M1
	const ROUTE9_POKEFAN_M2


SECTION "maps/Route9", ROMX

Route9_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "Ich möchte den"
	line "FELSTUNNEL"
	cont "erforschen."
	done

CamperDeanBeatenText:
	text "Boah! Vorsicht!"
	done

CamperDeanAfterBattleText:
	text "Meine #MON"
	line "wurden verletzt,"

	para "obwohl ich den"
	line "FELSTUNNEL noch"
	cont "nicht betreten"
	cont "hatte."

	para "Ich bringe sie"
	line "besser sofort in"
	cont "ein #MON-"
	cont "CENTER."
	done

PicnickerHeidiSeenText:
	text "Warst du schon"
	line "beim Picknicken?"

	para "Das macht großen"
	line "Spaß!"
	done

PicnickerHeidiBeatenText:
	text "Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "Wir backen viele"
	line "gute Sachen, die"

	para "wir mit allen"
	line "teilen. Sie"
	cont "schmecken lecker!"
	done

CamperSidSeenText:
	text "Hey, du Lump!"
	line "Wirf deinen Müll"
	cont "nicht hier hin!"
	done

CamperSidBeatenText:
	text "Ich wollte nur"
	line "klarstellen, dass…"
	done

CamperSidAfterBattleText:
	text "Entschuldige!"
	line "Ich habe mich"
	cont "geirrt."
	done

PicnickerEdnaSeenText:
	text "Die Leute sollten"
	line "ihren Müll nicht"
	cont "hier liegen"
	cont "lassen."
	done

PicnickerEdnaBeatenText:
	text "Ohh… Ich habe"
	line "verloren…"
	done

PicnickerEdnaAfterBattleText:
	text "Energiesparen ist"
	line "wichtig, aber die"

	para "Natur ist noch"
	line "viel wichtiger."
	done

HikerTimSeenText:
	text "Wenn sie kommt,"
	line "kommt sie vom"
	cont "SILBERBERG…"

	para "Der SILBERBERG ist"
	line "in JOHTO, oder?"
	done

HikerTimBeatenText:
	text "Ich war zu sehr"
	line "mit Singen"
	cont "beschäftigt…"
	done

HikerTimAfterBattleText:
	text "Bei Kämpfen spielt"
	line "Konzentration eine"
	cont "wichtige Rolle."
	done

HikerSidneySeenText:
	text "Ich verrate dir"
	line "ein Geheimnis."

	para "Aber zuerst müssen"
	line "wir kämpfen!"
	done

HikerSidneyBeatenText:
	text "Oh, Mist!"
	line "Ich habe verloren…"
	done

HikerSidneyAfterBattleText:
	text "Du musst einen"
	line "kleinen Fluss"
	cont "durchqueren, um"
	cont "zum KRAFTWERK"
	cont "zu gelangen."
	done

Route9SignText:
	text "ROUTE 9"

	para "AZURIA CITY -"
	line "FELSTUNNEL"
	done

Route9_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	db 6 ; object events
	object_event 23, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 11,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSid, -1
	object_event 12, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 28,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerTim, -1
	object_event 36, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
