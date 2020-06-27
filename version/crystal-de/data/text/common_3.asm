INCLUDE "macros/data.inc"
INCLUDE "macros/scripts/text.inc"


SECTION "data/text/common_3", ROMX

_OakText6::
	text "Wie lautet dein"
	line "Name?"
	prompt

_OakText7::
	text "<PLAYER>, bist du"
	line "bereit?"

	para "Dein eigenes"
	line "#MON-Abenteuer"
	cont "erwartet dich."

	para "Dich erwarten tol-"
	line "le Dinge, aber"
	cont "auch harte Zeiten."

	para "Eine Welt voller"
	line "Träume und aufre-"
	cont "gender #MON-"

	para "Abenteuer erwar-"
	line "tet dich! Mach"
	cont "dich bereit!"

	para "Ich treffe dich"
	line "später!"
	done

_ClockTimeMayBeWrongText::
	text "Die Uhr könnte"
	line "falsch gestellt"
	cont "sein."

	para "Gib bitte die"
	line "genaue Uhrzeit an."
	prompt

_ClockSetWithControlPadText::
	text "Benutze dafür das"
	line "Steuerkreuz."

	para "Bestätigen:"
	line "A-Knopf"
	cont "Zurück: B-Knopf"
	done

_ClockIsThisOKText::
	text "Einverstanden?"
	done

_ClockHasResetText::
	text "Die Uhr wurde"
	line "korrigiert."
	done

_LinkTimeoutText::
	text "Es verging zu viel"
	line "Zeit. Probier's"
	cont "noch einmal."
	prompt

_LinkTradeCantBattleText::
	text "Wenn du dieses"
	line "#MON tauschst,"
	cont "kannst du nicht"
	cont "mehr kämpfen."
	prompt

_LinkAbnormalMonText::
	text "Das @"
	text_ram wStringBuffer1
	text_start
	cont "deines Freundes"
	cont "scheint nicht in"
	cont "Ordnung zu sein!"
	prompt

_LinkAskTradeForText::
	text "Tausche @"
	text_ram wd004
	text_start
	line "mit @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c422a::
	text "Um einen Mobil"
	line "Kampf auszuführen,"

	para "musst du drei"
	line "#MON auswählen."

	para "In Odnung?"
	done

UnknownText_0x1c4275::
	text "Benötigst du mehr"
	line "Informationen über"
	cont "den Mobil-Kampf?"
	done

UnknownText_0x1c4298::
	text "An einem Mobil-"
	line "Kampf nehmen drei"
	cont "#MON teil."

	para "Die max. Kampfzeit"
	line "pro Tag beträgt"

	para "zehn Minuten für"
	line "jeden angeschlos-"
	cont "senen Spieler."

	para "Steht nach Ablauf"
	line "des Zeitlimits"

	para "kein Sieger fest,"
	line "gewinnt der Spie-"
	cont "ler, der noch über"

	para "die meisten kampf-"
	line "fähigen #MON"
	cont "verfügt."

	para "Bei einem Remis,"
	line "gewinnt der Spie-"
	cont "ler, dessen Team"

	para "die wenigsten KP"
	line "verloren hat."
	done

UnknownText_0x1c439c::
	text "Für heute bleiben"
	line "noch @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Möchtest du"
	line "kämpfen?"
	done

UnknownText_0x1c43dc::
	text "Für heute bleiben"
	line "nur noch @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Einen schnellen"
	line "Kampf bestreiten?"
	done

UnknownText_0x1c4419::
	text "Du hast nur noch"
	line "1 min für heute!"

	para "Wie wäre es mit"
	line "einem Blitzkampf?"
	done

UnknownText_0x1c445a::
	text "Weniger, als 1"
	line "min für heute!"

	para "Kommme morgen"
	line "wieder."
	done

UnknownText_0x1c449c::
	text "Noch ein Versuch"
	line "bei gleichen"
	cont "Einstellungen?"
	done

_MobileBattleLessThanOneMinuteLeftText::
	text "Weniger, als 1"
	line "min für heute!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "Heute ist keine"
	line "Zeit für eine"
	cont "Verbindung."
	done

