INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST


SECTION "maps/RadioTower2F", ROMX

RadioTower2F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	readvar VAR_HOUR
	ifless 18, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower2FBuenaEveryoneSayPasswordText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	refreshscreen
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext RadioTower2FBuenaCorrectAnswerText
	waitbutton
	closetext
	readvar VAR_BLUECARDBALANCE
	addval 1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	promptbutton
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext RadioTower2FBuenaDidYouForgetText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext RadioTower2FBuenaPasswordIsHelpText
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	promptbutton
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	promptbutton
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd magazinebookshelf

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower2FSuperNerdText:
	text "Du kannst überall"
	line "Radio hören."
	cont "Probier's mal aus!"
	done

RadioTower2FTeacherText:
	text "Wenn #MON"
	line "Schlaflieder im"
	cont "Radio hören, "
	cont "schlafen sie ein."
	done

RadioTower2FTeacherText_Rockets:
	text "Warum möchten sie"
	line "den RADIOTURM"
	cont "besetzen?"
	done

RadioTowerJigglypuffText:
	text "PUMMELUFF:"
	line "Pummel…"
	done

RadioTower2FBlackBelt1Text:
	text "Zutritt nur für"
	line "autorisiertes"
	cont "Personal."

	para "Das war nicht"
	line "immer so."

	para "Mit unserem"
	line "INTENDANTEN stimmt"
	cont "irgendetwas nicht…"
	done

RadioTower2FBlackBelt2Text:
	text "Schau dich in"
	line "Ruhe um."

	para "Der INTENDANT ist"
	line "wieder nett. So,"
	cont "wie er früher war."
	done

GruntM4SeenText:
	text "Vor drei Jahren"
	line "war das TEAM"
	cont "ROCKET gezwungen,"
	cont "sich aufzulösen."

	para "Wir arbeiten hier"
	line "gerade an einem"
	cont "Comeback!"
	done

GruntM4BeatenText:
	text "Pah! Keine Zeit"
	line "für Sentimenta-"
	cont "litäten!"
	done

GruntM4AfterBattleText:
	text "Wir lassen es"
	line "nicht zu, dass du"
	cont "unsere Pläne"
	cont "durchkreuzt!"
	done

GruntM5SeenText:
	text "Wir sind TEAM"
	line "ROCKET, die #-"
	cont "MON-Ausbeuter!"

	para "Wir lieben es,"
	line "Böses zu tun! "
	cont "Hast du Angst?"
	done

GruntM5BeatenText:
	text "Du glaubst, du"
	line "bist ein Held?"
	done

GruntM5AfterBattleText:
	text "Wir sind nicht"
	line "immer böse. Wir"
	cont "tun nur, wonach"
	cont "uns ist."
	done

GruntM6SeenText:
	text "Hey! Halte dich"
	line "aus unseren Ange-"
	cont "legenheiten raus!"
	done

GruntM6BeatenText:
	text "Uff. Ich gebe auf."
	done

GruntM6AfterBattleText:
	text "Unsere VORSTÄNDE"
	line "wollen die Macht"
	cont "an sich reißen."

	para "Sie haben Großes"
	line "vor. Ich frage"
	cont "mich, was das"
	cont "wohl ist?"
	done

GruntF2SeenText:
	text "Hahaha!"

	para "Wie langweilig."
	line "Es war viel zu"

	para "leicht, hier das"
	line "Ruder zu"
	cont "übernehmen!"

	para "Komm schon!"
	line "Heitere mich auf!"
	done

GruntF2BeatenText:
	text "We-Wer bist du?"
	done

GruntF2AfterBattleText:
	text "Du hast mich"
	line "besiegt. Das werde"
	cont "ich nicht"
	cont "vergessen!"
	done

