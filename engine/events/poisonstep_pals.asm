INCLUDE "macros/code.inc"
INCLUDE "macros/gfx.inc"
INCLUDE "macros/rst.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/hardware_constants.inc"
INCLUDE "constants/wram_constants.inc"


SECTION "engine/events/poisonstep_pals", ROMX

LoadPoisonBGPals::
	call .LoadPals
	ldh a, [hCGB]
	and a
	ret nz
	ret ; ????

.LoadPals:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	cp DARKNESS_F
	ld a, %00000000
	jr z, .convert_pals
	ld a, %10101010

.convert_pals
	call DmgToCgbBGPals
	ld c, 4
	call DelayFrames
	farcall _UpdateTimePals
	ret

.cgb
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld c, 4 palettes
.loop
	ld a, LOW(palred 28 + palgreen 21 + palblue 31)
	ld [hli], a
	ld a, HIGH(palred 28 + palgreen 21 + palblue 31)
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ld c, 4
	call DelayFrames
	farcall _UpdateTimePals
	ret
