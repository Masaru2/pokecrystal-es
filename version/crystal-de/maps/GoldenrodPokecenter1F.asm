INCLUDE "constants/battle_tower_constants.inc"
INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F


SECTION "maps/GoldenrodPokecenter1F", ROMX

GoldenrodPokecenter1F_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd pokecenternurse

GoldenrodPokecenter1F_GSBallSceneLeft:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

; unused
UnknownText_0x61072:
	text_start
	done

UnknownText_0x610ce:
	text_start
	done

UnknownText_0x61111:
	text_start
	done

UnknownText_0x6113b:
	text_start
	done

UnknownText_0x611c9:
	text_start
	done

UnknownText_0x61271:
	text_start
	done

UnknownText_0x612d8:
	text_start
	done

UnknownText_0x61344:
	text_start
	done

UnknownText_0x6135f:
	text_start
	done

UnknownText_0x61375:
	text_start
	done

UnknownText_0x613a9:
	text_start
	done

UnknownText_0x613c8:
	text_start
	done

UnknownText_0x61409:
	text_start
	done

UnknownText_0x61438:
	text_start
	done

UnknownText_0x6145c:
	text_start
	done

UnknownText_0x6149a:
	text_start
	done

UnknownText_0x614ed:
	text_start
	done

UnknownText_0x61544:
	text_start
	done

UnknownText_0x615a5:
	text_start
	done

UnknownText_0x615c2:
	text_start
	done

UnknownText_0x6166e:
	text_start
	done

UnknownText_0x61689:
	text_start
	done

UnknownText_0x616b4:
	text_start
	done

UnknownText_0x616fb:
	text_start
	done

UnknownText_0x61727:
	text_start
	done

UnknownText_0x61749:
	text_start
	done

UnknownText_0x6176f:
	text_start
	done

UnknownText_0x617d2:
	text_start
	done

UnknownText_0x6191f:
	text_start
	done

UnknownText_0x61936:
	text_start
	done

UnknownText_0x61996:
	text_start
	done

UnknownText_0x619db:
	text_start
	done

UnknownText_0x619f5:
	text_start
	done

UnknownText_0x61a11:
	text_start
	done

UnknownText_0x61b7c:
	text_start
	done

UnknownText_0x61b9d:
	text_start
	done

UnknownText_0x61bc4:
	text_start
	done

UnknownText_0x61bdb:
	text_start
	done

UnknownText_0x61c18:
	text_start
	done

UnknownText_0x61c4b:
	text_start
	done

UnknownText_0x61c89:
	text "Dieses #MON-"
	line "CENTER ist riesig."

	para "Es wurde soeben"
	line "fertig. Es gibt"

	para "auch viele neue"
	line "Maschinen."
	done

UnknownText_0x61cef:
	text "Ich habe mir etwas"
	line "lustiges für die"
	cont "TAUSCHECKE aus-"
	cont "/LINE ADDEDgedacht"

	para "Ich gebe TAUBSI"
	line "einen BRIEF und"

	para "tausche es gegen"
	line "ein anderes!"

	para "Wenn das jeder"
	line "tut, könnte man"

	para "mit allen mög-"
	line "lichen Leuten"
	cont "BRIEFE tauschen!"

	para "Ich nenne das"
	line "TAUBSI-BRIEF!"

	para "Setzt es sich"
	line "durch, schließe"

	para "ich viele neue"
	line "Freundschaften!"
	done

UnknownText_0x61dfd:
	text "Sie sagen, dass"
	line "man dort sogar mit"

	para "Fremden tauschen"
	line "kann."

	para "Aber sie arbeiten"
	line "noch daran."
	done

UnknownText_0x61e5c:
	text "Ein mir fremdes"
	line "Mädchen schickte"

	para "mir ihr"
	line "HOPPSPROSS."

	para "Tausche #MON,"
	line "die du möchtest."
	done

UnknownText_0x61eb2:
	text "Ich erhielt ein"
	line "weibliches"
	cont "HOPPSPROSS, das"
	cont "SEAMUS heißt!"

	para "So heißt mein"
	line "Vater!"
	done

