INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/battle_constants.inc"
INCLUDE "constants/pokemon_data_constants.inc"


SECTION "engine/pokemon/knows_move", ROMX

KnowsMove::
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld a, [wPutativeTMHMMove]
	ld b, a
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	cp b
	jr z, .knows_move
	dec c
	jr nz, .loop
	and a
	ret

.knows_move
	ld hl, .KnowsMoveText
	call PrintText
	scf
	ret

.KnowsMoveText:
	text_far _KnowsMoveText
	text_end
