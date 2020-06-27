INCLUDE "macros/scripts/text.inc"


SECTION "data/phone/text/bill", ROMX

BillPhoneMornGreetingText::
	text "Guten Morgen!"

	para "Dies ist der VER-"
	line "WALTUNGSSERVICE"

	para "DES #MON-LAGE-"
	line "RUNGS-SYSTEMs."
	done

BillPhoneDayGreetingText::
	text "Guten Tag!"

	para "Dies ist der VER-"
	line "WALTUNGSSERVICE"

	para "DES #MON-LAGE-"
	line "RUNGS-SYSTEMs."
	done

BillPhoneNiteGreetingText::
	text "Guten Abend!"

	para "Dies ist der VER-"
	line "WALTUNGSSERVICE"

	para "DES #MON-LAGE-"
	line "RUNGS-SYSTEMs."
	done

BillPhoneGenericText::
	text "Wer ist dran?"

	para "<PLAY_G>, oder?"
	line "Moment noch…"

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText::
	text "Danke, dass du"
	line "gewartet hast!"

	para "<PLAY_G>, in der"
	line "BOX ist noch Platz"
	cont "für @"
	text_ram wStringBuffer3
	text " #MON."

	para "Schwing die Hufe"
	line "und mach sie voll!"
	done

BillPhoneNearlyFullText::
	text "Danke, dass du"
	line "gewartet hast!"

	para "<PLAY_G>, in der"
	line "BOX ist noch Platz"
	cont "für @"
	text_ram wStringBuffer3
	text " #MON."

	para "Wechsle doch die"
	line "BOX."
	done

BillPhoneFullText::
	text "Danke, dass du"
	line "gewartet hast!"

	para "<PLAY_G>, deine"
	line "BOX ist voll!"

	para "Wenn du mehr #-"
	line "MON fangen möch-"
	cont "test, musst du die"
	cont "BOX wechseln."
	done

BillPhoneNewlyFullText::
	text "Hi, <PLAY_G>?"
	line "Ich bin's, BILL!"

	para "Danke, dass du das"
	line "LAGERUNGS-SYSTEM"
	cont "benutzt."

	para "Deine aktuelle BOX"
	line "ist voll und kann"

	para "keine #MON"
	line "mehr aufnehmen."

	para "Du musst die BOX"
	line "wechseln, wenn du"

	para "mehr #MON fan-"
	line "gen willst."

	para "Bis dann!"
	done