UnknownText_0x1c4508::
	text "Wähle drei #MON"
	line "für den Kampf."
	done

UnknownText_0x1c4525::
	text "Heute sind noch"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text " min übrig."
	done

_WouldYouLikeToSaveTheGameText::
	text "Möchtest du das"
	line "Spiel SICHERN?"
	done

_SavingDontTurnOffThePowerText::
	text "Speichern…"
	done

_SavedTheGameText::
	text "<PLAYER> hat das"
	line "Spiel gesichert."
	done

_AlreadyASaveFileText::
	text "Es gibt bereits"
	line "einen Spielstand."

	para "Spielstand"
	line "überschreiben?"
	done

_AnotherSaveFileText::
	text "Es gibt bereits"
	line "einen Spielstand."
	cont "Spielstand"
	cont "überschreiben?"
	done

_SaveFileCorruptedText::
	text "Der Spielstand"
	line "ist zerstört!"
	prompt

_ChangeBoxSaveText::
	text "Vor einem Wechsel"
	line "der #MON-BOX"
	cont "wird das Spiel"
	cont "gesichert!"
	done

_MoveMonWOMailSaveText::
	text "Immer, wenn du"
	line "ein #MON"
	cont "verschiebst, wird"
	cont "das Spiel ge-"
	cont "sichert!"
	done

; unused
_WindowAreaExceededErrorText::
	text "Die Speicherkapa-"
	line "zität des Fensters"
	cont "wurde überschrit-"
	cont "ten."
	done

_WindowPoppingErrorText::
	text "Für den Tausch"
	line "stehen keine Fens-"
	cont "ter zur Verfügung."
	done

; unused
_CorruptedEventErrorText::
	text "Vorgang abge-"
	cont "brochen!"
	prompt

_ObjectEventText::
	text "Object event."
	done

_BGEventText::
	text "BG event."
	done

_CoordinatesEventText::
	text "Coordinates event"
	done

_ReceivedItemText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> steckt"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text_ram wStringBuffer3
	text_start
	line "ist voll…"
	prompt

_SeerSeeAllText::
	text "Ich sehe alles."
	line "Ich weiß alles…"

	para "Gewiss kenne ich"
	line "deine #MON!"
	done

_SeerCantTellAThingText::
	text "Wiiieeee? Ich kann"
	line "nichts sagen!"

	para "Wieso weiß ich"
	line "darüber nichts?"
	done

_SeerNameLocationText::
	text "Hm… du trafst"
	line "@"
	text_ram wSeerNickname
	text " hier:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "Die Tageszeit war"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Sein Level war @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Ich bin gut, oder?"
	prompt

_SeerTradeText::
	text "Hm… hast du"
	line "@"
	text_ram wSeerNickname
	text " mit"

	para "@"
	text_ram wSeerOTName
	text_start
	line "getauscht?"

	para "@"
	text_ram wSeerOTName
	text " traf"
	line "@"
	text_ram wSeerNickname
	text " hier:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerNoLocationText::
	text "Was!? Unglaublich!"

	para "Ich weiß nicht"
	line "wie, aber es ist"

	para "unglaublich!"
	line "Du bist anders."

	para "Ich kann nicht sa-"
	line "gen, wo du es"
	cont "trafst, aber sein"
	cont "Level war @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Ich bin gut, oder?"
	prompt

_SeerEggText::
	text "Heh!"

	para "Das ist ein EI!"

	para "Du kannst nicht"
	line "behaupten, du"
	cont "hättest es schon"
	cont "getroffen…"
	done

_SeerDoNothingText::
	text "Fufufu! Ich sah,"
	line "dass du müßig"
	cont "gehst!"
	done

_SeerMoreCareText::
	text "Apropos…"

	para "Du solltest deine"
	line "#MON etwas"

	para "umsichtiger"
	line "trainieren."
	done

_SeerMoreConfidentText::
	text "Übrigens…"

	para "Es scheint"
	line "gewachsen zu sein."

	para "@"
	text_ram wSeerNickname
	text_start
	line "wird immer"
	cont "selbstbewusster."
	done

