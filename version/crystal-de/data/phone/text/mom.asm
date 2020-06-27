INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/mom", ROMX

MomPhoneGreetingText::
	text "Hallo?"

	para "Oh, hi, <PLAYER>!"
	line "Hart am Arbeiten?"
	done

MomPhoneLandmarkText::
	text "Oh, du bist in"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Ist da nicht"
	line "@"
	text_ram wStringBuffer4
	text "?"

	para "Hast du das schon"
	line "angesehen?"
	done

MomPhoneGenericAreaText::
	text "Wirklich? Du bist"
	line "in"
	cont "@"
	text_ram wStringBuffer3
	text "?"

	para "Ich war dort noch"
	line "nie. Das ist sehr"
	cont "nett, <PLAYER>."
	done

MomPhoneNewBarkText::
	text "Was? Du bist in"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Besuch doch mal"
	line "deine MAMA!"
	done

MomPhoneCherrygroveText::
	text "Du besuchst"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Du könntest ja mal"
	line "nach Hause kommen."
	done

MomOtherAreaText::
	text "Wow, du besuchst"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Viel Glück bei"
	line "deiner Suche nach"
	cont "#MON!"
	done

MomDeterminedText::
	text "Das klingt wirk-"
	line "lich hart."

	para "Aber, <PLAYER>,"
	line "ich weiß, dass du"

	para "sehr ausdauernd"
	line "bist. Du schaffst"
	cont "das schon!"
	done

MomCheckBalanceText::
	text "Nebenbei, du hast"
	line "¥@"
	text_ram wStringBuffer3
	text_start

	para "gespart. Willst du"
	line "weitersparen?"
	done

MomImportantToSaveText::
	text "Es ist wichtig,"
	line "Geld zu sparen."
	done

MomYoureNotSavingText::
	text "Oh, <PLAYER>,"
	line "du sparst ja gar"

	para "nicht. Möchtest du"
	line "sparen?"
	done

MomYouveSavedText::
	text "Nebenbei, du hast"
	line "¥@"
	text_ram wStringBuffer3
	text_start

	para "gespart. Willst du"
	line "wieder mit dem"

	para "Sparen anfangen?"
	done

MomOKIllSaveText::
	text "O.K. Ich werde"
	line "dein Geld sparen."
	done

MomPhoneWontSaveMoneyText::
	text "O.K. Ich höre auf,"
	line "dein Geld zu spa-"
	cont "ren."
	done

MomPhoneHangUpText::
	text "<PLAYER>, mach"
	line "weiter so! Ich"
	cont "drück dir die"
	cont "Daumen!"
	done

MomPhoneNoPokemonText::
	text "Hallo?"

	para "Oh, hi, <PLAYER>!"
	line "Hat PROF. LIND"

	para "nicht auf dich"
	line "gewartet?"
	done

MomPhoneNoPokedexText::
	text "Hallo?"

	para "Oh, hi, <PLAYER>!"
	line "Du bist auf einer"

	para "Mission für PROF."
	line "LIND? Mach's gut!"
	done

MomPhoneNoGymQuestText::
	text "Hallo?"

	para "Hi, <PLAYER>!"
	line "Ist deine Mission"

	para "erfüllt? Dann komm"
	line "nach Hause."
	done

MomPhoneLectureText::
	text "Hallo?"

	para "……<PLAYER>?"
	line "PROF. LIND sagte"

	para "mir, dass du auf"
	line "eine lange Reise"
	cont "gehst."

	para "Ich wünschte, du"
	line "hättest es mir"
	cont "gesagt…"

	para "Was ist mit Geld?"
	line "Soll ich für dich"
	cont "sparen?"
	done
