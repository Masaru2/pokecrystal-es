INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUY


SECTION "maps/SaffronGym", ROMX

SaffronGym_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuyWinScript
	writetext SaffronGymGuyText
	waitbutton
	closetext
	end

.SaffronGymGuyWinScript:
	writetext SaffronGymGuyWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd gymstatue2

SabrinaIntroText:
	text "SABRINA: Ich"
	line "wusste, dass du"
	cont "kommen würdest…"

	para "Vor drei Jahren"
	line "sah ich dich in"
	cont "einer Vision."

	para "Du willst meinen"
	line "ORDEN haben."

	para "Ich habe keine"
	line "Freude am Kämpfen,"

	para "aber als LEITERIN"
	line "ist es meine"

	para "Pflicht, all denen"
	line "einen ORDEN zu"

	para "geben, die sich"
	line "als würdig"
	cont "erwiesen haben."

	para "Da du es wünschst,"
	line "werde ich dir"
	cont "meine psychischen"
	cont "Kräfte zeigen!"
	done

SabrinaWinLossText:
	text "SABRINA: Deine"
	line "Stärke…"

	para "übertrifft meine"
	line "Vorahnungen bei"
	cont "weitem…"

	para "Vielleicht ist es"
	line "nicht möglich,"

	para "alles vorherzu-"
	line "sagen, was die"
	cont "Zukunft bringt…"

	para "Gut, du hast"
	line "dir den SUMPFORDEN"
	cont "verdient."
	done

ReceivedMarshBadgeText:
	text "<PLAYER> erhält"
	line "SUMPFORDEN."
	done

SabrinaMarshBadgeText:
	text "SABRINA: Der"
	line "SUMPFORDEN"

	para "aktiviert deine"
	line "unterbewussten"
	cont "Kräfte…"

	para "Obwohl ich nicht"
	line "in der Lage war,"
	cont "deine Stärke"
	cont "vorauszusehen,"
	cont "weiß ich das ganz"
	cont "sicher."

	para "Du wirst ein"
	line "gefeierter und"
	cont "beliebter CHAMP"
	cont "werden!"
	done

SabrinaFightDoneText:
	text "SABRINA: Deine Zu-"
	line "neigung zu deinen"

	para "#MON hat meine"
	line "Psychostärke"
	cont "übertroffen…"

	para "Die Kraft der"
	line "Liebe ist meiner"

	para "Ansicht nach auch"
	line "eine Art von"
	cont "Psychostärke…"
	done

MediumRebeccaSeenText:
	text "Die Kraft all"
	line "derer, die du"
	cont "besiegt hast,"
	cont "offenbart sich"
	cont "mir!"
	done

MediumRebeccaBeatenText:
	text "Stark…"
	line "Viel zu stark…"
	done

MediumRebeccaAfterBattleText:
	text "Woher kommt deine"
	line "Kraft?"
	done

PsychicFranklinSeenText:
	text "Psychische Stärke"
	line "ist die Kraft"
	cont "deiner Seele."
	done

PsychicFranklinBeatenText:
	text "Deine Seele ist"
	line "stärker als meine!"
	done

PsychicFranklinAfterBattleText:
	text "Du hast auch deine"
	line "Seele gestärkt,"
	cont "nicht nur deine"
	cont "Fähigkeiten."
	done

MediumDorisSeenText:
	text "Hehehehe…"
	line "Ich habe es"
	cont "deutlich vor mir."

	para "Ich kann in deine"
	line "Seele blicken!"
	done

MediumDorisBeatenText:
	text "Obwohl ich in dir"
	line "lesen kann, habe"
	cont "ich verloren…"
	done

MediumDorisAfterBattleText:
	text "Mist! Ich habe"
	line "vergessen, dass"
	cont "ich meine Nieder-"
	cont "lage gegen dich"
	cont "voraussah."
	done

PsychicJaredSeenText:
	text "Das KARATE DOJO"
	line "nebenan war früher"
	cont "die PKMN-ARENA der"
	cont "Stadt."
	done

PsychicJaredBeatenText:
	text "Ich war leicht"
	line "zu besiegen…"
	done

PsychicJaredAfterBattleText:
	text "Der KARATE-"
	line "MEISTER, Leiter"

	para "des KARATE DOJO,"
	line "ist gerade von"
	cont "SABRINA besiegt"
	cont "worden."
	done

SaffronGymGuyText:
	text "He! Ein CHAMP"
	line "in spe!"

	para "Ein Trainer"
	line "deines Kalibers"

	para "braucht sicher"
	line "keine Anweisung,"

	para "wie mit Psycho-"
	line "#MON umzugehen"
	cont "ist, nicht wahr?"

	para "Ich erwarte"
	line "Großes von dir!"

	para "Viel Glück!"
	done

SaffronGymGuyWinText:
	text "Das war wieder ein"
	line "fantastischer"
	cont "Kampf!"
	done

SaffronGym_MapEvents::
	db 0, 0 ; filler

	db 32 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	db 6 ; object events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuyScript, -1
