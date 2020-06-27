INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const MANIASHOUSE_ROCKER


SECTION "maps/ManiasHouse", ROMX

ManiasHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckle
	yesorno
	iffalse .refusetotakeshuckie
	special GiveShuckle
	iffalse .partyfull
	writetext ManiaText_TakeCareOfShuckle
	promptbutton
	waitsfx
	writetext ManiaText_GotShuckle
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_GOT_SHUCKIE
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfShuckle
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnShuckle
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
	ifequal SHUCKIE_FAINTED, .default_postevent
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_ShuckleNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_ShuckleLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft
	writetext ManiaText_ShuckleIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf:
; unused
	jumpstd picturebookshelf

ManiaText_AskLookAfterShuckle:
	text "Ich… ich bin"
	line "schockiert!"

	para "Ein Junge in dei-"
	line "nem Alter mit"

	para "stechenden Augen"
	line "und langen Haaren"
	cont "kam hier rein."

	para "Er hat mich ge-"
	line "zwungen, ihm meine"
	cont "preisgekrönten"
	cont "#MON zu geben!"

	para "Ich habe zwar noch"
	line "eines übrig, aber"
	cont "was soll ich tun,"
	cont "wenn er zurück-"
	cont "kommt?"

	para "Du siehst stark"
	line "aus. Würdest du"

	para "auf mein #MON"
	line "aufpassen?"
	done

ManiaText_TakeCareOfShuckle:
	text "Oh, ich danke dir!"

	para "Bitte pass gut da-"
	line "rauf auf!"
	done

ManiaText_GotShuckle:
	text "<PLAYER> erhält ein"
	line "#MON."
	done

ManiaText_PartyFull:
	text "Du hast keinen"
	line "Platz mehr in dei-"
	cont "nem Team."
	done

ManiaText_IfHeComesBack:
	text "Oh nein… was soll"
	line "ich nur tun, wenn"
	cont "er zurückkommt?"
	done

ManiaText_CanIHaveMyMonBack:
	text "Hi! Wie geht es"
	line "meinem #MON?"

	para "Ich glaube, ich"
	line "bin jetzt sicher."
	cont "Kann ich es zu-"
	cont "rück haben?"
	done

ManiaText_ThankYou:
	text "Danke!"
	done

ManiaText_ShuckleNotThere:
	text "Hey, du hast mein"
	line "#MON gar nicht"
	cont "dabei!"
	done

ManiaText_ShuckleLikesYou:
	text "Mein #MON"
	line "scheint dich zu"
	cont "mögen."

	para "Na gut, dann"
	line "sollst du es be-"
	cont "halten. Aber ver-"
	cont "sprich mir, es gut"
	cont "zu behandeln."
	done

ManiaText_SameAsBeingRobbed:
	text "Oh, nein, nein…"
	line "das ist so, als"
	cont "würde man beraubt."
	done

ManiaText_HappinessSpeech:
	text "Für #MON ist"
	line "es das höchste"

	para "Glück, wenn sie"
	line "bei jemandem sein"

	para "dürfen, der sie"
	line "gut behandelt."
	done

ManiaText_ShuckleIsYourLastMon:
	text "Wenn ich mein"
	line "#MON zurück-"
	cont "nehme, wer soll"
	cont "für dich kämpfen?"
	done

ManiasHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
