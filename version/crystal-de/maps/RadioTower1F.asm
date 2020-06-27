INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const RADIOTOWER1F_RECEPTIONIST
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_LUCKYNUMBERMAN
	const RADIOTOWER1F_CARD_WOMAN


SECTION "maps/RadioTower1F", ROMX

RadioTower1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower1FReceptionistWelcomeText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower1FReceptionistNoToursText
	waitbutton
	closetext
	end

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	promptbutton
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext RadioTower1FLuckyNumberManThisWeeksIdIsText
	promptbutton
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	promptbutton
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	promptbutton
	special CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.GameOver:
	writetext RadioTower1FLuckyNumberManComeAgainText
	waitbutton
	closetext
	end

.FirstPlace:
	writetext RadioTower1FLuckyNumberManPerfectMatchText
	playsound SFX_1ST_PLACE
	waitsfx
	promptbutton
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext RadioTower1FLuckyNumberManOkayMatchText
	playsound SFX_2ND_PLACE
	waitsfx
	promptbutton
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext RadioTower1FLuckyNumberManWeakMatchText
	playsound SFX_3RD_PLACE
	waitsfx
	promptbutton
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText
	waitbutton
	closetext
	end

.BagFull:
	writetext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse .NoQuiz
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	promptbutton
	getstring STRING_BUFFER_4, .RadioCardText
	scall .ReceiveItem
	writetext RadioTower1FPokegearIsARadioText
	promptbutton
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	end

.RadioCardText:
	db "RADIO-MODUL@"

.ReceiveItem:
	jumpstd receiveitem
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext RadioTower1FRadioCardWomanWrongAnswerText
	waitbutton
	closetext
	end

.NoQuiz:
	writetext RadioTower1FRadioCardWomanNotTakingQuizText
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText

RadioTower1FLuckyNumberManGoToPCMovement:
	step RIGHT
	turn_head UP
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step LEFT
	turn_head UP
	step_end

RadioTower1FReceptionistWelcomeText:
	text "Willkommen!"
	done

RadioTower1FReceptionistNoToursText:
	text "Guten Tag! Leider"
	line "bieten wir heute"
	cont "keine Führungen"
	cont "an."
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "Hallo! Bist du"
	line "wegen der GLÜCKS-"
	cont "ZAHLSHOW hier?"

	para "Soll ich die"
	line "ID-Nummern deiner"
	cont "#MON über-"
	cont "prüfen?"

	para "Wenn du Glück"
	line "hast, gewinnst du"
	cont "einen Preis."
	done

RadioTower1FLuckyNumberManThisWeeksIdIsText:
	text "Die ID-Nummer"
	line "dieser Woche"
	cont "lautet @"
	text_ram wStringBuffer3
	text "."
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	text "Mal sehen, ob"
	line "du Glück hast."
	done

RadioTower1FLuckyNumberManDotDotDotText:
	text "<……>"
	line "<……>"
	done

RadioTower1FLuckyNumberManComeAgainText:
	text "Versuche nächste"
	line "Woche erneut"
	cont "dein Glück bei der"
	cont "GLÜCKSZAHLSHOW."
	done

RadioTower1FLuckyNumberManPerfectMatchText:
	text "Wow! Alle fünf"
	line "Ziffern stimmen"
	cont "überein!"

	para "Du gewinnst den"
	line "Hauptpreis!"

	para "Du gewinnst einen"
	line "MEISTERBALL!"
	done

RadioTower1FLuckyNumberManOkayMatchText:
	text "Hey! Die letzten"
	line "drei Ziffern"
	cont "stimmen überein!"

	para "Du hast den"
	line "zweiten Preis"
	cont "gewonnen: Den"
	cont "EP-TEILER!"
	done

RadioTower1FLuckyNumberManWeakMatchText:
	text "Ooh, die letzten"
	line "beiden Ziffern"
	cont "stimmen überein."

	para "Du hast den"
	line "dritten Preis"
	cont "gewonnen: AP-PLUS."
	done

RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText:
	text "Leider stimmt"
	line "keine deiner"
	cont "Ziffern überein."
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "Du kannst den"
	line "Preis nicht"
	cont "tragen."

	para "Schaffe Platz und"
	line "komm gleich"
	cont "wieder zurück."
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "Bei uns läuft"
	line "momentan ein"
	cont "besonderes Quiz."

	para "Beantworte die"
	line "fünf Fragen"
	cont "richtig, um ein"
	cont "RADIO-MODUL"
	cont "zu gewinnen."

	para "Stecke es in den"
	line "#COM, um"

	para "überall und zu"
	line "jeder Zeit Radio"
	cont "hören zu können."

	para "Möchtest du am"
	line "Quiz teilnehmen?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "Frage 1:"

	para "Gibt es ein #-"
	line "MON, das nur VOR-"
	cont "MITTAGs erscheint?"
	done

RadioTower1FRadioCardWomanQuestion2Text:
	text "Korrekt!"
	line "Frage 2:"

	para "Ist diese Aussage"
	line "korrekt?"

	para "Du kannst BEEREN"
	line "nicht im SUPER-"
	cont "MARKT erstehen."
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "Richtig!"
	line "Frage 3:"

	para "Ist VM01 BLITZ?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	text "Nicht übel!"
	line "Frage 4:"

	para "Ist FALK der"
	line "ARENALEITER von"

	para "VIOLA CITY, der"
	line "Vogel-#MON"
	cont "einsetzt?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "Wieder richtig!"
	line "Hier die letzte"
	cont "Frage:"

	para "Ist bei den Ein-"
	line "armigen Banditen"

	para "in der SPIELHALLE"
	line "von DUKATIA CITY"

	para "ein GLUMANDA auf"
	line "einer Rolle abge-"
	cont "bildet?"
	done

RadioTower1FRadioCardWomanYouWinText:
	text "Bingo! Richtig!"
	line "Glückwunsch!"

	para "Hier hast du"
	line "deinen Preis:"
	cont "ein RADIO-MODUL!"
	done

RadioTower1FPokegearIsARadioText:
	text "<PLAYER>s #COM"
	line "kann jetzt auch"
	cont "als Radio ver-"
	cont "wendet werden!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "Höre dir bitte"
	line "unsere Shows an!"
	done

RadioTower1FRadioCardWomanWrongAnswerText:
	text "Oh, nein."
	line "Das war leider"

	para "falsch. Versuch's"
	line "noch einmal!"
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	text "Oh. Ich verstehe."
	line "Komm wieder, wenn"
	cont "du deine Meinung"
	cont "geändert hast."
	done

RadioTower1FLassText:
	text "BEN ist ein"
	line "großartiger DJ."

	para "Seine sonore"
	line "Stimme lässt mich"
	cont "dahinschmelzen!"
	done

RadioTower1FYoungsterText:
	text "Ich liebe MARGIT"
	line "vom #MON-TALK."

	para "Ich kenne aber"
	line "nur ihre Stimme."
	done

GruntM3SeenText:
	text "Endlich haben wir"
	line "den RADIOTURM"
	cont "besetzt!"

	para "Nun wird jeder"
	line "den TEAM ROCKET-"

	para "Terrorapparat"
	line "kennenlernen!"

	para "Wir zeigen euch,"
	line "wie böse wir sind!"
	done

GruntM3BeatenText:
	text "Zu stark! Wir"
	line "müssen dich im"
	cont "Auge behalten…"
	done

GruntM3AfterBattleText:
	text "Du bist zu stark."

	para "Du könntest unsere"
	line "Pläne zerstören."
	cont "Ich muss die"
	cont "anderen warnen…"
	done

RadioTower1FDirectoryText:
	text "EG REZEPTION"
	line "1S VERKAUF"

	para "2S PERSONAL"
	line "3S PRODUKTION"

	para "4S BÜRO DES"
	line "   INTENDANTEN"
	done

RadioTower1FLuckyChannelSignText:
	text "GLÜCKSKANAL!"

	para "Gewinne mit #-"
	line "MON-ID-Nummern!"

	para "Tausche deine "
	line "#MON, um viele"
	cont "ID-Nummern zu"
	cont "erhalten!"
	done

RadioTower1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event 13,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	db 6 ; object events
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 16,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 15,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS
