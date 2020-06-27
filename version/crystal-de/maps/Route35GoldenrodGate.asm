INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE35GOLDENRODGATE_RANDY
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER


SECTION "maps/Route35GoldenrodGate", ROMX

Route35GoldenrodGate_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftrue .gothpup
	checkevent EVENT_GAVE_KENYA
	iftrue .questcomplete
	checkevent EVENT_GOT_KENYA
	iftrue .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalse .refused
	writetext Route35GoldenrodGateRandyThanksKidText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, 10, NO_ITEM, TRUE, GiftSpearowName, GiftSpearowOTName
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	writetext Route35GoldenrodGateRandyWeirdTreeBlockingRoadText
	waitbutton
	closetext
	end

.partyfull
	writetext Route35GoldenrodGateRandyCantCarryAnotherMonText
	waitbutton
	closetext
	end

.refused
	writetext Route35GoldenrodGateRandyOhNeverMindThenText
	waitbutton
	closetext
	end

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	closetext
	end

GiftSpearowMail:
	db FLOWER_MAIL
	db   "DUNKELHÖHLE    "
	next "ist ein Pfad   @"

GiftSpearowName:
	db "HABSI@"

GiftSpearowOTName:
	db "HARALD@"

	db 0, "EG@", 0 ; filler

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText
	waitbutton
	closetext
	end

.FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText_FoughtSudowoodo
	waitbutton
	closetext
	end

Route35GoldenrodGateFisherScript:
	jumptextfaceplayer Route35GoldenrodGateFisherText

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Entschuldige,"
	line "bitte!"
	cont "Könntest du mir"
	cont "einen Gefallen"
	cont "tun?"

	para "Könntest du dieses"
	line "#MON, das einen"
	cont "BRIEF trägt,"
	cont "zu meinem Freund"
	cont "bringen?"

	para "Du findest ihn"
	line "auf ROUTE 31."
	done

Route35GoldenrodGateRandyThanksKidText:
	text "Das würdest du"
	line "tun? Super!"
	cont "Vielen Dank!"

	para "Mein Freund ist"
	line "ein Flegel!"
	cont "Er schläft die"
	cont "ganze Zeit."

	para "Du wirst ihn"
	line "sofort erkennen!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> hat ein"
	line "#MON, das einen"

	para "BRIEF trägt,"
	line "erhalten."
	done

Route35GoldenrodGateRandyWeirdTreeBlockingRoadText:
	text "Du darfst ihn le-"
	line "sen, aber verliere"
	cont "ihn nicht!"
	cont "ROUTE 31!"

	para "Stimmt! Ein"
	line "merkwürdiger"
	cont "Baum hat die"
	cont "Straße blockiert."

	para "Ich frage mich,"
	line "ob die Straße"
	cont "jetzt frei ist."
	done

Route35GoldenrodGateRandyCantCarryAnotherMonText:
	text "Du kannst kein"
	line "weiteres #MON"
	cont "mehr tragen…"
	done

Route35GoldenrodGateRandyOhNeverMindThenText:
	text "Oh… Dann"
	line "geht das in"
	cont "Ordnung…"
	done

Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "Ich danke dir!"
	line "Du hast die"
	cont "Lieferung für mich"
	cont "erledigt!"

	para "Ich habe hier"
	line "etwas für dich"
	cont "wegen der Un-"
	cont "annehmlichkeiten!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "Mein Freund hat"
	line "geschlafen, nicht"
	cont "wahr? Na, was"
	cont "habe ich dir"
	cont "gesagt?"
	done

Route35GoldenrodGatePokefanFText:
	text "Ein merkwürdiger"
	line "Baum blockiert die"
	cont "Straße."

	para "Er fängt an zu"
	line "zappeln, wenn man"
	cont "ihn anspricht."

	para "Ich habe gehört,"
	line "dass er rasend"
	cont "wurde, als ihn"

	para "jemand mit Wasser"
	line "aus einer"
	cont "SCHIGGYKANNE"
	cont "begossen hat."
	done

Route35GoldenrodGatePokefanFText_FoughtSudowoodo:
	text "Ich mag das #-"
	line "MON-Schlaflied,"
	cont "das im Radio"
	cont "gespielt wird."
	done

Route35GoldenrodGateFisherText:
	text "Ich frage mich,"
	line "wie viele Arten"

	para "von #MON es"
	line "wohl geben mag."

	para "Vor drei Jahren"
	line "hat PROF. EICH"

	para "verlautbart, dass"
	line "es 150 verschie-"
	cont "dene Arten geben"
	cont "soll."
	done

Route35GoldenrodGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGateFisherScript, -1
