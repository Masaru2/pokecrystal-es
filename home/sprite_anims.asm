INCLUDE "macros/rst.inc"


SECTION "home/sprite_anims", ROM0

InitSpriteAnimStruct::
	ld [wSpriteAnimIDBuffer], a
	ldh a, [hROMBank]
	push af

	ld a, BANK(_InitSpriteAnimStruct)
	rst Bankswitch
	ld a, [wSpriteAnimIDBuffer]

	call _InitSpriteAnimStruct

	pop af
	rst Bankswitch

	ret

ReinitSpriteAnimFrame::
	ld [wSpriteAnimIDBuffer], a
	ldh a, [hROMBank]
	push af

	ld a, BANK(_ReinitSpriteAnimFrame)
	rst Bankswitch
	ld a, [wSpriteAnimIDBuffer]

	call _ReinitSpriteAnimFrame

	pop af
	rst Bankswitch

	ret
