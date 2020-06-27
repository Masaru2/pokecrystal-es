INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/todd_overworld", ROMX

ToddAskNumber1Text::
	text "Von hier kann ich"
	line "das KAUFHAUS von"

	para "DUKATIA CITY"
	line "sehen. Sie ver-"

	para "kaufen hin und"
	line "wieder Sonderan-"
	cont "gebote auf dem"
	cont "Dach."

	para "Gibst du mir deine"
	line "Telefonnummer?"

	para "Ich melde mich,"
	line "wenn sie wieder"
	cont "Angebote haben."
	done

ToddAskNumber2Text::
	text "Wenn du mir deine"
	line "Nummer gibst, rufe"

	para "ich an, wenn sie"
	line "Angebote haben."
	done

ToddNumberAcceptedText::
	text "Ich gehe täglich"
	line "in das KAUFHAUS"

	para "von DUKATIA CITY."
	line "Daher weiß ich,"

	para "wann sie Angebote"
	line "haben."
	done

ToddNumberDeclinedText::
	text "Egal…"

	para "Bist du knapp bei"
	line "Kasse, notiere"
	cont "meine Nummer."

	para "Ich rufe dich an,"
	line "wenn sie Angebote"
	cont "haben."
	done

ToddPhoneFullText::
	text "Dein Telefon hat"
	line "keinen freien"
	cont "Speicherplatz"
	cont "mehr."
	done

ToddRematchText::
	text "Ich erwartete"
	line "dich! Ich war"

	para "nicht mehr so"
	line "oft Einkaufen, um"

	para "mein #MON bes-"
	line "ser zu trainieren!"
	done

UnusedText_0xa43ca:
; This is unused; Todd says this during the department store sale,
; but this is a duplicate of the actual string in the Route 34 scripts.
	text "Einkaufen unter"
	line "freiem Himmel!"

	para "Es ist wunderschön"
	line "hier auf dem Dach."
	done