_SeerMuchStrengthText::
	text "Apropos…"

	para "@"
	text_ram wSeerNickname
	text " ist"
	line "gewachsen. Es ist"
	cont "viel stärker."
	done

_SeerMightyText::
	text "Apropos…"

	para "Es ist sehr"
	line "gewachsen!"

	para "@"
	text_ram wSeerNickname
	text_start
	line "muss viele"

	para "#MON-Kämpfe"
	line "bestritten haben."

	para "Es strotzt vor"
	line "Selbstbewusstsein."
	done

_SeerImpressedText::
	text "Apropos…"

	para "Deine Hingabe be-"
	line "eindruckt mich."

	para "Es ist schon lange"
	line "her, dass ich ein"

	para "so starkes #MON"
	line "wie @"
	text_ram wSeerNickname
	text_start
	cont "gesehen habe."

	para "Ich bin sicher,"
	line "dass jeder"

	para "@"
	text_ram wSeerNickname
	text_start
	line "gerne kämpfen"
	cont "sehen würde."
	done

_CongratulationsYourPokemonText::
	text "Glückwunsch!"
	line "Dein @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

_EvolvedIntoText::
	text_start

	para "wurde zu"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Hmm? Die Entwick-"
	line "lung wurde abge-"
	cont "brochen!"
	prompt

_EvolvingText::
	text "Hey! @"
	text_ram wStringBuffer2
	text_start
	line "entwickelt sich!"
	done

_MartHowManyText::
	text "Wie viele?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x"
	line "@"
	text_ram wStringBuffer2
	text "?"

	para "Das macht dann"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Hallo,"

	para "ich verkaufe"
	line "preiswerte"
	cont "Kräutermedizin."

	para "Sie wirkt, ist"
	line "aber bitter."

	para "Deine #MON"
	line "werden sie nicht"
	cont "mögen."

	para "Hihihihi…"
	done

_HerbalLadyHowManyText::
	text "Wie viele?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Danke, Kleiner."
	line "Hihihihi…"
	done

_HerbalLadyPackFullText::
	text "Oh? In deinem"
	line "BEUTEL ist kein"
	cont "Platz mehr."
	done

_HerbalLadyNoMoneyText::
	text "Hihihi… Du hast"
	line "nicht genug Geld."
	done

_HerbalLadyComeAgainText::
	text "Besuche mich"
	line "wieder. Hihihihi…"
	done

_BargainShopIntroText::
	text "Heh! Bist du an"
	line "Schnäppchen"
	cont "interessiert?"

	para "Ich verkaufe"
	line "seltene Items,"

	para "aber leider sind"
	line "es nur Einzel-"
	cont "stücke."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Kaufen?"
	done

_BargainShopThanksText::
	text "Danke."
	done

_BargainShopPackFullText::
	text "Uhh, dein BEUTEL"
	line "platzt aus"
	cont "allen Nähten."
	done

_BargainShopSoldOutText::
	text "Das hast du schon"
	line "gekauft. Ich"
	cont "habe keines mehr."
	done

_BargainShopNoFundsText::
	text "Uhh, du bist knapp"
	line "bei Kasse."
	done

_BargainShopComeAgainText::
	text "Schau mal"
	line "wieder vorbei."
	done

_PharmacyIntroText::
	text "Was ist? Brauchst"
	line "du Medizin?"
	done

_PharmacyHowManyText::
	text "Wie viele?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Vielen Dank!"
	done

_PharmacyPackFullText::
	text "Du hast keinen"
	line "Platz mehr."
	done

_PharmacyNoMoneyText::
	text "Wie? Das ist nicht"
	line "genügend Geld."
	done

_PharmacyComeAgainText::
	text "In Ordnung."
	line "Bis die Tage."
	done

; unused
_NothingToSellText::
	text "Du hast nichts"
	line "zu verkaufen."
	prompt

_MartSellHowManyText::
	text "Wie viele?"
	done

_MartSellPriceText::
	text "Ich zahle dir"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Reicht das?"
	done

_MartWelcomeText::
	text "Willkommen! Womit"
	line "kann ich dienen?"
	done

_MartThanksText::
	text "Hier, bitte."
	line "Danke schön!"
	done

