INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/wade_caller", ROMX

WadeAreYourMonGrowingText::
	text "Wachsen deine"
	line "#MON?"

	para "Meine #MON"
	line "wachsen mir zu"

	para "schnell. Es ist"
	line "überwältigend!"

	para "@"
	text_ram wStringBuffer4
	text " wächst"
	line "besonders schnell."

	para "Ich denke, es wird"
	line "stark."
	done

WadeDefeatedMonText::
	text "Yo, wir haben ein"
	line "wildes @"
	text_ram wStringBuffer4
	text_start

	para "mit nur einem"
	line "Schlag besiegt."

	para "Es ging so hart"
	line "zu Boden, dass"

	para "ich fast schon"
	line "Mitleid hatte."
	done

WadeLostAMonText::
	text "Yo, ein wildes"
	line "@"
	text_ram wStringBuffer4
	text_start

	para "entkam mir nur"
	line "ganz knapp."

	para "Ich weiß, dass es"
	line "kein seltenes"
	cont "#MON ist…"

	para "Aber es ärgert"
	line "mich, dass es ent-"
	cont "kam, obwohl ich es"
	cont "schon fast hatte."
	done

WadeBattleRematchText::
	text "Lust auf einen"
	line "#MON-Kampf? Es"

	para "wird nicht so wie"
	line "das letzte Mal!"

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Ruf an, wenn du"
	line "da bist."
	done

WadeHangUpText::
	text "Bis später!"
	done

WadeBugCatchingContestText::
	text "Das Käferturnier"
	line "findet heute im"

	para "NATIONALPARK"
	line "statt."

	para "Gehst du hin,"
	line "<PLAY_G>?"

	para "Ich weiß es noch"
	line "nicht sicher."
	done

WadeFoundItemText::
	text "Ich habe alle mög-"
	line "lichen BEEREN ge-"
	cont "funden. Wenn du"

	para "willst, teile"
	line "ich mit dir."

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "."
	done

WadeNoBerriesText::
	text "Huch? BEEREN?"

	para "Sorry, ich habe"
	line "noch keine ge-"
	cont "funden."

	para "Ich rufe an, wenn"
	line "ich welche finde."
	cont "Bitte warte!"
	done

WadeQuickBattleText::
	text "Lass uns endlich"
	line "kämpfen!"

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Komm bitte schnell"
	line "hierher!"
	done

WadeComeQuickText::
	text "Wieso bist du noch"
	line "nicht hier?"

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Komm bitte schnell"
	line "hierher!"
	done
