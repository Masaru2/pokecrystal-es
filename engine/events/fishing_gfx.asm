INCLUDE "macros/code.inc"
INCLUDE "macros/gfx.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/hardware_constants.inc"
INCLUDE "constants/wram_constants.inc"


SECTION "engine/events/fishing_gfx", ROMX

LoadFishingGFX::
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a

	ld de, FishingGFX
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_gender
	ld de, KrisFishingGFX
.got_gender

	ld hl, vTiles0 tile $02
	call .LoadGFX
	ld hl, vTiles0 tile $06
	call .LoadGFX
	ld hl, vTiles0 tile $0a
	call .LoadGFX
	ld hl, vTiles0 tile $fc
	call .LoadGFX

	pop af
	ldh [rVBK], a
	ret

.LoadGFX:
	lb bc, BANK(FishingGFX), 2
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret

FishingGFX:
INCBIN "gfx/overworld/chris_fish.2bpp"

KrisFishingGFX:
INCBIN "gfx/overworld/kris_fish.2bpp"
