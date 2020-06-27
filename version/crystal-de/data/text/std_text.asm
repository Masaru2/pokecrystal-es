INCLUDE "macros/scripts/text.inc"


SECTION "data/text/std_text", ROMX

NurseMornText::
	text "Guten Morgen!"
	line "Willkommen im"
	cont "#MON-CENTER!"
	done

NurseDayText::
	text "Guten Tag!"
	line "Willkommen im"
	cont "#MON-CENTER."
	done

NurseNiteText::
	text "Guten Abend!"
	line "Du bist spät dran."

	para "Willkommen im"
	line "#MON-CENTER."
	done

PokeComNurseMornText::
	text "Guten Morgen!"

	para "Dies ist das #-"
	line "MON KOMMUNIKA-"
	cont "TIONS-CENTER- oder"
	cont "kurz #KOM-"
	cont "CENTER."
	done

PokeComNurseDayText::
	text "Hallo!"

	para "This is the #-"
	line "MON COMMUNICATION"

	para "CENTER--or the"
	line "#COM CENTER."
	done

PokeComNurseNiteText::
	text "Schön dass du noch"
	line "unterwegs bist."

	para "This is the #-"
	line "MON COMMUNICATION"

	para "CENTER--or the"
	line "#COM CENTER."
	done

NurseAskHealText::
	text "Wir heilen deine"
	line "#MON und"
	cont "machen sie wieder"
	cont "fit!"
	done

NurseTakePokemonText::
	text "O.K. Wir benötigen"
	line "deine #MON."
	done

NurseReturnPokemonText::
	text "Danke! Deine"
	line "#MON sind"
	cont "wieder topfit!"
	done

NurseGoodbyeText::
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

; not used
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

NursePokerusText::
	text "An deinen #MON"
	line "sitzen winzige"

	para "Lebewesen."
	line "Deine #MON"

	para "sehen gesund und"
	line "kräftig aus."

	para "Leider können wir"
	line "dir hier auch"

	para "nicht mehr sagen."
	done

PokeComNursePokerusText::
	text "Es scheint, als ob"
	line "deine #MON von"

	para "winzigen Lebewesen"
	line "befallen sind."

	para "Deine #MON"
	line "sind wohlauf und"
	cont "gesund."

	para "Mehr können wir"
	line "dir nicht sagen."
	done

DifficultBookshelfText::
	text "Hier gibt es"
	line "unzählige komplexe"
	cont "Bücher."
	done

PictureBookshelfText::
	text "Eine komplette"
	line "Sammlung von"
	cont "#MON-"
	cont "Bilderbüchern."
	done

MagazineBookshelfText::
	text "#MON-Magazine…"
	line "#MON FREUND,"

	para "#MON HANDBUCH,"
	line "#MON SCHAUBILD…"
	done

TeamRocketOathText::
	text "Eid des"
	line "TEAM ROCKET"

	para "Stiehl #MON"
	line "nur des Profits"
	cont "wegen!"

	para "Benutze #MON"
	line "nur des Profits"
	cont "wegen!"

	para "Die #MON dienen"
	line "nur dazu, TEAM"
	cont "ROCKET noch mehr"
	cont "Ruhm zu"
	cont "verschaffen!"
	done

IncenseBurnerText::
	text "Was ist das? "

	para "Oh, das ist ein"
	line "Räucherstäbchen!"
	done

MerchandiseShelfText::
	text "Sehr viel"
	line "#MON-"
	cont "Merchandising!"
	done

LookTownMapText::
	text "Dies ist die"
	line "KARTE."
	done

WindowText::
	text "Mein Spiegelbild!"
	line "Sieht gut aus!"
	done

TVText::
	text "Dies ist ein"
	line "Fernsehgerät."
	done

HomepageText::
	text "#MON JOURNAL"
	line "HOME PAGE…"

	para "Sie wurde nicht"
	line "aktualisiert…"
	done

; not used
	text "#MON-RADIO!"

	para "Ruft an und äußert"
	line "eure Wünsche!"
	done

TrashCanText::
	text "Hier gibt es"
	line "nichts…"
	done

; not used
	text "Ein #MON könnte"
	line "das vielleicht"

	para "bewegen."
	done

; not used
	text "Ein #MON könnte"
	line "das vielleicht"
	cont "zertrümmern."
	done