UnknownText_0x61efa:
	text "Welches ist die"
	line "NACHRICHTEN-"
	cont "MASCHINE?"

	para "Bezieht sie die"
	line "Nachrichten"
	cont "nur vom Radio?"
	done

UnknownText_0x61f48:
	text_start
	done

UnknownText_0x61fc9:
	text "Die Maschinen sind"
	line "noch nicht ein-"
	cont "satzbereit."

	para "Dennoch ist es"
	line "toll, solch einen"

	para "modernen Ort vor"
	line "allen anderen zu"
	cont "besuchen."
	done

UnknownText_0x6202c:
	text "Mein Freund war"
	line "neulich in den"

	para "NACHRICHTEN. Das"
	line "hat mich"
	cont "überrascht!"
	done

UnknownText_0x6206d:
	text "Ich werde unruhig,"
	line "wenn ich nicht"

	para "die neusten"
	line "NACHRICHTEN"

	para "bekomme!"
	done

UnknownText_0x620a1:
	text "Wenn ich in die"
	line "NACHRICHTEN komme,"

	para "werde ich berühmt"
	line "und verehrt."

	para "Wie kann ich es"
	line "bloß in die NACH-"
	cont "RICHTEN schaffen?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "Im oberen Stock-"
	line "werk findest du"

	para "das KOLOSSEUM."
	line "Hier kannst du"

	para "gegen Freunde"
	line "antreten."

	para "Kampfergebnisse"
	line "werden an der Wand"

	para "ausgehängt. Ich"
	line "kann es mir nicht"

	para "erlauben, zu ver-"
	line "lieren."
	done

UnknownText_0x62173:
	text "Ich bin sofort"
	line "hierher gekommen,"

	para "als ich hörte,"
	line "dass das #MON-"
	cont "CENTER in DUKATIA"

	para "neue Maschinen"
	line "hat."

	para "Aber es scheint,"
	line "als seien sie noch"

	para "mitten in den"
	line "Vorbereitungen…"
	done

UnknownText_0x62222:
	text "Allein das Be-"
	line "trachten dieser"

	para "neuen Errungen-"
	line "schaften macht"
	cont "mich jünger!"
	done

GoldenrodPokecenter1FLassText:
	text "Ein starkes #-"
	line "MON muss nicht"
	cont "zwingend gewinnen."

	para "Meist entscheidet"
	line "der Vor- oder"
	cont "Nachteil des Typs."

	para "Ich glaube nicht,"
	line "dass es ein #-"
	cont "MON gibt, das al-"
	cont "len anderen über-"
	cont "legen ist."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "<PLAYER>, oder?"

	para "Glückwunsch!"

	para "Nur für dich wurde"
	line "ein GS-BALL"
	cont "geschickt!"

	para "Nimm ihn bitte!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "Beehre uns bald"
	line "wieder!"
	done

UnknownText_0x62370:
	text_start
	done

UnknownText_0x623c7:
	text "Das ist eine #-"
	line "MON NACHRICHTEN-"
	cont "MASCHINE!"

	para "Sie ist noch nicht"
	line "in Betrieb…"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Oh, dein Beutel"
	line "sieht schwer aus!"

	para "Oh! Hast du zufäl-"
	line "lig etwas, das man"
	cont "ANARA-BRIEF nennt?"

	para "Meine Tochter"
	line "sucht danach."

	para "Du gibst mir doch"
	line "einen, nicht wahr?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "ANARA-BRIEF"
	line "weggeben?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Oh, großartig!"
	line "Danke, Schatz!"

	para "Hier, als Aus-"
	line "gleich sollst"
	cont "du das haben!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "Meine Tochter wird"
	line "entzückt sein!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? Du hast"
	line "keinen? Schade."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh… Ein anderes"
	line "Mal vielleicht."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> gibt den"
	line "ANARA-BRIEF weg."
	done

GoldenrodPokecenter1F_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 2 ; coord events
	coord_event  3,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneRight

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
