INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3
	const TINTOWER1F_SAGE4
	const TINTOWER1F_SAGE5
	const TINTOWER1F_SAGE6


SECTION "maps/TinTower1F", ROMX

TinTower1F_MapScripts::
	db 2 ; scene scripts
	scene_script .FaceSuicune ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .NPCsCallback
	callback MAPCALLBACK_TILES, .StairsCallback

.FaceSuicune:
	prioritysjump .SuicuneBattle
	end

.DummyScene:
	end

.NPCsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .FaceBeasts
	special BeastsCheck
	iffalse .FaceBeasts
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
.GotRainbowWing:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse .Done
	appear TINTOWER1F_EUSINE
.Done:
	return

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .FoughtSuicune
	appear TINTOWER1F_SUICUNE
	setval RAIKOU
	special MonCheck
	iftrue .NoRaikou
	appear TINTOWER1F_RAIKOU
	sjump .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_RAIKOU
.CheckEntei:
	setval ENTEI
	special MonCheck
	iftrue .NoEntei
	appear TINTOWER1F_ENTEI
	sjump .BeastsDone

.NoEntei:
	disappear TINTOWER1F_ENTEI
.BeastsDone:
	return

.FoughtSuicune:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	return

.StairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .DontHideStairs
	changeblock 10, 2, $09 ; floor
.DontHideStairs:
	return

.SuicuneBattle:
	applymovement PLAYER, TinTowerPlayerMovement1
	pause 15
	setval RAIKOU
	special MonCheck
	iftrue .Next1 ; if player caught Raikou, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTowerRaikouMovement1
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTowerRaikouMovement2
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	setval ENTEI
	special MonCheck
	iftrue .Next2 ; if player caught Entei, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTowerEnteiMovement1
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTowerEnteiMovement2
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTowerPlayerMovement2
	applymovement TINTOWER1F_SUICUNE, TinTowerSuicuneMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_NOTHING
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOTHING
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOTHING
	setscene SCENE_FINISHED
	clearevent EVENT_SET_WHEN_FOUGHT_HO_OH
	reloadmapafterbattle
	pause 20
	turnobject PLAYER, DOWN
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 10, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851ec
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 9, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, MovementData_0x1851f5
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 9, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, MovementData_0x1851fb
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 9, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, MovementData_0x1851fe
	moveobject TINTOWER1F_SAGE1, 7, 13
	moveobject TINTOWER1F_SAGE2, 9, 13
	moveobject TINTOWER1F_SAGE3, 11, 13
	turnobject PLAYER, RIGHT
	opentext
	writetext TinTowerEusineSuicuneText
	waitbutton
	closetext
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851f1
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage1Script:
	jumptextfaceplayer TinTower1FSage1Text

TinTower1FSage2Script:
	jumptextfaceplayer TinTower1FSage2Text

TinTower1FSage3Script:
	jumptextfaceplayer TinTower1FSage3Text

TinTower1FSage4Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage4Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage4Text2

TinTower1FSage5Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	writetext TinTower1FSage5Text1
	promptbutton
	verbosegiveitem RAINBOW_WING
	closetext
	refreshscreen
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock 10, 2, $20 ; stairs
	reloadmappart
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
.GotRainbowWing:
	writetext TinTower1FSage5Text2
	waitbutton
	closetext
	end

.FoughtHoOh:
	writetext TinTower1FSage5Text3
	waitbutton
	closetext
	end

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage6Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage6Text2

TinTowerEusine:
	jumptextfaceplayer TinTowerEusineHoOhText

TinTowerPlayerMovement1:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

TinTowerRaikouMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerRaikouMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step LEFT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerSuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerPlayerMovement2:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

MovementData_0x1851ec:
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x1851f1:
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x1851f5:
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x1851fb:
	step UP
	step UP
	step_end

MovementData_0x1851fe:
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end

TinTowerEusineSuicuneText:
	text "EUSIN: Wahnsinn!"
	line "Einfach Wahnsinn!"

	para "Einen derartigen"
	line "Kampf habe ich"
	cont "noch nie gesehen."

	para "Das hat mich sehr"
	line "beeindruckt."

	para "SUICUNE war stark,"
	line "aber du warst noch"

	para "unglaublicher,"
	line "<PLAYER>."

	para "Ich hörte, dass"
	line "SUICUNEs mystische"

	para "Kraft ein regen-"
	line "bogenfarbenes"
	cont "#MON anlockt."

	para "Vielleicht zeigt"
	line "sich dieses #-"
	cont "MON, nach dem, was"

	para "sich heute"
	line "ereignete."

	para "Ich werde diese"
	line "Legende noch"
	cont "einmal nachlesen."

	para "Danke, dass ich"
	line "diesem Spitzen-"

	para "kampf beiwohnen"
	line "durfte."

	para "Bis dann, <PLAYER>!"
	done

