INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU


SECTION "maps/LakeOfRageMagikarpHouse", ROMX

LakeOfRageMagikarpHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign:
; unused
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd difficultbookshelf

MagikarpLengthRaterText_LakeOfRageHistory:
	text "Der SEE DES ZORNS"
	line "ist eigentlich ein"

	para "Krater, der durch"
	line "wütende GARADOS"
	cont "erschaffen wurde."

	para "Der Krater füllte"
	line "sich mit Regenwas-"
	cont "ser und so ent-"
	cont "stand der See."

	para "Diese Geschichte"
	line "erzählte schon"

	para "der Ur-Urgroßvater"
	line "meines Großvaters."

	para "Früher konnte man"
	line "hier quicklebendi-"
	cont "ge KARPADOR fan-"
	cont "gen, aber…"

	para "Ich verstehe"
	line "nicht, was hier"
	cont "geschieht."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Der SEE hat sich"
	line "verändert, seit"

	para "diese Männer in"
	line "Schwarz hier sind."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Der SEE DES ZORNS"
	line "ist wieder normal."

	para "Die KARPADOR sind"
	line "wieder zurück."

	para "Vielleicht geht"
	line "nun mein Traum in"
	cont "Erfüllung, das"
	cont "größte KARPADOR"
	cont "der Welt zu sehen!"

	para "Hast du eine"
	line "ANGEL? Wenn ja,"
	cont "dann hilf mir"
	cont "bitte!"
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, du hast ein"
	line "KARPADOR! Lass uns"

	para "sehen, wie groß"
	line "das Kleine ist."
	done

MagikarpLengthRaterText_Memento:
	text "Wow! Das ist ja"
	line "riesig!"

	para "Ich ziehe meinen"
	line "Hut vor dir!"

	para "Nimm das als An-"
	line "denken!"
	done

MagikarpLengthRaterText_Bonus:
	text "Wichtig ist nur"
	line "die Erinnerung."

	para "Sieh es als eine"
	line "Art Bonus!"
	done

MagikarpLengthRaterText_TooShort:
	text "Wow! Das ist ja"
	line "riesig!"

	para "…Zumindest würde"
	line "ich das gerne sa-"
	cont "gen, aber ich habe"

	para "schon größere ge-"
	line "sehen."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Was? Das ist kein"
	line "KARPADOR!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh… Du hast also"
	line "keines, das es"

	para "wert wäre, mir zu"
	line "zeigen? Vielleicht"
	cont "beim nächsten Mal."
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "Aktueller Rekord"

	para "@"
	text_ram wStringBuffer3
	text " von"
	line "@"
	text_ram wStringBuffer4
	text_end

	text_end ; unused

LakeOfRageMagikarpHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
