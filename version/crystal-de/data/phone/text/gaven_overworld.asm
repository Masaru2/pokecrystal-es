INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/gaven_overworld", ROMX

GavenAskNumber1Text::
	text "Oh, du bist stark."
	line "So einen harten"

	para "Kampf hatte ich"
	line "lange nicht."

	para "Gibst du mir deine"
	line "Telefonnummer?"

	para "Ich fordere dich"
	line "erneut heraus,"

	para "wenn @"
	text_ram wStringBuffer4
	text_start
	line "und die anderen"
	cont "wieder fit sind."
	done

GavenAskNumber2Text::
	text "Gibst du mir deine"
	line "Telefonnummer?"

	para "Ich fordere dich"
	line "erneut heraus,"

	para "wenn @"
	text_ram wStringBuffer4
	text_start
	line "und die anderen"
	cont "wieder fit sind."
	done

GavenNumberAcceptedText::
	text "Wie kann ich dich"
	line "besiegen? Allein"

	para "dieser Gedanke"
	line "verfolgt mich…"
	done

GavenNumberDeclinedText::
	text "Aha… ich verstehe…"
	line "Aber wenn du deine"

	para "Meinung änderst,"
	line "gib mir Bescheid."
	done

GavenPhoneFullText::
	text "Dein Nummern-"
	line "speicher ist voll."

	para "Du kannst meine"
	line "Nummer nicht"
	cont "speichern."
	done

GavenRematchText::
	text "Hallo! Ich habe"
	line "dich erwartet!"

	para "Dieses Mal ist"
	line "der Sieg mein!"
	done
