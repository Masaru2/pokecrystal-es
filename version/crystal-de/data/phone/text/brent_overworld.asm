INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/brent_overworld", ROMX

BrentAskNumber1Text::
	text "Du bist ein"
	line "#MANIAC…"

	para "Ich spüre das."
	line "Ja, du bist einer."

	para "Aber dein Wissen"
	line "ist noch klein!"

	para "Kennst du BILL? Er"
	line "ist ein wahrer"

	para "#MANIAC. Ich"
	line "verehre ihn."

	para "Ich gebe dir mein"
	line "Wissen über BILL"

	para "weiter, wenn du"
	line "mir deine Nummer"
	cont "gibst."
	done

BrentAskNumber2Text::
	text "Ich gebe dir mein"
	line "Wissen über BILL"

	para "weiter, wenn du"
	line "mir deine Nummer"
	cont "gibst."
	done

BrentNumberAcceptedText::
	text "BILL - er ist"
	line "unbeschreiblich!"

	para "Ein #MANIAC,"
	line "wie er zu werden…"

	para "ist mein Traum."
	done

BrentNumberDeclinedText::
	text "Das wirst du noch"
	line "bereuen…"

	para "Aber, das ist mir"
	line "völlig gleich…"
	done

BrentPhoneFullText::
	text "Dein Nummern-"
	line "speicher ist voll."

	para "Ein #MANIAC"
	line "muss ordentlicher"
	cont "sein!"
	done

BrentRematchText::
	text "Ich warte."

	para "Sieh, das sind"
	line "meine #MON!"
	done
