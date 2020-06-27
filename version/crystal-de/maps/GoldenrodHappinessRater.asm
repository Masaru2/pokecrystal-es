INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const GOLDENRODHAPPINESSRATER_TEACHER
	const GOLDENRODHAPPINESSRATER_POKEFAN_M
	const GOLDENRODHAPPINESSRATER_TWIN


SECTION "maps/GoldenrodHappinessRater", ROMX

GoldenrodHappinessRater_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	promptbutton
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	sjump .LooksMean

.LovesYouALot:
	writetext GoldenrodHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext GoldenrodHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext GoldenrodHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext GoldenrodHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext GoldenrodHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext GoldenrodHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

GoldenrodHappinessRaterPokefanMScript:
	jumptextfaceplayer GoldenrodHappinessRaterPokefanMText

GoldenrodHappinessRaterTwinScript:
	jumptextfaceplayer GoldenrodHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd difficultbookshelf

HappinessRatersHouseRadio:
	jumpstd radio2

GoldenrodHappinessRaterTeacherText:
	text "Behandelst du"
	line "deine #MON gut,"

	para "werden sie dich"
	line "regelrecht lieben."

	para "Oh! Lass mich dein"
	line "@"
	text_ram wStringBuffer3
	text " sehen…"
	done

GoldenrodHappinessRatingText_LovesYouALot:
	text "Es sieht sehr"
	line "glücklich aus! Es"
	cont "muss dich sehr"
	cont "gern haben."
	done

GoldenrodHappinessRatingText_ReallyTrustsYou:
	text "Ich habe den Ein-"
	line "druck, dass es dir"
	cont "wirklich vertraut."
	done

GoldenrodHappinessRatingText_SortOfHappy:
	text "Es verhält sich"
	line "dir gegenüber sehr"
	cont "freundlich. Es"
	cont "muss glücklich"
	cont "sein."
	done

GoldenrodHappinessRatingText_QuiteCute:
	text "Es ist sehr süß."
	done

GoldenrodHappinessRatingText_NotUsedToYou:
	text "Du solltest es"
	line "besser behandeln."
	cont "Es hat sich noch"
	cont "nicht an dich ge-"
	cont "wöhnt."
	done

GoldenrodHappinessRatingText_LooksMean:
	text "Es scheint dich"
	line "gar nicht zu mö-"
	cont "gen. Es sieht ge-"
	cont "mein aus."
	done

GoldenrodHappinessRaterPokefanMText:
	text "Ständig verliere"
	line "ich in Kämpfen und"

	para "meine #MON"
	line "werden immer be-"
	cont "siegt…"

	para "Das mag der Grund"
	line "sein, warum mich"
	cont "meine #MON"
	cont "nicht mögen…"
	done

GoldenrodHappinessRaterTwinText:
	text "Wenn ich meinem"
	line "#MON ein Item"
	cont "gebe, dann freut"
	cont "es sich!"
	done

GoldenrodHappinessRater_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 3
	warp_event  3,  7, GOLDENROD_CITY, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, HappinessRatersHouseRadio

	db 3 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterPokefanMScript, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTwinScript, -1
