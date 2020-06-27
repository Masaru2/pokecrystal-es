INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const EARLSPOKEMONACADEMY_EARL
	const EARLSPOKEMONACADEMY_YOUNGSTER1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID2
	const EARLSPOKEMONACADEMY_YOUNGSTER2
	const EARLSPOKEMONACADEMY_POKEDEX


SECTION "maps/EarlsPokemonAcademy", ROMX

EarlsPokemonAcademy_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

AcademyEarl:
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

EarlsPokemonAcademyYoungster1Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster1Text

EarlsPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

EarlsPokemonAcademyYoungster2Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	sjump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "GIF@"
	db "PAR@"
	db "SLF@"
	db "BRT@"
	db "GFR@"
	db "ZUR.@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine:
; unused
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd difficultbookshelf

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "EARL, so lautet"
	line "mein Name!"

	para "Wunderbar sind"
	line "#MON, oui!"

	para "Isch werde dir"
	line "beibringen, ein"

	para "besserer Trainer"
	line "zu werden!"

	para "Was möchtest du"
	line "wissen? Willst ein"
	cont "Gewinner du sein?"
	done

AcademyEarlTeachHowToWinText:
	text "Gut! So lass misch"
	line "dir erklären!"

	para "Im Kampf wird das"
	line "erste #MON auf"
	cont "der Liste begin-"
	cont "nen!"

	para "Ändere die Auf-"
	line "stellung in der"
	cont "Liste, um dich den"
	cont "Gegebenheiten an-"
	cont "zupassen!"

	para "Möschtest du noch"
	line "mehr ören?"
	done

AcademyEarlTeachMoreText:
	text "Du möschtest also"
	line "wissen, wie man"
	cont "#MON rischtisch"
	cont "trainiert?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "Gut! So lass misch"
	line "erklären!"

	para "Selbst, wenn ein"
	line "#MON nur kurz"

	para "an einem Kampf"
	line "teilnimmt, erhält"
	cont "es einige EP."

	para "Platziere schwache"
	line "#MON an der"

	para "Spitze der Liste."
	line "Tausche sie dann"

	para "im Kampf gegen ein"
	line "anderes #MON."

	para "So können auch"
	line "schwache #MON"
	cont "stark werden!"
	done

AcademyEarlNoMoreToTeachText:
	text "Oh! Du bist eine"
	line "schlaue Schüler!"
	cont "Isch kann dir nun"
	cont "nischts mehr bei-"
	cont "bringen."

	para "Sei lieb zu deinen"
	line "#MON!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Ich mache mir No-"
	line "tizen über die"
	cont "Ausführungen."

	para "Besser, ich"
	line "schreibe auch"
	cont "alles von der Ta-"
	cont "fel ab."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "Ich tauschte mein"
	line "bestes #MON"
	cont "mit diesem Kerl."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "Hä? Das #MON,"
	line "das ich bekommen"
	cont "habe, hält etwas!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "Ein #MON, das"
	line "eine BEERE hält,"
	cont "wird sich im Kampf"
	cont "selbst heilen."

	para "Noch viele andere"
	line "Items können von"
	cont "#MON gehalten"
	cont "werden…"

	para "Es ist nicht ein-"
	line "fach, sich all"
	cont "diese Notizen zu"
	cont "machen…"
	done

AcademyBlackboardText:
	text "Auf der Tafel wer-"
	line "den die Statusver-"
	cont "änderungen von"

	para "#MON während"
	line "eines Kampfes er-"
	cont "klärt."
	done

AcademyBlackboardText2:
; unused
	text "Über welches Thema"
	line "willst du lesen?"
	done

AcademyPoisonText:
	text "Wird ein #MON"
	line "vergiftet, ver-"
	cont "liert es ständig"
	cont "KP."

	para "Die Vergiftung"
	line "dauert auch nach"

	para "dem Kampf noch an"
	line "und es verliert"
	cont "weiterhin KP."

	para "Um es zu heilen,"
	line "musst du GEGENGIFT"
	cont "einsetzen."
	done

AcademyParalysisText:
	text "Paralyse reduziert"
	line "die Geschwindig-"
	cont "keit und verhin-"
	cont "dert eventuell"
	cont "jede Bewegung."

	para "Sie dauert nach"
	line "dem Kampf noch an,"
	cont "also setze einen"
	cont "PARAHEILER ein."
	done

AcademySleepText:
	text "Schläft ein #-"
	line "MON, kann es nicht"
	cont "angreifen."

	para "Es wacht auch nach"
	line "dem Kampf nicht"
	cont "auf."

	para "Wecke es mit Hilfe"
	line "von AUFWECKER"
	cont "wieder auf."
	done

AcademyBurnText:
	text "Eine Verbrennung"
	line "lässt die KP ste-"
	cont "tig sinken und re-"
	cont "duziert die An-"
	cont "griffskraft."

	para "Die Verbrennung"
	line "bleibt nach dem"
	cont "Kampf bestehen."

	para "Verwende einen"
	line "FEUERHEILER zur"
	cont "Heilung."
	done

AcademyFreezeText:
	text "Ist dein #MON"
	line "eingefroren, ist"

	para "es zu keiner"
	line "Handlung fähig."

	para "Dieser Zustand"
	line "hält auch nach dem"

	para "Kampf an."
	line "Um es aufzutauen,"

	para "verwende einen"
	line "EISHEILER."
	done

AcademyNotebookText:
	text "Es ist das Notiz-"
	line "buch dieses Kin-"
	cont "des…"

	para "Fange #MON"
	line "mit #BÄLLEN."

	para "Bis zu sechs kön-"
	line "nen sich gleich-"
	cont "zeitig im Team be-"
	cont "finden."

	para "Weiterlesen?"
	done

AcademyNotebookText1:
	text "Bevor man den"
	line "#BALL wirft,"
	cont "muss das Ziel ge-"
	cont "schwächt werden."

	para "Ein vergiftetes"
	line "oder verbranntes"
	cont "#MON kann"
	cont "leichter gefangen"
	cont "werden."

	para "Weiterlesen?"
	done

AcademyNotebookText2:
	text "Manche Attacken"
	line "verwirren dein"
	cont "#MON."

	para "Ein verwirrtes"
	line "#MON kann sich"
	cont "auch selbst ver-"
	cont "letzen."

	para "Nach einem Kampf"
	line "endet auch die"
	cont "Verwirrung."

	para "Weiterlesen?"
	done

AcademyNotebookText3:
	text "Leute, die #-"
	line "MON fangen und in"

	para "Kämpfen einsetzen,"
	line "nennt man #-"
	cont "MON-Trainer."

	para "Man erwartet von"
	line "ihnen, dass sie"

	para "ARENEN besuchen"
	line "und gegen andere"
	cont "Trainer antreten."

	para "Die nächste Seite"
	line "ist… leer!"

	para "Junge: E-he-he…"

	para "Mehr habe ich"
	line "nicht aufgeschrie-"
	cont "ben…"
	done

AcademyStickerMachineText:
	text "Mit dieser Maschi-"
	line "ne kann man"

	para "Sticker drucken!"
	done

EarlsPokemonAcademy_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	db 6 ; object events
	object_event  4,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
