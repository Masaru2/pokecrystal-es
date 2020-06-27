INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/alan_caller", ROMX

AlanGettingStrongerText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "wird immer stär-"
	cont "ker, womit ich"
	cont "gerechnet habe!"
	done

AlanDefeatedMonText::
	text "Apropos, wir"
	line "besiegten neulich"

	para "ein wildes"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Die richtige Vor-"
	line "bereitung lohnt!"
	done

AlanLostAMonText::
	text "Übrigens, gestern"
	line "entkam mir ein"
	cont "wildes @"
	text_ram wStringBuffer4
	text "."

	para "Ein Berechnungs-"
	line "fehler von mir…"
	done

AlanBattleRematchText::
	text "Ich habe seitdem"
	line "einiges gelernt"

	para "und ich wurde viel"
	line "besser!"

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Schau doch auf ei-"
	line "nen Kampf vorbei?"
	done

AlanHangUpText::
	text "Bis später!"
	done

AlanFoundItemText::
	text "Hehehe, ich fand"
	line "etwas Schönes!"

	para "Es gehört dir!"
	line "Hole es dir hier:"
	cont "@"
	text_ram wStringBuffer5
	text_end

	text_end ; unused

AlanHaventPickedUpAnythingText::
	text "Ich habe noch"
	line "nichts gefunden."

	para "Ich rufe an, wenn"
	line "ich etwas finde."
	done

AlanReminderText::
	text "Falls wir nicht"
	line "bald kämpfen, ver-"
	cont "gesse ich meine"
	cont "Strategie!"

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

AlanComePickUpGiftText::
	text "Ich muss meine"
	line "Hausaufgaben"

	para "machen, kannst du"
	line "gleich herkommen?"

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done