TinTower1FSage1Text:
	text "Die Legende besagt"
	line "…"

	para "Kommunizieren die"
	line "Seelen von #MON"

	para "und Menschen,"
	line "kommt ein regen-"
	cont "bogenfarbenes"

	para "#MON vom Himmel"
	line "herab…"

	para "Könnte das bedeu-"
	line "ten, dass die"

	para "legendären #MON"
	line "uns Menschen auf"
	cont "die Probe stellen?"
	done

TinTower1FSage2Text:
	text "Als der BRONZETURM"
	line "abbrannte, sollen"

	para "drei namenlose"
	line "#MON im Feuer"

	para "umgekommen sein."
	line "Eine Tragödie."

	para "Jedoch…"

	para "Ein regenbogen-"
	line "farbenes #MON…"

	para "Genauer gesagt…"

	para "HO-OH kam vom"
	line "Himmel herab und"

	para "erweckte die drei"
	line "#MON wieder zum"
	cont "Leben."

	para "Es sind…"

	para "SUICUNE, ENTEI und"
	line "RAIKOU."

	para "So lautet die"
	line "Legende."
	done

TinTower1FSage3Text:
	text "Die beiden TÜRME"
	line "wurden errichtet,"

	para "um Freundschaft"
	line "und Hoffnung"

	para "zwischen #MON"
	line "und den Menschen"
	cont "zu festigen."

	para "Das war vor 700"
	line "Jahren, aber die-"
	cont "se Maxime ist noch"
	cont "heute gültig."
	done

TinTower1FSage4Text1:
	text "Es scheint, als ob"
	line "HO-OH vom ZINNTURM"

	para "heruntergekommen"
	line "ist!"
	done

TinTower1FSage5Text1:
	text "Dies wird dich"
	line "schützen. Nimm es!"
	done

TinTower1FSage5Text2:
	text "Geh nun!"
	done

TinTower1FSage6Text1:
	text "Ich glaube, du"
	line "wirst geprüft."

	para "Sprenge die Ketten"
	line "der Unsicherheit"
	cont "von deinem Ver-"
	cont "stand und schreite"
	cont "voran."
	done

TinTowerEusineHoOhText:
	text "Ich wusste es."

	para "Ich wusste, dass"
	line "du das regenbogen-"
	cont "farbene #MON"

	para "sehen würdest,"
	line "<PLAYER>."

	para "Meine Vorhersehung"
	line "ist eingetreten."

	para "Meine Forschung"
	line "ist nicht übel,"
	cont "würde ich sagen."

	para "Ich werde weiter-"
	line "hin #MON stu-"
	cont "dieren, um ein be-"
	cont "rühmter #-"
	cont "MANIAC zu werden!"
	done

TinTower1FSage4Text2:
	text "Die legendären"
	line "#MON sollen"

	para "die drei Mächte"
	line "verkörpern…"

	para "Die Blitze, die im"
	line "TURM einschlugen."

	para "Das Feuer, das den"
	line "TURM zerstörte."

	para "Und den Regen, der"
	line "das Feuer löschte…"
	done

TinTower1FSage5Text3:
	text "Als das legendäre"
	line "#MON erschien…"

	para "Diejenigen, die"
	line "ihrem Aufstieg"

	para "beiwohnten, wurden"
	line "Zeugen ihres"
	cont "Terrors."

	para "Und…"

	para "Einige griffen zu"
	line "sinnlosen"
	cont "Attacken."

	para "Die legendären"
	line "#MON, wohl-"
	cont "wissend ob ihrer"

	para "Kraft, flohen und"
	line "ignorierten die"
	cont "geängstigten"
	cont "Menschen."
	done

TinTower1FSage6Text2:
	text "Von den legendären"
	line "#MON soll"

	para "SUICUNE die"
	line "stärkste Bindung"
	cont "zu HO-OH haben."

	para "Ich habe gehört,"
	line "dass es auch eine"

	para "Verbindung zu ei-"
	line "nem #MON namens"
	cont "ICOGNITO gibt."

	para "ICOGNITO muss"
	line "einen kooperativen"

	para "Bund mit SUICUNE"
	line "haben."
	done

TinTower1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  2, TIN_TOWER_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event  9,  9, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_SUICUNE
	object_event  7,  9, SPRITE_RAIKOU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_RAIKOU
	object_event 12,  9, SPRITE_ENTEI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_ENTEI
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTowerEusine, EVENT_TIN_TOWER_1F_EUSINE
	object_event  5,  9, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage1Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 14,  6, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage3Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 14,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
