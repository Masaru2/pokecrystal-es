INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER


SECTION "maps/ViridianCity", ROMX

ViridianCity_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	return

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd pokecentersign

ViridianCityMartSign:
	jumpstd martsign

ViridianCityCoffeeGrampsQuestionText:
	text "He, Kurzbein! Ich"
	line "hatte gerade einen"

	para "doppelten Espresso"
	line "und ich bin"
	cont "total aufgedreht!"

	para "Ich brauche jetzt"
	line "jemanden zum"
	cont "Reden und zwar"
	cont "dich!"

	para "Man sieht es mir"
	line "jetzt vielleicht"

	para "nicht mehr an,"
	line "aber ich war ein"
	cont "Experte im Fangen"
	cont "von #MON."

	para "Glaubst du mir?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Also gut. Ja, ich"
	line "war wirklich etwas"

	para "Besonderes, das"
	line "kann ich dir"
	cont "sagen!"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "Was? Du kleiner"
	line "Frechdachs!"

	para "Wenn ich etwas"
	line "jünger wäre, würde"

	para "ich dir schon das"
	line "eine oder andere"
	cont "zeigen! Grummel."
	done

ViridianCityGrampsNearGymText:
	text "Bis vor kurzem"
	line "gab es in dieser"
	cont "PKMN-ARENA"
	cont "keinen LEITER."

	para "Ein junger Mann"
	line "aus ALABASTIA ist"

	para "hier der LEITER"
	line "geworden, aber er"
	cont "ist oft unterwegs."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Wirst du den"
	line "ARENALEITER"
	cont "herausfordern?"

	para "Viel Glück! Du"
	line "wirst es brauchen."
	done

ViridianCityDreamEaterFisherText:
	text "Gähn!"

	para "Ich bin wohl in"
	line "der Sonne"
	cont "eingeschlafen."

	para "…Ich hatte diesen"
	line "Traum von einem"

	para "TRAUMATO, das"
	line "meinen Traum"

	para "fressen wollte."
	line "Das ist doch"

	para "merkwürdig,"
	line "nicht wahr?"

	para "Nanu!"
	line "Was ist das?"

	para "Wo ist diese TM"
	line "hergekommen?"

	para "Unheimlich!"
	line "Hier, du kannst"
	cont "die TM behalten."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "TM42 enthält"
	line "TRAUMFRESSER…"

	para "…Zzzzz…"
	done

ViridianCityYoungsterText:
	text "Ich habe gehört,"
	line "dass man viele"

	para "Items im VERTANIA-"
	line "WALD findet."
	done

ViridianCitySignText:
	text "VERTANIA CITY"

	para "Das Immergrüne"
	line "Paradies"
	done

ViridianGymSignText:
	text "PKMN-ARENA von"
	line "VERTANIA CITY"
	cont "LEITUNG: …"

	para "Der Rest des Tex-"
	line "tes ist unlesbar…"
	done

ViridianCityWelcomeSignText:
	text "Willkommen in"
	line "VERTANIA CITY,"

	para "dem Tor zum"
	line "INDIGO PLATEAU"
	done

TrainerHouseSignText:
	text "TRAINER-HAUS"

	para "Der Club, in dem"
	line "Top-Trainer"
	cont "kämpfen"
	done

ViridianCity_MapEvents::
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	db 4 ; object events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
