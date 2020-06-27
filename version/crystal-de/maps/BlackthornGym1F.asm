INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUY


SECTION "maps/BlackthornGym1F", ROMX

BlackthornGym1F_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Boulders

.Boulders:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	return

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuyWinScript
	writetext BlackthornGymGuyText
	waitbutton
	closetext
	end

.BlackthornGymGuyWinScript:
	writetext BlackthornGymGuyWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd gymstatue2

ClairIntroText:
	text "Ich bin SANDRA."

	para "Der beste Drachen-"
	line "meister der Welt."

	para "Ich bestehe sogar"
	line "gegen die TOP VIER"
	cont "der #MON LIGA."

	para "Willst du immer"
	line "noch gegen mich"
	cont "antreten?"

	para "…Gut."
	line "Auf geht's!"

	para "Da ich eine ARENA-"
	line "LEITERIN bin,"

	para "bringe ich mein"
	line "ganzes Können ge-"
	cont "gen jeden Gegner"
	cont "auf!"
	done

ClairWinText:
	text "Ich habe verloren?"

	para "Ich kann es nicht"
	line "glauben. Das muss"
	cont "ein Irrtum sein…"
	done

ClairText_GoToDragonsDen:
	text "Ich gestehe das"
	line "nicht ein."

	para "Ich mag verloren"
	line "haben, aber du"

	para "bist noch nicht"
	line "reif für die"
	cont "#MON LIGA."

	para "Ich weiß. Stelle"
	line "dich der Drachen-"
	cont "Trainer-Heraus-"
	cont "forderung."

	para "Hinter der PKMN-"
	line "ARENA liegt die"
	cont "DRACHENHÖHLE."

	para "In deren Mitte ist"
	line "ein Schrein. Gehe"
	cont "dorthin."

	para "Falls du beweisen"
	line "kannst, dass du"

	para "deine faulen"
	line "Ideale aufgegeben"

	para "hast, werde ich"
	line "dich als einen"

	para "Trainer ansehen,"
	line "der würdig ist,"

	para "einen ORDEN"
	line "zu erhalten!"
	done

ClairText_TooMuchToExpect:
	text "Was ist los?"

	para "Erwarte ich etwa"
	line "zu viel von dir?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "Du hast mich war-"
	line "ten lassen!"

	para "Hier! Nimm dies!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> erhält"
	line "TM24."
	done

BlackthornGymClairText_DescribeTM24:
	text "Sie enthält"
	line "FEUERODEM."

	para "Nein, das hat"
	line "nichts mit"
	cont "schlechtem Atem"
	cont "zu tun."

	para "Wenn du sie nicht"
	line "willst, musst du"
	cont "sie nicht nehmen."
	done

BlackthornGymClairText_BagFull:
	text "Was ist das? Du"
	line "hast keinen Platz?"
	done

BlackthornGymClairText_League:
	text "Was ist los?"

	para "Gehst du nicht zur"
	line "#MON LIGA?"

	para "Kennst du den"
	line "Weg nicht?"

	para "Gehe von hier nach"
	line "NEUBORKIA."

	para "SURFE dann nach"
	line "Osten. Der Weg"

	para "wird dann sehr be-"
	line "schwerlich."

	para "Wage es nicht, in"
	line "der #MON"
	cont "LIGA zu verlieren!"

	para "Das würde meine"
	line "Niederlage gegen"

	para "dich noch ver-"
	line "schlimmern!"

	para "Gib dein Bestes!"
	done

CooltrainermPaulSeenText:
	text "Ist das dein ers-"
	line "ter Kampf gegen"
	cont "Drachen?"

	para "Ich zeige dir, wie"
	line "stark sie sind!"
	done

CooltrainermPaulBeatenText:
	text "Mein Drachen-"
	line "#MON hat"
	cont "verloren?"
	done

CooltrainermPaulAfterBattleText:
	text "SIEGFRIED sagte"
	line "dir, er möchte"

	para "dich noch einmal"
	line "sehen? Das kann"
	cont "nicht sein!"
	done

CooltrainermMikeSeenText:
	text "Die Chancen, gegen"
	line "dich zu verlieren?"
	cont "Nicht mal ein Pro-"
	cont "zent!"
	done

CooltrainermMikeBeatenText:
	text "Hm, eigenartig."
	done

CooltrainermMikeAfterBattleText:
	text "Ich kenne jetzt"
	line "meine Schwachstel-"
	cont "len. Danke für den"
	cont "Hinweis!"
	done

CooltrainerfLolaSeenText:
	text "Drachen sind hei-"
	line "lige #MON."

	para "Sie sind voller"
	line "Lebensenergie."

	para "Wenn du es nicht"
	line "ernst meinst, dann"

	para "wirst du sie nicht"
	line "besiegen können."
	done

CooltrainerfLolaBeatenText:
	text "Großartig!"
	done

CooltrainerfLolaAfterBattleText:
	text "Drachen sind"
	line "schwach gegen Dra-"
	cont "chen-Attacken."
	done

BlackthornGymGuyText:
	text "Yo! CHAMP in spe!"

	para "Es war eine lange"
	line "Reise, aber bald"

	para "sind wir da! Zähle"
	line "auf mich!"

	para "SANDRA setzt die"
	line "mythischen und"
	cont "heiligen"
	cont "Drachen-#MON"
	cont "ein."

	para "So leicht sind die"
	line "nicht zu besiegen."

	para "Aber angeblich"
	line "sind sie anfällig"

	para "gegen Eis-"
	line "Attacken."
	done

BlackthornGymGuyWinText:
	text "Gegen SANDRA zu"
	line "gewinnen ist eine"
	cont "Meisterleistung."

	para "Alles was dir nun"
	line "noch bevorsteht,"
	cont "ist die #MON"
	cont "LIGA."

	para "Du bist auf dem"
	line "besten Weg, der"
	cont "#MON-CHAMP"
	cont "zu werden!"
	done

BlackthornGym1F_MapEvents::
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	db 5 ; object events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
