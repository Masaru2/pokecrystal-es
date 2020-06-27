INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const POKEMONFANCLUB_CHAIRMAN
	const POKEMONFANCLUB_RECEPTIONIST
	const POKEMONFANCLUB_CLEFAIRY_GUY
	const POKEMONFANCLUB_TEACHER
	const POKEMONFANCLUB_FAIRY
	const POKEMONFANCLUB_ODDISH


SECTION "maps/PokemonFanClub", ROMX

PokemonFanClub_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonFanClubChairmanScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue .HeardSpeech
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue .HeardSpeechButBagFull
	writetext PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText
	yesorno
	iffalse .NotListening
	writetext PokemonFanClubChairmanRapidashText
	promptbutton
.HeardSpeechButBagFull:
	writetext PokemonFanClubChairmanIWantYouToHaveThisText
	promptbutton
	verbosegiveitem RARE_CANDY
	iffalse .BagFull
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext PokemonFanClubChairmanItsARareCandyText
	waitbutton
	closetext
	end

.HeardSpeech:
	writetext PokemonFanClubChairmanMoreTalesToTellText
	waitbutton
	closetext
	end

.NotListening:
	writetext PokemonFanClubChairmanHowDisappointingText
	waitbutton
.BagFull:
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

PokemonFanClubClefairyGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue .GotLostItem
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .FoundClefairyDoll
	writetext PokemonFanClubClefairyGuyClefairyIsSoAdorableText
	waitbutton
	closetext
	end

.FoundClefairyDoll:
	writetext PokemonFanClubClefairyGuyMakingDoWithADollIFoundText
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue .MetCopycat
	waitbutton
	closetext
	end

.MetCopycat:
	promptbutton
	writetext PokemonFanClubClefairyGuyTakeThisDollBackToGirlText
	promptbutton
	waitsfx
	giveitem LOST_ITEM
	iffalse .NoRoom
	disappear POKEMONFANCLUB_FAIRY
	writetext PokemonFanClubPlayerReceivedDollText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	closetext
	end

.GotLostItem:
	writetext PokemonFanClubClefairyGuyGoingToGetARealClefairyText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PokemonFanClubClefairyGuyPackIsJammedFullText
	waitbutton
	closetext
	end

PokemonFanClubTeacherScript:
	jumptextfaceplayer PokemonFanClubTeacherText

PokemonFanClubClefairyDollScript:
	jumptext PokemonFanClubClefairyDollText

PokemonFanClubBayleefScript:
	opentext
	writetext PokemonFanClubBayleefText
	cry BAYLEEF
	waitbutton
	closetext
	end

PokemonFanClubListenSign:
	jumptext PokemonFanClubListenSignText

PokemonFanClubBraggingSign:
	jumptext PokemonFanClubBraggingSignText

PokemonFanClubChairmanDidYouVisitToHearAboutMyMonText:
	text "Ich bin der"
	line "VORSITZENDE des"
	cont "#MON-FANCLUB."

	para "Ich habe über"
	line "150 #MON"
	cont "aufgezogen."

	para "Ich bin sehr "
	line "kleinlich, was"
	cont "#MON betrifft."

	para "Bist du extra"
	line "hierher gekommen,"
	cont "um etwas über"
	cont "meine #MON zu"
	cont "erfahren?"
	done

PokemonFanClubChairmanRapidashText:
	text "Sehr schön!"
	line "Dann hör gut zu!"

	para "Also… am liebsten"
	line "habe ich GALLOPA…"

	para "Es ist… süß… lieb…"
	line "klug… anmutig…"
	cont "und… wunderbar…"
	cont "nicht wahr?…"
	cont "Zu sehr… wild…"
	cont "schön… liebenswert"
	cont "…Ich verehre es!"

	para "Knuddle es… wenn…"
	line "es schläft… warm"
	cont "und weich… Oh, und"
	cont "sensationell…"
	cont "großartig… einfach"
	cont "göttlich…"
	cont "Ups! Wie die Zeit"
	cont "vergeht! Ich habe"
	cont "dich zu lange"
	cont "aufgehalten!"
	done

PokemonFanClubChairmanIWantYouToHaveThisText:
	text "Danke, dass du mir"
	line "so lange zugehört"
	cont "hast. Das möchte"
	cont "ich dir geben!"
	done

PokemonFanClubChairmanItsARareCandyText:
	text "Das SONDERBONBON"
	line "macht #MON"
	cont "stärker."

	para "Meine #MON"
	line "sollen lieber"

	para "durch ihre Kämpfe"
	line "stärker werden. Du"
	cont "kannst es haben."
	done

PokemonFanClubChairmanMoreTalesToTellText:
	text "Hallo, <PLAY_G>!"

	para "Besuchst du mich"
	line "wieder wegen"
	cont "meiner #MON?"

	para "Nein? Oh… Ich"
	line "hätte noch so"
	cont "viele Geschichten…"
	done

PokemonFanClubChairmanHowDisappointingText:
	text "Schade…"

	para "Komm wieder, wenn"
	line "du mehr"

	para "Geschichten hören"
	line "möchtest."
	done

PokemonFanClubReceptionistText:
	text "Unser VORSITZENDER"
	line "ist sehr redselig"
	cont "in Bezug auf #-"
	cont "MON…"
	done

PokemonFanClubClefairyGuyClefairyIsSoAdorableText:
	text "Ich liebe es, wie"
	line "PIEPI mit seinem"

	para "Finger wackelt,"
	line "wenn es METRONOM"

	para "anwendet."
	line "Entzückend!"
	done

PokemonFanClubClefairyGuyMakingDoWithADollIFoundText:
	text "Ich mag PIEPI,"
	line "aber ich könnte"

	para "nie eines fangen."
	line "Die #PUPPE,"

	para "die ich fand, muss"
	line "mir genügen."
	done

PokemonFanClubClefairyGuyTakeThisDollBackToGirlText:
	text "Ah, jetzt verstehe"
	line "ich. Das Mädchen,"

	para "das diese #-"
	line "PUPPE verloren"
	cont "hat, ist traurig…"

	para "Könntest du dann"
	line "die #PUPPE"

	para "zu diesem armen,"
	line "kleinen Mädchen"
	cont "zurückbringen?"

	para "Eines Tages werde"
	line "ich mich mit einem"

	para "echten PIEPI an-"
	line "freunden. Keine"
	cont "Bange!"
	done

PokemonFanClubPlayerReceivedDollText:
	text "<PLAYER> erhält"
	line "#PUPPE."
	done

PokemonFanClubClefairyGuyGoingToGetARealClefairyText:
	text "Du wirst schon"
	line "sehen. Ich freunde"

	para "mich noch mit"
	line "einem echten"
	cont "PIEPI an."
	done

PokemonFanClubClefairyGuyPackIsJammedFullText:
	text "Dein BEUTEL ist"
	line "voll."
	done

PokemonFanClubTeacherText:
	text "Schau dir mein"
	line "süßes LORBLATT an!"

	para "Das Blatt auf"
	line "seinem Kopf ist so"
	cont "goldig!"
	done

PokemonFanClubClefairyDollText:
	text "Das ist ein"
	line "PIEPI! Was?"

	para "Ach so! Das ist"
	line "eine #PUPPE"
	cont "von PIEPI."
	done

PokemonFanClubBayleefText:
	text "LORBLATT: Bla,"
	line "blatt!"
	done

PokemonFanClubListenSignText:
	text "Anderen Trainern"
	line "hören wir höflich"
	cont "zu."
	done

PokemonFanClubBraggingSignText:
	text "Wenn jemand"
	line "prahlt, wird"

	para "sofort zurück-"
	line "geprahlt!"
	done

PokemonFanClub_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 3
	warp_event  3,  7, VERMILION_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  0, BGEVENT_READ, PokemonFanClubListenSign
	bg_event  9,  0, BGEVENT_READ, PokemonFanClubBraggingSign

	db 6 ; object events
	object_event  3,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubChairmanScript, -1
	object_event  4,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyGuyScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubTeacherScript, -1
	object_event  2,  4, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubClefairyDollScript, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event  7,  3, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubBayleefScript, -1