_MartNoMoneyText::
	text "Du hast nicht"
	line "genügend Geld."
	done

_MartPackFullText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	done

_MartCantBuyText::
	text "Ich kann dir das"
	line "nicht abkaufen."
	prompt

_MartComeAgainText::
	text "Komm wieder!"
	done

_MartAskMoreText::
	text "Kann ich noch"
	line "etwas für dich"
	cont "tun?"
	done

_MartBoughtText::
	text "Erhält ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " für"
	line "@"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "."
	done

_SlotsBetHowManyCoinsText::
	text "Wie viel setzen?"
	done

_SlotsStartText::
	text "Start!"
	done

_SlotsNotEnoughCoinsText::
	text "Nicht genügend"
	line "Münzen."
	prompt

_SlotsRanOutOfCoinsText::
	text "Mist… Ich habe"
	line "keine Münzen mehr…"
	done

_SlotsPlayAgainText::
	text "Noch einmal?"
	done

_SlotsLinedUpText::
	text "Bingo!"
	line "@"
	text_ram wStringBuffer2
	text " Münzen"
	cont "gewonnen!"
	done

_SlotsDarnText::
	text "Mist!"
	done

_MobileStadiumEntryText::
	text "Daten für das"
	line "MOBILE STADION"

	para "bei #MON"
	line "STADIUM 2 auf N64"
	cont "können hier"
	cont "gelesen werden."

	para "Daten lesen?"
	done

_MobileStadiumSuccessText::
	text "Datentransfer"
	line "abgeschlossen."

	para "Wir hoffen, du"
	line "magst die Kämpfe"

	para "im MOBILEN STADION"
	line "bei #MON"
	cont "STADIUM 2 auf N64."

	para ""
	done

_MainMenuTimeUnknownText::
	text "Uhrzeit unbekannt"
	done

; unused mobile
_DeleteSavedLoginPasswordText::
	text "Das LOG-IN-"
	line "PASSWORT löschen?"
	done

; unused mobile
_DeletedTheLoginPasswordText::
	text "Das LOG-IN-"
	line "PASSWORT löschen?"
	done

; unused mobile
_MobilePickThreeMonForBattle::
	text "Wähle drei #MON"
	line "für den Kampf."
	prompt

; unused mobile
_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " und"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Diese 3 einsetzen?"
	done

; unused mobile
_MobileOnlyThreeMonMayEnterText::
	text "Es dürfen nur drei"
	line "#MON kämpfen."
	prompt

; unused mobile
_MobileCardFolderIntro1Text::
	text "Im KARTENORDNER"
	line "legst du deine und"

	para "die KARTEN deiner"
	line "Freunde ab."

	para "Eine KARTE enhält"
	line "Informationen wie"

	para "den Namen, die"
	line "Nummer und das"
	cont "Profil einer"
	cont "Person."

	para ""
	done

; unused mobile
_MobileCardFolderIntro2Text::
	text "Hier, deine KARTE."

	para "Gib deine Telefon-"
	line "nummer ein und"

	para "tausche KARTEN"
	line "mit deinen"
	cont "Freunden."

	para ""
	done

; unused mobile
_MobileCardFolderIntro3Text::
	text "Wenn du im Besitz"
	line "der KARTE deines"

	para "Freundes bist,"
	line "kannst du ihn vom"

	para "Handy im 1.Stock"
	line "in jedem #MON-"
	cont "CENTER anrufen."

	para ""
	done

; unused mobile
_MobileCardFolderIntro4Text::
	text "Um deine KARTEN"
	line "sicher wegzulegen,"

	para "musst du einen"
	line "CODE für den"
	cont "KARTENORDNER"
	cont "festlegen."

	para ""
	done

; unused mobile
_MobileCardFolderAskDeleteText::
	text "Wird der KARTEN-"
	line "ORDNER gelöscht,"

	para "werden auch alle"
	line "KARTEN und der"
	cont "CODE gelöscht."

	para "Vorsicht - Ein"
	line "gelöschter KARTEN-"
	cont "ORDNER kann nicht"
	cont "wieder hergestellt"
	cont "werden."

	para "Den KARTENORDNER"
	line "löschen?"
	done

