INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/jose_overworld", ROMX

JoseAskNumber1Text::
	text "Sieht @"
	text_ram wStringBuffer4
	text_start
	line "etwas Schönes,"

	para "geht es los und"
	line "holt es."

	para "Magst du schöne"
	line "Dinge?"

	para "Wenn du magst,"
	line "teile ich mit dir."

	para "Wie lautet deine"
	line "Telefonnummer?"

	para "Aber erwarte nicht"
	line "zu viel, hörst du?"
	done

JoseAskNumber2Text::
	text "Magst du schöne"
	line "Dinge?"

	para "Ich teile mit dir,"
	line "wenn PORENTA noch"
	cont "mehr bringt."

	para "Wie lautet deine"
	line "Telefonnummer?"
	done

JoseNumberAcceptedText::
	text "Ich melde mich,"
	line "sobald ich etwas"
	cont "für dich habe."
	done

JoseNumberDeclinedText::
	text "Oh? Gib Bescheid,"
	line "wenn du deine"
	cont "Meinung änderst."
	done

JosePhoneFullText::
	text "Äh! Dein Nummern-"
	line "speicher ist voll."
	done

JoseRematchText::
	text "Kwak! Kwak! Kwak!"

	para "Lass mich nicht"
	line "warten!"
	cont "Los, PORENTA!"
	done

JoseGiftText::
	text "Ich will nicht"
	line "warten! Sieh, das"
	cont "ist es!"

	para "Schau! Ist das"
	line "nicht schön?"
	done

JosePackFullText::
	text "Häh? Du kannst das"
	line "nicht verstauen."

	para "Hole es dir später"
	line "ab."
	done
