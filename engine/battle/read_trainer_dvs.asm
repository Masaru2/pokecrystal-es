INCLUDE "macros/data.inc"


SECTION "engine/battle/read_trainer_dvs", ROMX

GetTrainerDVs::
; Return the DVs of wOtherTrainerClass in bc

	push hl
	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0

	ld hl, TrainerClassDVs
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld b, a
	ld c, [hl]

	pop hl
	ret

INCLUDE "data/trainers/dvs.inc"