; unused mobile
_MobileCardFolderDeleteAreYouSureText::
	text "Möchtest du ihn"
	line "wirklich löschen?"
	done

; unused mobile
_MobileCardFolderDeletedText::
	text "Der KARTENORDNER"
	line "wurde gelöscht."

	para ""
	done

; unused mobile
_MobileCardFolderAskOpenOldText::
	text "Es gibt einen al-"
	line "ten KARTENORDNER"
	cont "von einem anderen"
	cont "Abenteuer."

	para "Möchtest du ihn"
	line "öffnen?"
	done

; unused mobile
_MobileCardFolderAskDeleteOldText::
	text "Den alten KARTEN-"
	line "ORDNER löschen?"
	done

; unused mobile
_MobileCardFolderFinishRegisteringCardsText::
	text "Ablage der KARTEN"
	line "abgeschlossen?"
	done

_PhoneWrongNumberText::
	text "Äh? Ich habe mich"
	line "verwählt!"
	done

_PhoneClickText::
	text "Klick!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Die Nummer ist"
	line "außerhalb des"
	cont "Funknetzes."
	done

_PhoneJustTalkToThemText::
	text "Du musst diesen"
	line "Gesprächspartner"
	cont "zu Fuß aufsuchen!"
	done

_PhoneThankYouText::
	text "Danke!"
	done

; unused
UnknownText_0x1c55d6::
	text "  :"
	done

_PasswordAskResetText::
	text "Passwort O.K."
	line "Wähle Fortfahren"
	cont "& verwirf die"
	cont "Einstellungen."
	prompt

_PasswordWrongText::
	text "Passwort falsch!"
	prompt

_PasswordAskResetClockText::
	text "Uhr neu stellen?"
	done

_PasswordAskEnterText::
	text "Gib das Passwort"
	line "ein."
	done

_ClearAllSaveDataText::
	text "Spielstand"
	line "löschen?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " erlernt"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unused

_MoveAskForgetText::
	text "Welche Attacke"
	next "soll vergessen"
	cont "werden?"
	done

_StopLearningMoveText::
	text_ram wStringBuffer2
	text_start
	line "nicht erlernen?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "hat @"
	text_ram wStringBuffer2
	text_start
	cont "nicht erlernt."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text " "
	line "versucht,"
	cont "@"
	text_ram wStringBuffer2
	text " zu"
	cont "erlernen!"

	para "Aber @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "kann nicht mehr"
	cont "als vier Attacken"
	cont "erlernen."

	para "Soll eine andere"
	line "Attacke zugunsten"
	cont "von @"
	text_ram wStringBuffer2
	text_start
	cont "vergessen werden?"
	done

Text_MoveForgetCount::
	text "1, 2 und…@"
	text_pause
	text_end

	text_end ; unused

_MoveForgotText::
	text "Schwupp!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " hat"
	line "@"
	text_ram wStringBuffer1
	text_start

	para "vergessen!"

	para "Und…"
	prompt

_MoveCantForgetHMText::
	text "VM-Attacken"
	line "können nicht"
	cont "gelöscht werden!"
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Drei Münzen set-"
	line "zen?"
	done

_CardFlipNotEnoughCoinsText::
	text "Nicht genügend"
	cont "Münzen…"
	prompt

_CardFlipChooseACardText::
	text "Zieh eine Karte."
	done

_CardFlipPlaceYourBetText::
	text "Worauf setzen?"
	done

_CardFlipPlayAgainText::
	text "Noch einmal?"
	done

_CardFlipShuffledText::
	text "Die Karten"
	line "wurden gemischt."
	prompt

_CardFlipYeahText::
	text "Yoh!"
	done

_CardFlipDarnText::
	text "Mist…"
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unused

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Du bist außerhalb"
	line "des Service-"
	cont "gebiets."
	prompt

_PokegearAskWhoCallText::
	text "Wen möchtest du"
	line "anrufen?"
	done

_PokegearPressButtonText::
	text "Drücke B-KNOPF,"
	line "um abzubrechen."
	done

_PokegearAskDeleteText::
	text "Die gespeicherte"
	line "Nummer löschen?"
	done

