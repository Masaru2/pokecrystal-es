INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE


SECTION "maps/CianwoodCity", ROMX

CianwoodCity_MapScripts::
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CIANWOODCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndSuicune

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_FOUGHT_EUSINE
	iffalse .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	return

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOTHING
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
	checkevent EVENT_FOUGHT_EUSINE
	iftrue .Done
	setevent EVENT_FOUGHT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	opentext
	writetext EusineSuicuneText
	waitbutton
	closetext
	winlosstext EusineBeatenText, 0
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext EusineAfterText
	waitbutton
	closetext
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special FadeOutMusic
	playmapmusic
	pause 10
.Done:
	end

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	promptbutton
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	promptbutton
	verbosegiveitem HM_FLY
	iffalse .Done
	setevent EVENT_GOT_HM02_FLY
	writetext ChucksWifeFlySpeechText
	promptbutton
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript:
; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd pokecentersign

CianwoodCityRock:
	jumpstd smashrock

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

CianwoodCitySuicuneApproachMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCitySuicuneDepartMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCityEusineApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

CianwoodCityEusineDepartMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ChucksWifeEasierToFlyText:
	text "Du hast das Meer"
	line "überquert, um"

	para "hierher zu kommen?"
	line "Das war sicher"
	cont "nicht einfach."

	para "Es wäre viel ein-"
	line "facher, wenn deine"

	para "#MON FLIEGEN"
	line "einsetzen könnten…"
	done

ChucksWifeBeatChuckText:
	text "Ohne den ORDEN"
	line "dieser Stadt ist"
	cont "FLIEGEN nutzlos."

	para "Wenn du den ARENA-"
	line "LEITER geschlagen"
	cont "hast, besuche mich"
	cont "wieder."

	para "Ich werde dir dann"
	line "ein Geschenk über-"
	cont "reichen."
	done

ChucksWifeGiveHMText:
	text "Das ist der ORDEN"
	line "der PKMN-ARENA von"
	cont "ANEMONIA CITY!"

	para "Dann soll dir"
	line "diese VM gehören."
	done

ChucksWifeFlySpeechText:
	text "Bring deinen #-"
	line "MON FLIEGEN bei."

	para "Du kannst dann so-"
	line "fort in jede Stadt"

	para "FLIEGEN, die du"
	line "bereits besucht"
	cont "hast."
	done

ChucksWifeChubbyText:
	text "Mein Mann hat ge-"
	line "gen dich verloren."
	cont "Also muss er här-"
	cont "ter trainieren."

	para "Das ist auch gut"
	line "so. Er hat in"
	cont "letzter Zeit etwas"
	cont "Speck angesetzt."
	done

CianwoodCityYoungsterText:
	text "Setzt du FLIEGEN"
	line "ein, kannst du di-"
	cont "rekt von hier aus"
	cont "nach OLIVIANA CITY"
	cont "reisen."
	done

CianwoodCityPokefanMText:
	text "Die Felsen nörd-"
	line "lich der Stadt"
	cont "können zerschmet-"
	cont "tert werden."

	para "Vielleicht findest"
	line "du etwas unter"
	cont "ihnen."

	para "Deine #MON"
	line "können ZERTRÜMME-"
	cont "RER einsetzen, um"
	cont "sie aus dem Weg zu"
	cont "räumen."
	done

CianwoodCityLassText:
	text "HARTWIG, der ARE-"
	line "NALEITER steigt"

	para "gerne mit seinen"
	line "#MON in den"
	cont "Ring."
	done

CianwoodCityUnusedText:
; unused
	text "Es gibt mehrere"
	line "Inseln zwischen"
	cont "hier und OLIVIANA"
	cont "CITY."

	para "Man sagt, dass"
	line "dort ein my-"
	cont "thisches Wesen"
	cont "leben soll."
	done

EusineSuicuneText:
	text "EUSIN: Yo,"
	line "<PLAYER>."

	para "War das eben nicht"
	line "SUICUNE?"

	para "Ich habe nur einen"
	line "Blick riskiert,"

	para "aber ich dachte,"
	line "ich hätte SUICUNE"

	para "auf den Wellen"
	line "rennen sehen."

	para "SUICUNE ist schön"
	line "und fabelhaft."

	para "Und es rennt durch"
	line "Städte und Straßen"

	para "mit wahnsinniger"
	line "Geschwindigkeit."

	para "Es ist wundervoll…"

	para "Ich möchte SUICUNE"
	line "von nahem sehen…"

	para "Ich habe mich"
	line "entschieden."

	para "Ich kämpfe wie ein"
	line "Trainer, um mir"

	para "SUICUNEs Respekt"
	line "zu verdienen!"

	para "Auf, <PLAYER>."
	line "Lass uns kämpfen!"
	done

EusineBeatenText:
	text "Ich hasse es, das"
	line "zuzugeben, aber du"
	cont "hast gewonnen."
	done

EusineAfterText:
	text "Du bist Wahnsinn,"
	line "<PLAYER>!"

	para "Darum sind dir"
	line "#MON so"
	cont "zugetan."

	para "Jetzt weiß ich's."

	para "Ich werde weiter"
	line "nach SUICUNE"
	cont "suchen."

	para "Ich bin sicher,"
	line "dass ich ihm eines"
	cont "Tages begegne."

	para "Man sieht sich!"
	done

CianwoodCitySignText:
	text "ANEMONIA CITY"

	para "Eine Hafenstadt"
	line "Umgeben von Stür-"
	cont "mischer See"
	done

CianwoodGymSignText:
	text "PKMN-ARENA von"
	line "ANEMONIA CITY"

	para "LEITUNG: HARTWIG"
	line "Er spricht durch"

	para "seine Fäuste"
	done

CianwoodPharmacySignText:
	text "500 Jahre voller"
	line "Tradition."

	para "APOTHEKE von"
	line "ANEMONIA CITY"

	para "Gerne erwarten wir"
	line "Ihre medizinischen"
	cont "Fragen"
	done

CianwoodPhotoStudioSignText:
	text "FOTOSTUDIO von"
	line "ANEMONIA CITY"

	para "Machen Sie einen"
	line "Schnappschuss zur"
	cont "Erinnerung!"
	done

CianwoodPokeSeerSignText:
	text "#-ORAKEL"
	line "VORAUS"
	done

CianwoodCity_MapEvents::
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, POKE_SEERS_HOUSE, 1

	db 1 ; coord events
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	db 8 ; bg events
	bg_event 20, 34, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 45, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 43, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 47, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 32, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 24, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event  4, 19, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 29, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	db 12 ; object events
	object_event 21, 37, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 14, 42, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event  8, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  9, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 46, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 11, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	object_event 10, 14, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
