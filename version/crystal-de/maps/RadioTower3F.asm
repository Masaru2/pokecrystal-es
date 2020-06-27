INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUY
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST


SECTION "maps/RadioTower3F", ROMX

RadioTower3F_MapScripts::
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	return

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	return

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetext RadioTower3FGymGuyText_Rockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FGymGuyText
	waitbutton
	closetext
	end

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue .GotSunnyDay
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetext RadioTower3FCooltrainerFPleaseSaveDirectorText
	waitbutton
	closetext
	end

.UsedCardKey:
	writetext RadioTower3FCooltrainerFIsDirectorSafeText
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegiveitem TM_SUNNY_DAY
	iffalse .NoRoom
	writetext RadioTower3FCooltrainerFItsSunnyDayText
	waitbutton
	closetext
	setevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end

.GotSunnyDay:
	writetext RadioTower3FCooltrainerFYouWereMarvelousText
	waitbutton
.NoRoom:
	closetext
	end

TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	reloadmappart
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "Wir haben die Rufe"
	line "von allen bekann-"
	cont "ten #MON auf"

	para "Tonband."
	line "Es sind zirka 200."
	done

RadioTower3FGymGuyText_Rockets:
	text "Für Trainer sind"
	line "#MON wie"
	cont "Lebenspartner."

	para "Es ist schreck-"
	line "lich, wie TEAM"

	para "ROCKET versucht,"
	line "alle #MON zu"
	cont "kontrollieren."
	done

RadioTower3FGymGuyText:
	text "Bei uns gibt"
	line "es rund um die Uhr"

	para "Unterhaltungs-"
	line "sendungen."

	para "Ich versuche"
	line "auch, rund um die"
	cont "Uhr zu arbeiten!"
	done

RadioTower3FCooltrainerFPleaseSaveDirectorText:
	text "Der Anführer von"
	line "TEAM ROCKET hat"
	cont "sich selbst"
	cont "eingeschlossen."

	para "Aber der INTENDANT"
	line "besitzt einen"
	cont "Schlüssel."

	para "Du findest ihn"
	line "im vierten Stock."

	para "Bitte rette ihn!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "Hast du den"
	line "INTENDANTEN"
	cont "retten können?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "Danke!"
	line "Du bist mein Held!"

	para "Dies ist ein"
	line "Zeichen meiner"
	cont "Wertschätzung."
	done

RadioTower3FCooltrainerFItsSunnyDayText:
	text "Es ist SONNENTAG."
	line "Feuerattacken"
	cont "werden kurzzeitig"
	cont "verstärkt."
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "Du warst einfach"
	line "traumhaft!"
	done

GruntM7SeenText:
	text "Mir wurden strikte"
	line "Befehle erteilt."

	para "Ich soll jeden,"
	line "der TEAM ROCKET"
	cont "herausfordert,"
	cont "pulverisieren!"
	done

GruntM7BeatenText:
	text "Was?!"
	done

GruntM7AfterBattleText:
	text "Ich bin meinen"
	line "Pflichten nicht"
	cont "nachgekommen…"

	para "Ich werde dafür"
	line "bezahlen müssen…"
	done

GruntM8SeenText:
	text "Es ist ein tolles"
	line "Gefühl, #MON"
	cont "für Verbrechen"
	cont "einzusetzen."
	done

GruntM8BeatenText:
	text "Machst du Witze?"
	done

GruntM8AfterBattleText:
	text "Verlieren macht"
	line "mich mürrisch!"

	para "Mist! Ich hasse"
	line "unfähige #MON!"
	done

GruntM9SeenText:
	text "Warum hat sich der"
	line "Rollladen geöff-"
	cont "net? Hast du etwas"
	cont "damit zu tun?"
	done

GruntM9BeatenText:
	text "Ich bin erledigt!"
	done

GruntM9AfterBattleText:
	text "Was?! Du bist an"
	line "unseren Männern im"
	cont "UNTERGRUND"
	cont "vorbeigekommen?"

	para "Wie hast du das"
	line "fertiggebracht?"
	done

ScientistMarcSeenText:
	text "Was macht ein"
	line "fremdes Kind hier?"

	para "Wer bist du?"
	done

ScientistMarcBeatenText:
	text "Ts! Ich habe"
	line "dich nicht"
	cont "ernst genommen!"
	done

ScientistMarcAfterBattleText:
	text "Huahahaha…"

	para "Ich kann Signale"
	line "jeder Stärke von"
	cont "hier aussenden."
	done

RadioTower3FCardKeySlotText:
	text "Dies ist der"
	line "Schlitz für"
	cont "den TÜRÖFFNER."
	done

InsertedTheCardKeyText:
	text "<PLAYER> benutzt"
	line "den TÜRÖFFNER."
	done

RadioTower3FPersonnelSignText:
	text "2S PERSONAL"
	done

RadioTower3FPokemonMusicSignText:
	text "#MON-MUSIK mit"
	line "DJ BEN"
	done

RadioTower3F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	db 7 ; object events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuyScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
