INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/tully_caller", ROMX

TullyMonHasGrownText::
	text "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist erneut"
	cont "gewachsen."

	para "Es war groß, als"
	line "ich es fing, aber"

	para "jetzt ist es noch"
	line "größer."
	done

TullyDefeatedMonText::
	text "Oh yo, ich schlug"
	line "ein wildes"
	cont "@"
	text_ram wStringBuffer4
	text " K.O."

	para "Es war riesig,"
	line "ungefähr soo groß."

	para "He, ich glaube, "
	line "man kann das am"
	cont "Telefon nicht"
	cont "beschreiben…"
	done

TullyLostAMonText::
	text "Oh yo, ich verlor"
	line "gegen ein wildes"
	cont "@"
	text_ram wStringBuffer4
	text "."

	para "Es war riesig,"
	line "ungefähr soo groß."

	para "He, ich glaube, "
	line "man kann das am"
	cont "Telefon nicht"
	cont "beschreiben…"
	done

TullyBattleRematchText::
	text "Wir sollten end-"
	line "lich kämpfen!"

	para "Ich angle hier:"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Schau mal vorbei,"
	line "wenn du Zeit hast."
	done

TullyHangUpText::
	text "Nun, ich werde"
	line "dich treffen."
	done

TullyFoundItemText::
	text "Ich fand etwas"
	line "Kleines am Ufer."

	para "Wie versprochen,"
	line "es gehört dir."

	para "Ich warte hier:"
	line "@"
	text_ram wStringBuffer5
	text "."
	done

TullyNoItemText::
	text "Ob ich etwas Gutes"
	line "gefunden habe?"

	para "Nö, noch nicht."

	para "Es ist wie beim"
	line "Angeln, du"
	cont "brauchst Geduld."
	done

TullyForwardText::
	text "Yo, AMADEUS hier…"

	para "<PLAY_G>? Was?"
	line "Du hast dich"
	cont "verirrt?"

	para "Wir kämpfen hier:"
	line "@"
	text_ram wStringBuffer5
	text "."
	done

TullyHurryText::
	text "Ich habe etwas"
	line "Tolles für dich."

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."
	done
