INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/reena_caller", ROMX

ReenaMonsIsAPerfectMatchText::
	text "Hör zu…"

	para "Erinnerst du dich"
	line "an mein"
	cont "@"
	text_ram wStringBuffer4
	text "?"

	para "Ja, genau. Das"
	line "süße @"
	text_ram wStringBuffer4
	text "."

	para "Meinst du nicht"
	line "auch, dass es per-"
	cont "fekt zu mir passt?"
	done

ReenaDefeatedMonText::
	text "Ob mir schon ein-"
	line "mal ein wildes"
	cont "@"
	text_ram wStringBuffer4
	text_start
	cont "begegnet ist?"

	para "Du stellst Fragen!"

	para "@"
	text_ram wStringBuffer4
	text " habe"
	line "ich schon oft"
	cont "besiegt!"
	done

ReenaLostAMonText::
	text "Ob mir je ein wil-"
	line "des #MON"
	cont "entwischt ist?"

	para "Du stellst Fragen!"

	para "Mir würde nie ein"
	line "wildes @"
	text_ram wStringBuffer4
	text_start

	para "entkommen…"
	line "Oh! Kein Problem!"
	done

ReenaBattleRematchText::
	text "Wir werden gegen-"
	line "einander kämpfen!"

	para "Und zwar hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"

	para "Lass mich nicht"
	line "warten! O.K.?"
	done

ReenaHangUpText::
	text "Du darfst gehen."
	done

ReenaForwardText::
	text "Sei nicht zu"
	line "stolz, dass du"

	para "mich zufällig ge-"
	line "schlagen hast…"

	para "Das war Dusel!"
	done

ReenaHurryText::
	text "Was machst du"
	line "gerade?"

	para "Ich sagte doch,"
	line "ich bin hier:"

	para "@"
	text_ram wStringBuffer5
	text "!"
	line "Lauf nicht weg!"
	done