RadioTower2FBuenaShowIntroductionText:
	text "BUENA: Hi! Ich bin"
	line "BUENA!"

	para "Hast du schon von"
	line "der Radiosendung"
	cont "PASSWORT gehört?"

	para "Wenn du mir das"
	line "Passwort aus der"

	para "Sendung nennen"
	line "kannst, erhältst"
	cont "du Punkte."

	para "Sammle die Punkte"
	line "und tausche sie"

	para "bei diesem netten"
	line "Mädchen da drüben"

	para "gegen einen Preis"
	line "deiner Wahl ein!"

	para "Bitte schön!"

	para "Das ist deine ei-"
	line "gene Punktekarte!"
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "BUENA: Höre dir"
	line "meine PASSWORT-"
	cont "SENDUNG an!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "BUENA: Hi!"
	line "Hast du meine Sen-"
	cont "dung gehört?"

	para "Kannst du dich an"
	line "das Passwort von"
	cont "heute erinnern?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "BUENA: Oh, wow!"
	line "Danke!"

	para "Wie war dein Name"
	line "doch gleich?"

	para "…<PLAY_G>, O.K.!"

	para "Auf, <PLAY_G>."
	line "Mach bei der"
	cont "Sendung mit!"
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "BUENA: Alle"
	line "fertig?"

	para "Schreit das heuti-"
	line "ge Passwort für"

	para "<PLAY_G>"
	line "laut heraus!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "BUENA: Hör dir die"
	line "Sendung an und"

	para "komme dann wieder!"
	line "Bis später!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "BUENA: Sorry…"

	para "Du hast pro Tag"
	line "nur einen Versuch."

	para "Probiere morgen"
	line "wieder dein Glück!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "BUENA: Juhuu!"
	line "Das ist richtig!"

	para "Du hast zugehört!"
	line "Ich bin glücklich!"

	para "Du hast dir einen"
	line "Punkt verdient!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "BUENA: Argh…"
	line "Das ist falsch…"

	para "Hast du das Pass-"
	line "wort vergessen?"
	done

RadioTower2FBuenaThanksForComingText:
	text "BUENA: Yo!"
	line "<PLAY_G>"

	para "hat teilgenommen."
	line "Danke dafür!"

	para "Ich hoffe, dass"
	line "alle Zuhörer auch"

	para "teilnehmen!"
	line "Ich warte!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "BUENA: Huh? Das"
	line "heutige Passwort?"

	para "HILFE, natürlich!"
	done

RadioTower2FBuenaCardIsFullText:
	text "BUENA: Deine BLAUE"
	line "KARTE ist voll."

	para "Hol dir einen fan-"
	line "tastischen Preis!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "BUENA: Hört die"
	line "PASSWORTSENDUNG"

	para "täglich von sechs"
	line "bis Mitternacht!"

	para "Hört zu und"
	line "besucht mich dann!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "BUENA: Oh? Du hast"
	line "deine BLAUE KARTE"
	cont "vergessen?"

	para "Ich kann dir keine"
	line "Punkte geben, wenn"
	cont "du sie nicht hast."
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "BUENA: Oh! Du hast"
	line "30 Punkte auf dei-"
	cont "ner BLAUEN KARTE!"
	cont "Das ist toll!"

	para "Hmm… Es gibt zwar"
	line "keinen Preis für"
	cont "das Erreichen von"
	cont "30 Punkten, aber…"

	para "Du hast mich so"
	line "oft besucht,"

	para "<PLAY_G>. Ich"
	line "mache dir ein spe-"
	cont "zielles Angebot!"

	para "Möchtest du meine"
	line "Telefonnummer?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "BUENA: <PLAY_G>,"
	line "möchtest du meine"

	para "Telefonnummer"
	line "haben?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> speichert"
	line "BUENAs Nummer."
	done

RadioTower2FBuenaCallMeText:
	text "BUENA: Ich freue"
	line "mich auf deinen"
	cont "Anruf!"
	done

RadioTower2FBuenaSadRejectedText:
	text "BUENA: Argh… Ein"
	line "Spezialpreis…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "BUENA: <PLAY_G>,"
	line "In deinem Nummern-"
	cont "speicher ist kein"
	cont "Platz für mich…"
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text "Du kannst deine"
	line "gesammelten Punkte"

	para "gegen einen Preis"
	line "deiner Wahl"
	cont "eintauschen!"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "Ohne deine BLAUE"
	line "KARTE kannst du"
	cont "keine Punkte"
	cont "eintauschen."

	para "Vergiss deine"
	line "BLAUE KARTE nicht!"
	done

RadioTower2FSalesSignText:
	text "1S VERKAUF"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "PROF. EICHs #-"
	line "MON-TALK"

	para "Die beste Show"
	line "am Äther!"
	done

RadioTower2FPokemonRadioSignText:
	text "Überall, jederzeit"
	line "#MON Radio"
	done

RadioTower2F_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 6 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 11 ; object events
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event 14,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
