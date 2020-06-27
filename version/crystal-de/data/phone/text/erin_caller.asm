INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/erin_caller", ROMX

ErinMonIsMuchStrongerText::
	text_ram wStringBuffer3
	text "s @"
	text_ram wStringBuffer4
	text_start
	line "ist viel stärker"
	cont "als zuvor!"
	done

ErinDefeatedMonText::
	text "Und, und…"
	line "Ich habe gerade"
	cont "ein @"
	text_ram wStringBuffer4
	text_start
	cont "besiegt!"

	para "Ich trainiere"
	line "meine #MON"
	cont "intensiv!"
	done

ErinLostAMonText::
	text "Aber, aber…"

	para "Ein wildes"
	line "@"
	text_ram wStringBuffer4
	text " ent-"
	cont "kam mir erneut."
	cont "Wie unfair!"
	done

ErinBattleRematchText::
	text "Ich bin LOTTE."
	line "Willst du erneut"

	para "gegen mich"
	line "kämpfen?"

	para "Diesmal verliere"
	line "ich nicht!"

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

ErinHangUpText::
	text "Bis denn. Tschüss!"
	done

ErinWorkingHardText::
	text "Ich arbeite hart"
	line "an meinen"
	cont "#MON!"

	para "Komme für einen"
	line "Rückkampf zurück!"
	done

ErinComeBattleText::
	text "Oh, <PLAY_G>!"
	line "Komm und kämpfe"
	cont "gegen LOTTE!"

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done
