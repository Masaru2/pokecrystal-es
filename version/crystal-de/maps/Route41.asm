INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5


SECTION "maps/Route41", ROMX

Route41_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock:
; unused
	jumpstd smashrock

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "Das Wasser ist"
	line "schön warm. Ich"
	cont "bin also sehr"
	cont "locker und gelenk."

	para "Natürlich trete"
	line "ich gegen dich an!"
	done

SwimmermCharlieBeatenText:
	text "Oje! Ich habe eine"
	line "Gänsehaut!"
	done

SwimmermCharlieAfterBattleText:
	text "Ist es nicht"
	line "sehr entspannend,"
	cont "sich auf dem"
	cont "Wasser treiben"
	cont "zu lassen?"
	done

SwimmermGeorgeSeenText:
	text "Ich bin etwas"
	line "müde. Wenn ich"
	cont "gewinne, leihst du"
	cont "mir dein #MON."
	done

SwimmermGeorgeBeatenText:
	text "Keuch, japs…"
	done

SwimmermGeorgeAfterBattleText:
	text "ANEMONIA CITY ist"
	line "noch so weit weg."

	para "Aber der Rückweg"
	line "nach OLIVIANA CITY"
	cont "ist auch nicht"
	cont "viel kürzer."

	para "Was soll ich tun?"
	done

SwimmermBerkeSeenText:
	text "Siehst du diese"
	line "Inseln, die von"
	cont "den Strudeln"
	cont "blockiert werden?"

	para "Dort gibt es"
	line "bestimmt ein"
	cont "Geheimnis!"
	done

SwimmermBerkeBeatenText:
	text "Was ist das"
	line "Geheimnis deiner"
	cont "Stärke?"
	done

SwimmermBerkeAfterBattleText:
	text "Die Nacht war"
	line "dunkel und ein"
	cont "Sturm wütete…"

	para "Da sah ich dieses"
	line "riesige #MON"
	cont "über den Inseln"
	cont "aufsteigen."

	para "Aus seinen"
	line "silbernen Flügeln"
	cont "fielen ein paar"
	cont "Federn."
	done

SwimmermKirkSeenText:
	text "Hier gibt es hohe"
	line "Wellen."

	para "Das macht dich"
	line "schnell müde."
	done

SwimmermKirkBeatenText:
	text "Ich bin besiegt!"
	done

SwimmermKirkAfterBattleText:
	text "Die Strömung ist"
	line "zu stark. Ich kann"
	cont "die Insel nicht"
	cont "erreichen."
	done

SwimmermMathewSeenText:
	text "Suchst du die"
	line "Geheimnisse der"
	cont "STRUDELINSELN?"
	done

SwimmermMathewBeatenText:
	text "Ach. Du hast viel"
	line "Ausdauer!"
	done

SwimmermMathewAfterBattleText:
	text "Ein Geheimnis"
	line "der STRUDELINSELN…"

	para "Es ist kohlraben-"
	line "schwarz darinnen!"
	done

SwimmerfKayleeSeenText:
	text "Ich bin auf dem"
	line "Weg zu den"
	cont "STRUDELINSELN."

	para "Ich gehe mit"
	line "meinen Kameraden"
	cont "auf Erkundungs-"
	cont "reise."
	done

SwimmerfKayleeBeatenText:
	text "Ist es so richtig?"
	done

SwimmerfKayleeAfterBattleText:
	text "Tief versteckt"
	line "auf den STRUDEL-"
	cont "INSELN soll ein"
	cont "großes #MON"
	cont "leben."

	para "Was für ein #-"
	line "MON das wohl ist?"
	done

SwimmerfSusieSeenText:
	text "Du gleitest so"
	line "elegant auf deinem"
	cont "#MON dahin."
	done

SwimmerfSusieBeatenText:
	text "Ich bin"
	line "geschlagen…"
	done

SwimmerfSusieAfterBattleText:
	text "Gab es da nicht"
	line "einmal einen Hit,"
	cont "der von einem"
	cont "Jungen handelte,"
	cont "der auf einem"
	cont "LAPRAS ritt?"
	done

SwimmerfDeniseSeenText:
	text "Das Wetter ist so"
	line "herrlich. Ich bin"
	cont "richtig benommen!"
	done

SwimmerfDeniseBeatenText:
	text "Ohhh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Ein Sonnenbrand"
	line "ist sehr schlecht"
	cont "für die Haut."

	para "Aber ich benutze"
	line "keine Sonnencreme."

	para "Ich möchte das"
	line "Wasser nicht"
	cont "verschmutzen."
	done

SwimmerfKaraSeenText:
	text "Wenn du eine Pause"
	line "brauchst, dann"
	cont "halte deinen Kopf"
	cont "über Wasser und"
	cont "paddle mit den"
	cont "Füßen."

	para "Auf diese Weise"
	line "legst du eine"

	para "Ruhepause ein und"
	line "sammelst Energie."
	done

SwimmerfKaraBeatenText:
	text "Oh! Du bist aus-"
	line "geruhter als ich."
	done

SwimmerfKaraAfterBattleText:
	text "Ich habe tief aus"
	line "dem Inneren der"
	cont "STRUDELINSELN ein"
	cont "Brüllen gehört."
	done

SwimmerfWendySeenText:
	text "NACHTs sammeln"
	line "sich STERNDU"
	cont "nahe der Wasser-"
	cont "oberfläche."
	done

SwimmerfWendyBeatenText:
	text "Oje…"
	done

SwimmerfWendyAfterBattleText:
	text "In der Gruppe"
	line "fangen"
	cont "STERNDU an"
	cont "zu leuchten."

	para "Das ist"
	line "wunderschön und"
	cont "beängstigend"
	cont "zugleich."
	done

Route41_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	db 10 ; object events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
