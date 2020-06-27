INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK


SECTION "maps/MrPokemonsHouse", ROMX

MrPokemonsHouse_MapScripts::
	db 2 ; scene scripts
	scene_script .MeetMrPokemon ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetMrPokemon:
	prioritysjump .MrPokemonEvent
	end

.DummyScene:
	end

.MrPokemonEvent:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_FINISHED
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "Hallo! Du musst"
	line "<PLAY_G> sein."

	para "PROF. LIND sagte,"
	line "dass du vorbei-"
	cont "kommen würdest."
	done

MrPokemonIntroText2:
	text "PROF. LIND soll"
	line "das hier unter-"
	cont "suchen."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> erhält"
	line "RÄTSEL-EI."
	done

MrPokemonIntroText3:
	text "Ich kenne ein"
	line "Paar, das eine"
	cont "#MON-PENSION "
	cont "leitet."

	para "Sie gaben mir"
	line "das EI."

	para "Ich war derart"
	line "fasziniert, dass"
	cont "ich PROF. LIND ei-"
	cont "ne E-Mail schrieb."

	para "Was die Entwick-"
	line "lung von #MON"
	cont "betrifft, ist"
	cont "PROF. LIND eine"
	cont "Kapazität."
	done

MrPokemonIntroText4:
	text "Sogar PROF. EICH"
	line "schätzt ihn sehr."
	done

MrPokemonIntroText5:
	text "Ich gehe davon"
	line "aus, dass PROF."
	cont "LIND mehr darüber"
	cont "weiß."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "Kehrst du zu PROF."
	line "LIND zurück?"

	para "Dein #MON"
	line "sieht müde aus."
	cont "Du solltest eine"
	cont "kurze Pause"
	cont "einlegen."
	done

MrPokemonText_ImDependingOnYou:
	text "Ich bin auf dich"
	line "angewiesen!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "Das Leben ist"
	line "schön! Es gibt"

	para "immer etwas Neues"
	line "zu entdecken!"
	done

MrPokemonsHouse_OakText1:
	text "EICH: Aha! Du bist"
	line "also <PLAY_G>!"

	para "Mein Name"
	line "ist PROF. EICH!"
	cont "Ich bin von Beruf"
	cont "#MON-Forscher."

	para "Ich besuche gerade"
	line "meinen alten"
	cont "Freund MR. #-"
	cont "MON."

	para "Ich hörte, du hast"
	line "etwas für PROF."

	para "LIND besorgt, also"
	line "habe ich gewartet."

	para "Oh! Was ist das?"
	line "Ein seltenes"
	cont "#MON!"

	para "Mal sehen…"

	para "Hm, ich verstehe!"

	para "Ich weiß, warum"
	line "PROF. LIND dir ein"

	para "#MON für die"
	line "Besorgung gab."

	para "Für Forscher wie"
	line "PROF. LIND und"

	para "mich sind #MON"
	line "unsere Freunde."

	para "Er erkannte, dass"
	line "du deine #MON"

	para "liebevoll und"
	line "umsichtig"
	cont "umsorgst."

	para "…Ah!"

	para "Du scheinst zuver-"
	line "lässig zu sein."

	para "Möchtest du mir"
	line "auch helfen?"

	para "Dies ist die"
	line "neueste Version"
	cont "des #DEX."

	para "Er erfaßt"
	line "automatisch Daten"

	para "über #MON,"
	line "die man gefangen"
	cont "oder gesehen hat!"

	para "Er ist eine Art"
	line "Hi-Tech-Lexikon!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> erhält"
	line "#DEX!"
	done

MrPokemonsHouse_OakText2:
	text "Triff auf viele"
	line "verschiedene #-"
	cont "MON und vervoll-"

	para "ständige den"
	line "#DEX!"

	para "Ich bin schon zu"
	line "lange hier."

	para "Ich muss nach"
	line "DUKATIA CITY zu"
	cont "meiner Radioshow."

	para "<PLAYER>, ich"
	line "zähle auf dich!"
	done

MrPokemonText_GimmeTheScale:
	text "Hm? Diese HAUT!"
	line "Was ist das?"
	cont "Ein rotes"
	cont "GARADOS?"

	para "Das ist selten!"
	line "Ich muss es haben…"

	para "<PLAY_G>, möchtest"
	line "du es tauschen?"

	para "Ich kann dir den"
	line "EP-TEILER, den mir"

	para "PROF. EICH gegeben"
	line "hat, anbieten."
	done

MrPokemonText_Disappointed:
	text "Wirklich schade!"
	line "Das gibt es nur"
	cont "selten."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "Das sind auslän-"
	line "dische Zeitungen."

	para "Ich kann die"
	line "Schlagzeilen"
	cont "nicht lesen…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "Dies ist ein"
	line "großer Computer."
	cont "Hm, er ist kaputt."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "Ein ganzer Stapel"
	line "seltsamer Münzen!"

	para "Vielleicht sind"
	line "sie aus einem"
	cont "anderen Land…"
	done

MrPokemonsHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	db 2 ; object events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
