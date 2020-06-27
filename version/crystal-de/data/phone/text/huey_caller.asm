INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/huey_caller", ROMX

HueyBattleRematchText::
	text "Heh, ich fordere"
	line "dich zu einem"

	para "Kampf heraus. Es"
	line "wird nicht so, wie"
	cont "beim letzten Mal!"

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"

	para "Komm vorbei, aber"
	line "dalli!"
	done

HueyHangUpText::
	text "Und tschüß!"
	done

HueyWeHaveToBattleAgainSometimeText::
	text "Wir müssen irgend-"
	line "wann wieder"
	cont "kämpfen."

	para "Ich werde dich"
	line "herausfordern, bis"

	para "ich gewinne, da-"
	line "rauf kannst du"
	cont "wetten."
	done

HueyReminderText::
	text "Heh, ich hoffe, du"
	line "hast unseren Kampf"
	cont "nicht vergessen!"

	para "@"
	text_ram wStringBuffer5
	text "!"

	para "Komm nur zu mir!"
	line "Ich warte!"
	done