_BuenaAskWhichPrizeText::
	text "Welchen Preis"
	line "hättest du gerne?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "Ist das richtig?"
	done

_BuenaHereYouGoText::
	text "Und los!"

	para ""
	done

_BuenaNotEnoughPointsText::
	text "Du hast nicht ge-"
	line "nügend Punkte."

	para ""
	done

_BuenaNoRoomText::
	text "Du hast keinen"
	line "Platz dafür."

	para ""
	done

_BuenaComeAgainText::
	text "Oh. Komme bitte"
	line "wieder!"
	done

_BTExcuseMeText::
	text "Entschuldigung!"

	para ""
	done

_ExcuseMeYoureNotReadyText::
	text "Entschuldigung. Du"
	line "bist nicht bereit."

	para ""
	done

_BattleTowerReturnWhenReadyText::
	text "Komme wieder, wenn"
	line "du bereit bist."
	done

_NeedAtLeastThreeMonText::
	text "Du benötigst min-"
	line "destens 3 #MON."

	para ""
	done

_EggDoesNotQualifyText::
	text "Sorry, ein EI"
	line "geht nicht durch."

	para ""
	done

_OnlyThreeMonMayBeEnteredText::
	text "Nur drei #MON"
	line "sind gestattet."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "Die @"
	text_ram wStringBuffer2
	text " #MON"
	line "müssen unter-"
	cont "schiedlich sein."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "Die @"
	text_ram wStringBuffer2
	text " #MON"
	line "dürfen nicht"
	cont "dieselben Items"
	cont "tragen."

	para ""
	done

_YouCantTakeAnEggText::
	text "Du kannst kein EI"
	line "mitnehmen!"

	para ""
	done

_BallDodgedText::
	text "Es weicht dem"
	line "BALL aus!"

	para "Dieses #MON"
	line "lässt sich nicht"
	cont "fangen!"
	prompt

_BallMissedText::
	text "Du hast das"
	line "#MON verfehlt!"
	prompt

_BallBrokeFreeText::
	text "Mist! Das #MON"
	line "hat sich befreit!"
	prompt

_BallAppearedCaughtText::
	text "Fast hätte es"
	line "geklappt!"
	prompt

_BallAlmostHadItText::
	text "Mist!"
	line "Das war knapp!"
	prompt

_BallSoCloseText::
	text "Verflixt! Es"
	line "hätte beinahe"
	cont "geklappt!"
	prompt

Text_BallCaught::
	text "Toll! @"
	text_ram wEnemyMonNick
	text_start
	line "wurde gefangen!@"
	sound_caught_mon
	text_end

	text_end ; unused

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unused

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "wurde auf BILLs PC"
	cont "übertragen."
	prompt

_NewDexDataText::
	text "Für @"
	text_ram wEnemyMonNick
	text_start
	line "wird ein neuer"
	cont "Eintrag im"
	cont "#DEX angelegt.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unused

_AskGiveNicknameText::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer2
	text " von"
	line "@"
	text_ram wStringBuffer1
	text_start

	para "nimmt zu."
	prompt

_ItemCantUseOnMonText::
	text "Dieses #MON"
	line "kann das nicht"
	cont "einsetzen."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "SCHUTZ wirkt"
	line "noch immer."
	prompt

_PlayedFluteText::
	text "Die #FLÖTE"
	line "wurde gespielt."

	para "Das ist ein"
	line "flotter Rhythmus!"
	prompt

_FluteWakeUpText::
	text "Alle schlafenden"
	line "#MON sind"
	cont "aufgewacht."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> spielte"
	line "die #FLÖTE.@"
	text_promptbutton
	text_end

	text_end ; unused

_BlueCardBalanceText::
	text "Du hast jetzt"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " Punkte."
	done

_CoinCaseCountText::
	text "Münzen:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

_RaiseThePPOfWhichMoveText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP aufgefüllt"
	cont "werden?"
	done

_RestoreThePPOfWhichMoveText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erneuert"
	cont "werden?"
	done

_PPIsMaxedOutText::
	text_ram wStringBuffer2
	text "s AP"
	line "wurden komplett"
	cont "aufgefüllt."
	prompt

