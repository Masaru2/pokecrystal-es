INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/vance_callee", ROMX

VanceAnswerPhoneText::
	text "Ja, hallo? Hier"
	line "ist @"
	text_ram wStringBuffer3
	text "!"

	para "Moin, <PLAY_G>!"

	para "Setzt du Vogel-"
	line "#MON ein?"
	done

VanceAnswerPhoneDayText::
	text "Ja, hallo? Hier"
	line "ist @"
	text_ram wStringBuffer3
	text "!"

	para "Moin, <PLAY_G>!"

	para "Fliegen deine"
	line "Vogel-#MON?"
	done

VanceAnswerPhoneNiteText::
	text "Ja, hallo? Hier"
	line "ist @"
	text_ram wStringBuffer3
	text "!"

	para "N'Abend, <PLAY_G>!"
	line "Dürfen sich deine"

	para "Vogel-#MON wil-"
	line "de Sachen ansehen?"
	done

VanceGreetText::
	text "Guten Morgen,"
	line "<PLAY_G>!"

	para "@"
	text_ram wStringBuffer3
	text " hier!"
	line "Guten Morgen!"
	done

VanceGreetDayText::
	text "Hi, <PLAY_G>!"

	para "@"
	text_ram wStringBuffer3
	text " hier!"
	line "Erinnerst du dich?"
	done

VanceGreetNiteText::
	text "Guten Abend,"
	line "<PLAY_G>!"

	para "@"
	text_ram wStringBuffer3
	text " hier!"
	line "Hast du Zeit?"
	done

VanceGenericText::
	text "Geht es dir und"
	line "deinen #MON"
	cont "gut?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "scheint so stark"

	para "werden zu wollen,"
	line "dass es das legen-"
	cont "däre VOGEL-#MON"

	para "herausfordern und"
	line "besiegen möchte!"
	done