PokecenterSignText::
	text "Lass deine"
	line "#MON in einem"
	cont "#MON-CENTER"
	cont "heilen!"
	done

MartSignText::
	text "Alles, was ein"
	line "#MON benötigt,"

	para "findest du im"
	line "PKMN-SUPERMARKT!"
	done

ContestResults_ReadyToJudgeText::
	text "Wir bewerten nun"
	line "deine gefangenen"

	para "#MON.<……>"
	line "<……>"

	para "Die Gewinner"
	line "stehen fest!"

	para "Bist du bereit?"
	line ""
	done

ContestResults_PlayerWonAPrizeText::
	text "<PLAYER> gewinnt"
	line "@"
	text_ram wStringBuffer3
	text ". Preis:"
	cont "@"
	text_ram wStringBuffer4
	text "!"
	done

ReceivedItemText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText::
	text "Nimm bitte auch"
	line "das nächste Mal"
	cont "teil!"
	done

ContestResults_ConsolationPrizeText::
	text "Alle anderen er-"
	line "halten eine BEERE"
	cont "als Trostpreis!"
	done

ContestResults_DidNotWinText::
	text "Hoffentlich"
	line "schneidest du beim"
	cont "nächsten Mal"
	cont "besser ab."
	done

ContestResults_ReturnPartyText::
	text "Wir geben dir"
	line "deine #MON"

	para "zurück."
	line "Bitte schön!"
	done

ContestResults_PartyFullText::
	text "Das #MON"
	line "wurde auf "

	para "BILLs PC"
	line "übertragen."
	done

GymStatue_CityGymText::
	text_ram wStringBuffer3
	text_start
	line "PKMN-ARENA"
	done

GymStatue_WinningTrainersText::
	text "LEITUNG: @"
	text_ram wStringBuffer4
	text_start

	para "Bisherige Sieger:"
	line "<PLAYER>"
	done

CoinVendor_WelcomeText::
	text "Willkommen in der"
	line "SPIELHALLE."
	done

CoinVendor_NoCoinCaseText::
	text "Brauchst du noch"
	line "Spielmünzen?"

	para "Oh, du hast noch"
	line "keinen MÜNZKORB"
	cont "für deine Münzen."
	done

CoinVendor_IntroText::
	text "Brauchst du noch"
	line "Spielmünzen?"

	para "50 Münzen kosten"
	line "¥1000. Möchtest"
	cont "du welche kaufen?"
	done

CoinVendor_Buy50CoinsText::
	text "Dankeschön!"
	line "Hier sind deine"
	cont "50 Münzen!"
	done

CoinVendor_Buy500CoinsText::
	text "Dankeschön!"
	line "Hier sind deine"
	cont "500 Münzen!"
	done

CoinVendor_NotEnoughMoneyText::
	text "Du hast nicht"
	line "genügend Geld."
	done

CoinVendor_CoinCaseFullText::
	text "OH! Dein"
	line "MÜNZKORB ist voll."
	done

CoinVendor_CancelText::
	text "Du brauchst keine"
	line "Münzen? Komm"
	cont "später nochmal!"
	done

BugContestPrizeNoRoomText::
	text "Oh? Dein BEUTEL"
	line "ist voll."

	para "Wir bewahren das"
	line "für dich auf. Hol"

	para "es dir ab, wenn"
	line "du genügend Platz"
	cont "geschaffen hast."
	done

HappinessText3::
	text "Wow! Du und dein"
	line "#MON versteht"
	cont "euch sehr gut!"
	done

HappinessText2::
	text "#MON werden"
	line "zutraulicher, wenn"

	para "du viel Zeit mit"
	line "ihnen verbringst."
	done

HappinessText1::
	text "Du hast dein"
	line "#MON noch nicht"
	cont "gezähmt."

	para "Wenn du es nicht"
	line "gut behandelst,"
	cont "ist es einge-"
	cont "schnappt."
	done

RegisteredNumber1Text::
	text "<PLAYER> speichert"
	line "@"
	text_ram wStringBuffer3
	text "s Nummer."
	done

RegisteredNumber2Text::
	text "<PLAYER> speichert"
	line "@"
	text_ram wStringBuffer3
	text "s Nummer."
	done
