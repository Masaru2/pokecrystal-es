INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const DANCETHEATRE_KIMONO_GIRL1
	const DANCETHEATRE_KIMONO_GIRL2
	const DANCETHEATRE_KIMONO_GIRL3
	const DANCETHEATRE_KIMONO_GIRL4
	const DANCETHEATRE_KIMONO_GIRL5
	const DANCETHEATRE_GENTLEMAN
	const DANCETHEATRE_RHYDON
	const DANCETHEATRE_COOLTRAINER_M
	const DANCETHEATRE_GRANNY


SECTION "maps/DanceTheatre", ROMX

DanceTheatre_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerKimonoGirlNaoko2:
	trainer KIMONO_GIRL, NAOKO2, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaoko2SeenText, KimonoGirlNaoko2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaoko2AfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	sjump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end

DanceTheatreCooltrainerMScript:
	jumptextfaceplayer DanceTheatreCooltrainerMText

DanceTheatreGrannyScript:
	jumptextfaceplayer DanceTheatreGrannyText

DanceTheatreFancyPanel:
	jumptext DanceTheatreFancyPanelText

KimonoGirlNaoko2SeenText:
	text "Du hast hübsche"
	line "#MON. Darf ich"
	cont "sehen, wie sie"
	cont "kämpfen?"
	done

KimonoGirlNaoko2BeatenText:
	text "Oh, du bist sehr"
	line "stark."
	done

KimonoGirlNaoko2AfterBattleText:
	text "Das war ein toller"
	line "Kampf. Ich würde"
	cont "dich gerne mal"
	cont "wieder sehen."
	done

KimonoGirlSayoSeenText:
	text "Ich tanze immer"
	line "mit meinen #-"
	cont "MON. Natürlich"

	para "trainiere ich sie"
	line "auch."
	done

KimonoGirlSayoBeatenText:
	text "Oh, beinahe!"
	line "Fast hätte ich"
	cont "dich gehabt."
	done

KimonoGirlSayoAfterBattleText:
	text "Rhythmus ist nicht"
	line "nur zum Tanzen,"

	para "sondern auch für"
	line "#MON wichtig."
	done

KimonoGirlZukiSeenText:
	text "Ist meine Haar-"
	line "spange nicht"
	cont "hübsch?"

	para "Oh, ein #MON-"
	line "Kampf?"
	done

KimonoGirlZukiBeatenText:
	text "Ich habe keine"
	line "#MON mehr"
	cont "übrig…"
	done

KimonoGirlZukiAfterBattleText:
	text "Jeden Monat stecke"
	line "ich mir eine ande-"
	cont "re Blume in die"
	cont "Spange."
	done

KimonoGirlKuniSeenText:
	text "Oh, du scheinst"
	line "nett zu sein."
	cont "Willst du kämpfen?"
	done

KimonoGirlKuniBeatenText:
	text "Du bist stärker"
	line "als du aussiehst."
	done

KimonoGirlKuniAfterBattleText:
	text "Ich habe viel"
	line "trainiert. Also"

	para "dachte ich, ich"
	line "wäre gut. Aber ich"
	cont "bin es wohl nicht."
	done

KimonoGirlMikiSeenText:
	text "Gefällt dir mein"
	line "Tanz? Ich kenne"
	cont "mich auch gut mit"
	cont "#MON aus."
	done

KimonoGirlMikiBeatenText:
	text "Ooh, du kennst"
	line "dich auch gut mit"
	cont "#MON aus."
	done

KimonoGirlMikiAfterBattleText:
	text "Ich werde nicht"
	line "aufhören zu tan-"
	cont "zen, solange es"
	cont "Leute gibt, denen"

	para "ich dadurch Freude"
	line "bereite."

	para "Auch meine #MON"
	line "unterstützen mich"
	cont "dabei."
	done

SurfGuyNeverLeftAScratchText:
	text "Die KIMONO-GIRLS"
	line "sind nicht nur"

	para "großartige Tänzer,"
	line "sie sind auch gute"
	cont "#MON-Trainer."

	para "Ich fordere sie"
	line "ständig heraus,"

	para "konnte sie aber"
	line "noch nie besiegen…"
	done

SurfGuyLadGiftText:
	text "Junge! Wenn du"
	line "alle KIMONO-GIRLS"

	para "besiegst, gebe ich"
	line "dir ein Geschenk."
	done

SurfGuyLassieGiftText:
	text "Kleine! Wenn du"
	line "alle KIMONO-GIRLS"

	para "besiegst, gebe ich"
	line "dir ein Geschenk."
	done

SurfGuyLikeADanceText:
	text "Die Art wie du"
	line "kämpfst, ist wie"
	cont "ein Tanz."

	para "So etwas sieht man"
	line "nicht oft!"

	para "Ich möchte dir et-"
	line "was geben. Nur zu!"
	cont "Nimm es ruhig!"
	done

SurfGuySurfExplanationText:
	text "Das ist SURFER."

	para "Damit können #-"
	line "MON jedes Gewässer"
	cont "überqueren."
	done

SurfGuyElegantKimonoGirlsText:
	text "Ich wünschte, mei-"
	line "ne #MON wären"
	cont "so elegant wie die"
	cont "KIMONO-GIRLS…"
	done

RhydonText:
	text "RIZEROS: Gugooh"
	line "gugogooh!"
	done

DanceTheatreCooltrainerMText:
	text "Dieser Mann hat"
	line "immer sein RIZEROS"
	cont "dabei."

	para "Er sagt, dass er"
	line "ein #MON haben"
	cont "will, das SURFEN"
	cont "und tanzen kann."

	para "Versucht er etwa,"
	line "ein Mono-Synchron-"
	cont "Schwimm-#MON zu"
	cont "besitzen?"
	done

DanceTheatreGrannyText:
	text "Die KIMONO-GIRLS"
	line "sind so hübsch…"

	para "Aber sie müssen"
	line "hart trainieren."

	para "Und sie müssen"
	line "so viele Dinge"

	para "lernen, bevor sie"
	line "öffentlich auftre-"
	cont "ten."

	para "Aber wenn du etwas"
	line "liebst, ist alles"
	cont "möglich."
	done

DanceTheatreFancyPanelText:
	text "Eine hübsche, mit"
	line "Blumen dekorierte"
	cont "Tafel."
	done

DanceTheatre_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  6, BGEVENT_UP, DanceTheatreFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheatreFancyPanel

	db 9 ; object events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko2, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheatreCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheatreGrannyScript, -1
