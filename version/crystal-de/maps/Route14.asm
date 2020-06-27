INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM


SECTION "maps/Route14", ROMX

Route14_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmTrevor:
	trainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrevorAfterBattleText
	waitbutton
	closetext
	end

PokefanmCarterSeenText:
	text "Eines kann ich dir"
	line "sagen! Es war"

	para "harte Arbeit, mei-"
	line "ne prämierten"
	cont "#MON zu fangen."
	done

PokefanmCarterBeatenText:
	text "Uaaaah!"
	done

PokefanmCarterAfterBattleText:
	text "SCHIGGY, GLUMANDA"
	line "und BISASAM…"

	para "Ich denke, das ist"
	line "ein ausgeglichenes"
	cont "Team."
	done

BirdKeeperRoySeenText:
	text "Ich träume davon,"
	line "mit meinen ge-"
	cont "liebten Vogel-"
	cont "#MON zu"
	cont "fliegen."
	done

BirdKeeperRoyBeatenText:
	text "Ich kann träumen,"
	line "aber ich kann"
	cont "nicht fliegen…"
	done

BirdKeeperRoyAfterBattleText:
	text "Du hast #MON,"
	line "welche die VM"

	para "FLIEGEN kennen?"
	line "Ich beneide dich."
	done

PokefanmTrevorSeenText:
	text "Hi. Wusstest du…,"

	para "dass #MON dich"
	line "mehr mögen, wenn"

	para "du sie an einem"
	line "ihnen bekannten"
	cont "Platz trainierst?"
	done

PokefanmTrevorBeatenText:
	text "Wo traf ich dieses"
	line "ENTON?"
	done

PokefanmTrevorAfterBattleText:
	text "Gäbe es doch einen"
	line "einfachen Weg, um"

	para "festzustellen, wo"
	line "ich meine"
	cont "#MON traf…"
	done

Route14_MapEvents::
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 11, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event  6, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmTrevor, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
