INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2


SECTION "maps/FastShipCabins_SE_SSE_CaptainsCabin", ROMX

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end

.LaterTrip:
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	opentext
	writetext SSAquaGranddaughterCaptainPlayWithMeText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext SSAquaGranddaughterHasToFindGrandpaText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, MovementData_0x76004
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	special FadeInQuickly
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, MovementData_0x7600c
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	opentext
	writetext SSAquaGranddaughterWasPlayingMText
	waitbutton
	closetext
	sjump .cont

.PlayerIsFemale:
	opentext
	writetext SSAquaGranddaughterWasPlayingFText
	waitbutton
	closetext
.cont:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, MovementData_0x76010
	opentext
	writetext SSAquaEntertainedGranddaughterText
	promptbutton
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_DEFAULT
	sjump SSAquaMetalCoatAndDocking

SSAquaGrandpa:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue SSAquaGotMetalCoat
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftrue SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_DEFAULT
	end

SSAquaMetalCoatAndDocking:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	closetext
	end

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	end

SSAquaGotMetalCoat:
	writetext SSAquaGrandpaTravellingText
	waitbutton
	closetext
	end

SSAquaGranddaughterAfter:
	faceplayer
	opentext
	writetext SSAquaGranddaughterHadFunText
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd trashcan

MovementData_0x76004:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x7600c:
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x76010:
	step DOWN
	step_end

SSAquaCaptainExhaustingText:
	text "Wow! Danke, dass"
	line "du mitgekommen"
	cont "bist."

	para "Es war sehr"
	line "schwer, das kleine"
	cont "Mädchen bei Laune"
	cont "zu halten."
	done

SSAquaCaptainHowDoYouLikeText:
	text "Hat dir die Fahrt"
	line "mit der M.S. AQUA"
	cont "gefallen?"

	para "Sie gleitet"
	line "regelrecht über"
	cont "die Wellen."
	done

SSAquaCantFindGranddaughterText:
	text "Oh, hallo…"

	para "Ich kann meine"
	line "Enkelin nirgendwo"
	cont "finden."

	para "Wenn sie an Bord"
	line "ist, ist alles"
	cont "in Ordnung."

	para "Sie ist ein"
	line "Energiebündel und"

	para "könnte jemanden"
	line "nerven. Ich mache"
	cont "mir ernsthaft"
	cont "Sorgen…"
	done

SSAquaEntertainedGranddaughterText:
	text "<PLAY_G>, oder? Ich"
	line "hörte, du hast"
	cont "meine Enkelin bei"
	cont "Laune gehalten."

	para "Ich möchte dir"
	line "dafür danken."
	done

SSAquaGrandpaHaveThisText:
	text "Ich möchte, dass"
	line "du das nimmst!"
	done

SSAquaGrandpaTravellingText:
	text "Wir reisen um"
	line "die Welt."
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "KAPITÄN, spielst"
	line "du mit mir?"

	para "Mir ist langwei-"
	line "lig! Ich möchte"
	cont "spielen!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "Hi! Willst du"
	line "mit mir"
	cont "spielen?"

	para "…Oh!"

	para "Opa sorgt sich"
	line "um mich?"

	para "Ich muss los!"

	para "Ich muss Opa"
	line "finden!"
	done

SSAquaGranddaughterWasPlayingMText:
	text "Hallo Opa, hier"
	line "bin ich! Ich habe"

	para "mit dem KAPITÄN"
	line "und ihm hier"
	cont "gespielt!"
	done

SSAquaGranddaughterWasPlayingFText:
	text "Hallo Opa, hier"
	line "bin ich! Ich habe"

	para "mit dem KAPITÄN"
	line "und ihr hier"
	cont "gespielt!"
	done

SSAquaGranddaughterHadFunText:
	text "Das Spielen hat"
	line "mir Spaß gemacht!"
	done

PokefanmColinSeenText:
	text "Hey, Winzling!"
	line "Möchtest du gegen"
	cont "mich antreten?"
	done

PokefanmColinBeatenText:
	text "Du bist stark!"
	done

PokefanmColinAfterBattleText:
	text "Du reist ganz"
	line "alleine?"

	para "Ist deine Mutter"
	line "nicht besorgt?"
	done

TwinsMegandpeg1SeenText:
	text "Du denkst, ich"
	line "bin noch ein Baby?"
	cont "Das ist gemein!"
	done

TwinsMegandpeg1BeatenText:
	text "Oh! Wir haben"
	line "verloren!"
	done

TwinsMegandpeg1AfterBattleText:
	text "“Baby” ist kein"
	line "schöner Name"
	cont "für Mädchen!"
	done

TwinsMegandpeg2SeenText:
	text "Ich bin kein Baby!"

	para "So etwas sagt man"
	line "nicht zu einer"
	cont "Dame!"
	done

TwinsMegandpeg2BeatenText:
	text "Oh! Wir haben"
	line "verloren!"
	done

TwinsMegandpeg2AfterBattleText:
	text "Manchmal sind"
	line "Kinder schlauer"
	cont "als Erwachsene!"
	done

PsychicRodneySeenText:
	text "Ssh! Mein Gehirn"
	line "empfängt Radio-"
	cont "wellen!"
	done

PsychicRodneyBeatenText:
	text "…Ich kann etwas"
	line "hören!"
	done

PsychicRodneyAfterBattleText:
	text "Ich verstehe! Man"
	line "kann den Radio-"
	cont "sender aus JOHTO"
	cont "auf dem SCHNELL-"
	cont "BOOT hören."
	done

PokefanmJeremySeenText:
	text "Was denkst du?"
	line "Meine #MON sind"
	cont "doch schön, oder?"
	done

PokefanmJeremyBeatenText:
	text "Oh, nein! Meine"
	line "schönen #MON!"
	done

PokefanmJeremyAfterBattleText:
	text "Ich muss in den"
	line "#MON-SALON, um"
	cont "sie zurechtmachen"
	cont "zu lassen!"
	done

PokefanfGeorgiaSeenText:
	text "Ich gehe ins"
	line "EINKAUFSZENTRUM"
	cont "und…"
	done

PokefanfGeorgiaBeatenText:
	text "Was wollte ich"
	line "tun?"
	done

PokefanfGeorgiaAfterBattleText:
	text "Oh, ja! Ich muss"
	line "meine #MON von"
	cont "der PENSION"
	cont "abholen!"
	done

SupernerdShawnSeenText:
	text "Was für #-"
	line "BÄLLE hast du"
	cont "dabei?"
	done

SupernerdShawnBeatenText:
	text "Warte! Halt!"
	line "Nicht! Bitte!"
	done

SupernerdShawnAfterBattleText:
	text "Der BALL, den du"
	line "einsetzt, muss zu"
	cont "der Situation"
	cont "passen."
	done

SSAquaHasArrivedVermilionText:
	text "Die M.S. AQUA legt"
	line "in"

	para "ORANIA CITY an."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents::
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	db 11 ; object events
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterAfter, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
