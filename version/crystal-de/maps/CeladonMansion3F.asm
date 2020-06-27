INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const CELADONMANSION3F_COOLTRAINER_M
	const CELADONMANSION3F_GYM_GUY
	const CELADONMANSION3F_SUPER_NERD
	const CELADONMANSION3F_FISHER


SECTION "maps/CeladonMansion3F", ROMX

CeladonMansion3F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

GameFreakGameDesignerScript:
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	readvar VAR_DEXCAUGHT
	ifgreater NUM_POKEMON - 2 - 1, .CompletedPokedex ; ignore Mew and Celebi
	waitbutton
	closetext
	end

.CompletedPokedex:
	promptbutton
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	promptbutton
	special Diploma
	writetext GameFreakGameDesignerAfterDiplomaText
	waitbutton
	closetext
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitbutton
	closetext
	end

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalse .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitbutton
	closetext
	end

.CancelPrinting:
; unused
	writetext GameFreakGraphicArtistErrorText
	waitbutton
	closetext
	end

GameFreakProgrammerScript:
	jumptextfaceplayer GameFreakProgrammerText

GameFreakCharacterDesignerScript:
	jumptextfaceplayer GameFreakCharacterDesignerText

CeladonMansion3FDevRoomSign:
	jumptext CeladonMansion3FDevRoomSignText

CeladonMansion3FDrawing:
	jumptext CeladonMansion3FDrawingText

CeladonMansion3FGameProgram:
	jumptext CeladonMansion3FGameProgramText

CeladonMansion3FReferenceMaterial:
	jumptext CeladonMansion3FReferenceMaterialText

GameFreakGameDesignerText:
	text "Ist das richtig?"

	para "Ich bin der"
	line "SPIELDESIGNER!"

	para "Es ist schwer,"
	line "den #DEX zu"
	cont "erstellen, aber"
	cont "gib nicht auf!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "Wow! Hervorragend!"
	line "Dein #DEX ist"
	cont "komplett!"

	para "Gratuliere!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "…"
	done

GameFreakGameDesignerAfterDiplomaText:
	text "Der GRAFIKER wird"
	line "dir ein DIPLOM"
	cont "ausdrucken."

	para "Gib ruhig damit"
	line "an."
	done

GameFreakGraphicArtistText:
	text "Ich bin der"
	line "GRAFIKER."

	para "Ich habe eine"
	line "Zeichnung von dir"
	cont "angefertigt!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "Ich bin der"
	line "GRAFIKER."

	para "Oh, du hast deinen"
	line "#DEX fertig"
	cont "gestellt?"

	para "Möchtest du, dass"
	line "ich dir ein DIPLOM"
	cont "ausdrucke?"
	done

GameFreakGraphicArtistRefusedText:
	text "Gib mir Bescheid,"
	line "wenn ich dir dein"
	cont "DIPLOM ausdrucken"
	cont "soll."
	done

GameFreakGraphicArtistErrorText:
	text "Irgendetwas stimmt"
	line "da nicht. Ich muss"
	cont "den Druckvorgang"
	cont "beenden."
	done

GameFreakProgrammerText:
	text "Wer, ich? Ich bin"
	line "der PROGRAMMIERER."

	para "Probier die"
	line "Spielautomaten"
	cont "aus!"
	done

GameFreakCharacterDesignerText:
	text "Sind die ZWILLINGE"
	line "nicht"
	cont "anbetungswürdig?"

	para "JASMIN ist auch"
	line "sehr hübsch."

	para "Oh, ich bete"
	line "sie an!"
	done

CeladonMansion3FDevRoomSignText:
	text "GAME FREAK"
	line "ENTWICKLUNGSRAUM"
	done

CeladonMansion3FDrawingText:
	text "Das ist eine sehr"
	line "detaillierte"
	cont "Zeichnung eines"
	cont "hübschen Mädchens."
	done

CeladonMansion3FGameProgramText:
	text "Das ist das Spiel-"
	line "programm. Die"

	para "falsche Handhabe"
	line "könnte Fehler im"
	cont "Spiel verursachen!"
	done

CeladonMansion3FReferenceMaterialText:
	text "Es ist angefüllt"
	line "mit Utensilien."
	cont "Da ist sogar eine"
	cont "#PUPPE."
	done

CeladonMansion3F_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, CELADON_MANSION_ROOF, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3
	warp_event  7,  0, CELADON_MANSION_ROOF, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5,  8, BGEVENT_UP, CeladonMansion3FDevRoomSign
	bg_event  4,  3, BGEVENT_UP, CeladonMansion3FDrawing
	bg_event  1,  6, BGEVENT_UP, CeladonMansion3FGameProgram
	bg_event  1,  3, BGEVENT_UP, CeladonMansion3FReferenceMaterial

	db 4 ; object events
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakProgrammerScript, -1
	object_event  0,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakCharacterDesignerScript, -1
