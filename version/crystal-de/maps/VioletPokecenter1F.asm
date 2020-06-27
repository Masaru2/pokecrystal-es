INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE


SECTION "maps/VioletPokecenter1F", ROMX

VioletPokecenter1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

VioletPokecenterNurse:
	jumpstd pokecenternurse

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, 5
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "EI@"

.AideGivesEgg:
	jumpstd receivetogepiegg
	end

.PartyFull:
	writetext VioletCityElmsAideFullPartyText
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext VioletPokecenterElmsAideRefuseText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	text "<PLAY_G>, lange"
	line "nicht gesehen."

	para "PROF. LIND hat"
	line "mich gebeten, nach"
	cont "dir zu suchen."

	para "Er hat noch eine"
	line "Bitte an dich."

	para "Nimm bitte das"
	line "#MON-EI!"
	done

VioletPokecenterElmsAideGiveEggText:
	text "Wir haben ent-"
	line "deckt, dass ein"

	para "#MON erst"
	line "schlüpft, nachdem"

	para "es im EI gewachsen"
	line "ist."

	para "Außerdem muss es"
	line "sich in der Nähe"

	para "anderer #MON"
	line "befinden, um zu"
	cont "schlüpfen."

	para "<PLAY_G>, du bist"
	line "die einzige Per-"
	cont "son, auf die wir"

	para "uns verlassen"
	line "können."

	para "Bitte ruf PROF."
	line "LIND an, wenn das"
	cont "EI so weit ist!"
	done

VioletCityElmsAideFullPartyText:
	text "Oh, du hast keinen"
	line "Platz mehr für ein"
	cont "weiteres #MON."

	para "Ich warte hier,"
	line "bis du Platz für"
	cont "das EI geschaffen"
	cont "hast."
	done

VioletPokecenterElmsAideRefuseText:
	text "A-Aber… PROF."
	line "LIND hat nach dir"
	cont "gefragt…"
	done

VioletPokecenterElmsAideAskEggText:
	text "<PLAY_G>, nimmst du"
	line "das EI?"
	done

; unused
VioletPokecenterFarawayLinkText:
	text "Ich denke, es wäre"
	line "wunderbar, wenn"

	para "ich mit meinen"
	line "Freunden, die weit"

	para "entfernt wohnen,"
	line "via Link-Kabel"
	cont "kämpfen könnte."
	done

; unused
VioletPokecenterMobileAdapterText:
	text_start
	done

VioletPokecenter1FGameboyKidText:
	text "Ein Kerl namens"
	line "BILL hat das"

	para "#MON-PC-LAGE-"
	line "RUNGS-SYSTEM"

	para "erfunden."
	done

VioletPokecenter1FGentlemanText:
	text "Es war vor etwa"
	line "drei Jahren."

	para "TEAM ROCKET hatte"
	line "etwas Übles mit"
	cont "den #MON vor."

	para "Aber die Gerech-"
	line "tigkeit hat ge-"
	cont "siegt! Ein junger"
	cont "Trainer hat sie"
	cont "zerschlagen."
	done

VioletPokecenter1FYoungsterText:
	text "#MON sind"
	line "schlau. Sie gehor-"
	cont "chen nur Trainern,"
	cont "vor denen sie auch"
	cont "Respekt haben."

	para "Hat der Trainer"
	line "nicht genug ORDEN,"

	para "machen sie, was"
	line "sie wollen."
	done

VioletPokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
