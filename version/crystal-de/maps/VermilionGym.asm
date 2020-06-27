INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUY


SECTION "maps/VermilionGym", ROMX

VermilionGym_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	writetext VermilionGymGuyText
	waitbutton
	closetext
	end

.VermilionGymGuyWinScript:
	writetext VermilionGymGuyWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd gymstatue2

LtSurgeIntroText:
	text "MAJOR BOB: Heh, du"
	line "Windelpupser!"

	para "Das muss ich dir"
	line "lassen. Es ist"

	para "nicht sehr weise,"
	line "mich herauszufor-"
	cont "dern, aber es ist"
	cont "mutig!"

	para "Wenn es um"
	line "Elektro-#MON"
	cont "geht, bin ich die"
	cont "Nummer eins!"

	para "Ich habe das"
	line "Schlachtfeld nie"

	para "als Verlierer"
	line "verlassen."

	para "Ich grille dich,"
	line "wie ich es mit"

	para "meinen Feinden im"
	line "Krieg tat!"
	done

LtSurgeWinLossText:
	text "MAJOR BOB: Arrrgh!"
	line "Du bist stark!"

	para "O.K., Wicht. Du"
	line "erhältst den"
	cont "DONNERORDEN!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> erhält"
	line "DONNERORDEN."
	done

LtSurgeThunderBadgeText:
	text "MAJOR BOB: Der"
	line "DONNERORDEN erhöht"

	para "den INIT-Wert"
	line "deiner #MON."

	para "Du darfst stolz"
	line "darauf sein, mich"

	para "besiegt zu haben,"
	line "hörst du?"
	done

LtSurgeFightDoneText:
	text "MAJOR BOB: Zwerg!"
	line "Immer noch bei"
	cont "der Sache?"

	para "Meine #MON und"
	line "ich sind noch"
	cont "dabei!"
	done

GentlemanGregorySeenText:
	text "Du willst MAJOR"
	line "BOB besiegen?"

	para "Da musst du erst"
	line "an mir vorbei!"
	done

GentlemanGregoryBeatenText:
	text "Ich habe versagt,"
	line "MAJOR BOB. Es tut"
	cont "mir Leid!"
	done

GentlemanGregoryAfterBattleText:
	text "Als ich noch bei"
	line "der Armee war, hat"

	para "MAJOR BOB mein"
	line "Leben gerettet."
	done

GuitaristVincentSeenText:
	text "MAJOR BOB hat mein"
	line "Talent für"

	para "Elektro-#MON"
	line "erkannt."

	para "Glaubst du, du"
	line "kannst mich"
	cont "besiegen?"
	done

GuitaristVincentBeatenText:
	text "Oh, wie"
	line "schockierend!"
	done

GuitaristVincentAfterBattleText:
	text "Wenn die Fallen"
	line "der Trainer"

	para "funktionieren"
	line "würden, wärst du"

	para "schon längst"
	line "hinüber…"
	done

JugglerHortonSeenText:
	text "Ich werde dich"
	line "fertig machen! Du"
	cont "wirst gleich einen"
	cont "Schlag bekommen!"
	done

JugglerHortonBeatenText:
	text "Ahh! Ich stand zu"
	line "sehr unter Strom…"
	done

JugglerHortonAfterBattleText:
	text "Lass dir den Sieg"
	line "über mich nicht zu"

	para "Kopf steigen…"
	line "MAJOR BOB ist"
	cont "stark."
	done

VermilionGymGuyText:
	text "He! Du CHAMP"
	line "in spe!"

	para "Dieses Mal hattest"
	line "du Glück."

	para "MAJOR BOB ist sehr"
	line "vorsichtig. Er"

	para "hat überall in der"
	line "PKMN-ARENA Fallen"
	cont "aufgestellt."

	para "Aber, -- hihi --"
	line "die Fallen funk-"
	cont "tionieren nicht."

	para "Du wirst MAJOR BOB"
	line "problemlos"
	cont "erreichen."
	done

VermilionGymGuyWinText:
	text "Puh! Das war ein"
	line "elektrisierendes"
	cont "Erlebnis!"

	para "Das hat meine"
	line "Nerven sehr"
	cont "strapaziert."
	done

VermilionGymTrashCanText:
	text "Nein! Hier ist"
	line "nur Müll."
	done

VermilionGym_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	db 0 ; coord events

	db 17 ; bg events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	db 5 ; object events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuyScript, -1