_PPsIncreasedText::
	text_ram wStringBuffer2
	text "s AP"
	line "wurden aufgefüllt."
	prompt

_PPRestoredText::
	text "AP aufgefüllt."
	prompt

_SentTrophyHomeText::
	text "Hier ist eine"
	line "Trophäe!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " hat"
	line "die Trophäe nach"
	cont "Hause gesandt."
	prompt

_ItemLooksBitterText::
	text "Das ist bitter…"
	prompt

_ItemCantUseOnEggText::
	text "Ein EI kann das"
	line "nicht benutzen."
	prompt

_ItemOakWarningText::
	text "EICH: <PLAYER>!"
	line "Es ist nicht"
	cont "an der Zeit,"
	cont "dies zu benutzen!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Das gehört nicht"
	line "dir!"
	prompt

_ItemWontHaveEffectText::
	text "Das hätte keinen"
	line "Effekt."
	prompt

_BallBlockedText::
	text "Der Trainer hat"
	line "den BALL"
	cont "abgeblockt!"
	prompt

_BallDontBeAThiefText::
	text "Sei kein Dieb!"
	prompt

_NoCyclingText::
	text "Rad fahren ist"
	line "hier nicht"
	cont "gestattet."
	prompt

_ItemCantGetOnText::
	text_ram wStringBuffer1
	text_start
	line "kann nicht be-"
	cont "stiegen werden."
	prompt

_BallBoxFullText::
	text "Die #MON-BOX"
	line "ist voll. Das"
	cont "kannst du jetzt"
	cont "nicht benutzen."
	prompt

_ItemUsedText::
	text "<PLAYER> setzt"
	line "@"
	text_ram wStringBuffer2
	text " ein."
	done

_ItemGotOnText::
	text "<PLAYER> stieg auf@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> stieg von@"
	text_low
	text_ram wStringBuffer2
	text " ab."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " kennt"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "Dieses #MON"
	line "kann nur eine"
	cont "Attacke."
	done

_AskDeleteMoveText::
	text "Soll @"
	text_ram wStringBuffer1
	text_start
	line "vergessen werden?"
	done

_DeleterForgotMoveText::
	text "Dein #MON hat"
	line "die Attacke"
	cont "vergessen."
	done

_DeleterEggText::
	text "Ein EI verfügt"
	line "über keine"
	cont "Attacken!"
	done

_DeleterNoComeAgainText::
	text "Nein? Besuche mich"
	line "wieder."
	done

_DeleterAskWhichMoveText::
	text "Welche Attacke"
	line "soll vergessen"
	cont "werden?"
	prompt

_DeleterIntroText::
	text "Ähm… Oh, ja, ich"
	line "bin der ATTACKEN-"
	cont "VERLERNER."

	para "Ich verfüge über"
	line "die Fähigkeit,"
	cont "#MON ihre"
	cont "Attacken vergessen"
	cont "zu lassen."

	para "Soll ein #MON "
	line "eine Attacke"
	cont "vergessen?"
	done

_DeleterAskWhichMonText::
	text "Welches #MON?"
	prompt

_DSTIsThatOKText::
	text " SZ,"
	line "in Ordnung?"
	done

_TimeAskOkayText::
	text ","
	line "in Ordnung?"
	done

_TimesetAskDSTText::
	text "Möchtest du auf"
	line "Sommerzeit um-"
	cont "stellen?"
	done

_TimesetDSTText::
	text "Ich stelle die Uhr"
	line "eine Stunde vor."
	prompt

_TimesetAskNotDSTText::
	text "Ist die Sommer-"
	line "zeit vorüber?"
	done

_TimesetNotDSTText::
	text "Ich stelle die Uhr"
	line "eine Stunde zu-"
	cont "rück."
	prompt

_TimesetAskAdjustDSTText::
	text "Möchtest du die"
	line "Uhrzeit der"

	para "Sommerzeit an-"
	line "passen?"
	done

_MomLostGearBookletText::
	text "Ich habe die An-"
	line "leitung für den"
	cont "#COM verloren."

	para "Komm später noch"
	line "mal wieder."
	prompt
