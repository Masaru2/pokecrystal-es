INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2


SECTION "maps/OlivineCafe", ROMX

OlivineCafe_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText:
	text "Ha! Deine #MON"
	line "sind ja nur Flie-"
	cont "gengewichte!"

	para "Sie haben nicht"
	line "die Kraft, Felsen"
	cont "aus dem Weg zu"
	cont "räumen."

	para "Hier, nimm das und"
	line "bring ihnen STÄRKE"
	cont "bei!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "Der Einzige, auf"
	line "den du dich auf"

	para "hoher See verlas-"
	line "sen kannst, bist"
	cont "du selbst!"

	para "Ich bin so stolz"
	line "auf mich selbst!"
	done

OlivineCafeFishingGuruText:
	text "Im OLIVIANA CITY-"
	line "CAFE gibt es nur"

	para "delikate Seemanns-"
	line "kost für MATROSEN"

	para "auf dem"
	line "Speiseplan!"
	done

OlivineCafeSailorText:
	text "Immer wenn ich in"
	line "diese Stadt komme,"

	para "gehe ich ins"
	line "OLIVIANA CITY-"
	cont "CAFE."

	para "Jedes Gericht auf"
	line "der Karte stärkt"

	para "mich. Ich kann"
	line "nicht aufhören zu"
	cont "essen!"
	done

OlivineCafe_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
