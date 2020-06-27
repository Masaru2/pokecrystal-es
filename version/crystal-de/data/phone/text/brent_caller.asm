INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/brent_caller", ROMX

BrentRareTradeText::
	text "Oh yo, ich habe"
	line "vor geraumer Zeit"

	para "ein sehr seltenes"
	line "#MON in einem"
	cont "Tausch erhalten."

	para "Möchtest du wissen"
	line "welches?"

	para "Hehe, das verrate"
	line "ich dir nicht!"
	done

BrentDefeatedMonText::
	text "Yo, ich besiegte"
	line "dieses wilde"

	para "@"
	text_ram wStringBuffer4
	text "."
	line "Es war nicht sel-"
	cont "ten, daher habe"
	cont "ich es nicht"
	cont "gefangen."
	done

BrentLostAMonText::
	text "Oh yo, ich sah ein"
	line "seltenes #MON"
	cont "vor einer Stunde."

	para "Ich sah es zum"
	line "ersten Mal, aber"

	para "ich hatte keine"
	line "#BÄLLE dabei…"

	para "Würde sich BILL ob"
	line "meiner Fehler"
	cont "amüsieren?"
	done

BrentBattleRematchText::
	text "Du hast Zeit, wie"
	line "immer, oder?"

	para "Hast du Lust zu"
	line "kämpfen?"

	para "Es wäre eine"
	line "Chance, meine sel-"
	cont "tenen #MON zu"
	cont "sehen! Es wäre die"
	cont "Zeit wert!"

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."
	done

BrentHangUpText::
	text "Das war es also."
	done

BrentFatherGossipText::
	text "Wusstest du…?"
	line "BILLs Vater soll"

	para "ein wahrer"
	line "#MANIAC sein."
	done

BrentGrandpaGossipText::
	text "Wusstest du…?"
	line "Offensichtlich ist"

	para "BILLs Opa kein"
	line "#MANIAC."
	done

BrentGoldenrodGossipText::
	text "Wusstest du…?"
	line "BILL kommt"

	para "ursprünglich aus"
	line "DUKATIA CITY."
	done

BrentRoute25GossipText::
	text "Wusstest du…?"
	line "BILL lebt wahr-"
	cont "scheinlich auf"
	cont "ROUTE 25 in KANTO."
	done

BrentAbraGossipText::
	text "Wusstest du…?"
	line "ABRA war angeblich"

	para "BILLs erstes"
	line "#MON."
	done

BrentSisterGossipText::
	text "Wusstest du…?"
	line "BILLs jüngere"

	para "Schwester kann of-"
	line "fensichtlich nicht"
	cont "zwinkern."
	done

BrentMilkGossipText::
	text "Wusstest du…?"
	line "BILL hasst angeb-"
	cont "lich Milch und"

	para "kann sie nicht"
	line "trinken."
	done

BrentBattlingGossipText::
	text "Wusstest du…?"
	line "Offenbar ist BILL"

	para "kein wirklich"
	line "guter Kämpfer."
	done

BrentFlowerShopGossipText::
	text "Wusstest du…?"
	line "BILL scheint die"

	para "Frau vom BLUMEN-"
	line "LADEN zu mögen."
	done

BrentKimonoGirlGossipText::
	text "Wusstest du…?"
	line "BILLs Mutter soll"

	para "ein KIMONO-GIRL"
	line "gewesen sein."
	done

BrentSorryImTooBusyText::
	text "Du willst mehr"
	line "über BILL wissen?"

	para "Sorry, aber ich"
	line "bin beschäftigt."

	para "Ich rufe zurück,"
	line "wenn ich Zeit"
	cont "habe."
	done

BrentReminderText::
	text "Du willst meine"
	line "seltenen #MON"
	cont "sehen."

	para "Ich bin hier:"
	line "@"
	text_ram wStringBuffer5
	text "."
	done
