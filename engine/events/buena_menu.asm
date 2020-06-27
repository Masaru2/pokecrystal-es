INCLUDE "macros/code.inc"


SECTION "engine/events/buena_menu", ROMX

AskRememberPassword::
	call .DoMenu
	ld a, $0
	jr c, .okay
	ld a, $1

.okay
	ld [wScriptVar], a
	ret

.DoMenu:
if !DEF(_CRYSTAL_EU)
	lb bc, 14, 7
elif DEF(_CRYSTAL_DE)
	lb bc, 13, 7
elif DEF(_CRYSTAL_ES)
	lb bc, 15, 7
endc
	push bc
	ld hl, YesNoMenuHeader
	call CopyMenuHeader
	pop bc
	ld a, b
	ld [wMenuBorderLeftCoord], a
if !DEF(_CRYSTAL_EU)
	add $5
elif DEF(_CRYSTAL_DE)
	add $6
elif DEF(_CRYSTAL_ES)
	add $4
endc
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add $4
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	call VerticalMenu
	push af
	ld c, 15
	call DelayFrames
	call Buena_ExitMenu
	pop af
	jr c, .refused
	ld a, [wMenuCursorY]
	cp $2
	jr z, .refused
	and a
	ret

.refused
	ld a, $2
	ld [wMenuCursorY], a
	scf
	ret

Buena_ExitMenu::
	ldh a, [hOAMUpdate]
	push af
	call ExitMenu
	call UpdateSprites
	xor a
	ldh [hOAMUpdate], a
	call DelayFrame
	ld a, $1
	ldh [hOAMUpdate], a
	call ApplyTilemap
	pop af
	ldh [hOAMUpdate], a
	ret
