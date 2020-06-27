INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const REDSHOUSE1F_REDS_MOM


SECTION "maps/RedsHouse1F", ROMX

RedsHouse1F_MapScripts::
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

RedsMom:
	faceplayer
	opentext
	checkevent EVENT_MET_REDS_MOM
	iftrue .MetAlready
	writetext RedsMomText1
	waitbutton
	closetext
	setevent EVENT_MET_REDS_MOM
	end
.MetAlready:
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd picturebookshelf

RedsMomText1:
	text "Hi!"

	para "ROT ist schon seit"
	line "langem fort."

	para "Er hat sich auch"
	line "nicht gemeldet."

	para "Ich habe keine"
	line "Ahnung, wo er ist"
	cont "oder was er tut."

	para "Wenn man nichts"
	line "hört, soll das ja"

	para "heißen, dass es"
	line "ihm gut geht. Aber"
	cont "ich mache mir"
	cont "Sorgen um ihn."
	done

RedsMomText2:
	text "Ich habe Angst,"
	line "dass sich ROT"

	para "verletzt oder"
	line "krank wird. Aber"

	para "er ist ein Junge"
	line "und ich bin stolz,"

	para "dass er macht, was"
	line "ihm gefällt."
	done

RedsHouse1FTVText:
	text "Sie haben"
	line "Programme, die man"
	cont "in JOHTO nicht"
	cont "empfängt…"
	done

RedsHouse1F_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FTV

	db 1 ; object events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
