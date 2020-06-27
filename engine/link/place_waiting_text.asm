INCLUDE "macros/coords.inc"
INCLUDE "macros/predef.inc"
INCLUDE "constants/charmap.inc"
INCLUDE "constants/gfx_constants.inc"


SECTION "engine/link/place_waiting_text", ROMX

PlaceWaitingText::
if !DEF(_CRYSTAL_EU)
	hlcoord 3, 10
	ld b, 1
	ld c, 11
elif DEF(_CRYSTAL_DE)
	hlcoord 2, 10
	ld b, 1
	ld c, 14
elif DEF(_CRYSTAL_ES)
	hlcoord 4, 10
	ld b, 1
	ld c, 10
endc

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call Textbox
	jr .proceed

.notinbattle
	predef LinkTextboxAtHL

.proceed
if !DEF(_CRYSTAL_EU)
	hlcoord 4, 11
elif DEF(_CRYSTAL_DE)
	hlcoord 3, 11
elif DEF(_CRYSTAL_ES)
	hlcoord 5, 11
endc
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames

.Waiting:
if !DEF(_CRYSTAL_EU)
	db "Waiting...!@"
elif DEF(_CRYSTAL_DE)
	db "BITTE WARTEN…!@"
elif DEF(_CRYSTAL_ES)
	db "¡ESPERA.…!@"
endc
