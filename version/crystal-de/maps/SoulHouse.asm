INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY


SECTION "maps/SoulHouse", ROMX

SoulHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "MR. FUJI: Sei"
	line "willkommen."

	para "Hm… Du scheinst"
	line "deine #MON"

	para "mit Sorgfalt und"
	line "Liebe aufzuziehen."

	para "Solche, die #-"
	line "MON verehren,"

	para "zollen hier den"
	line "dahingegangenen"
	cont "#MON ihren"
	cont "Respekt."

	para "Bekunde bitte dein"
	line "Beileid für die"

	para "Seelen der"
	line "dahingegangenen"
	cont "#MON."

	para "Ich bin sicher,"
	line "das macht sie"
	cont "glücklich."
	done

SoulHouseTeacherText:
	text "Ich glaube, hier"
	line "liegen noch andere"
	cont "#MON begraben."

	para "Es gibt viele"
	line "Kammern, die nur"
	cont "MR. FUJI betreten"
	cont "darf."
	done

SoulHouseLassText:
	text "Ich besuche mit"
	line "meiner Mutter die"
	cont "Grabmale der"
	cont "#MON…"
	done

SoulHouseGrannyText:
	text "Die #MON, die"
	line "bei mir lebten…"

	para "Ich hatte sie so"
	line "lieb wie meine"
	cont "Enkelkinder…"
	done

SoulHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
