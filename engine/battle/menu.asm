INCLUDE "macros/code.inc"
INCLUDE "macros/coords.inc"
INCLUDE "macros/data.inc"
INCLUDE "constants/charmap.inc"
INCLUDE "constants/menu_constants.inc"
INCLUDE "constants/text_constants.inc"


SECTION "engine/battle/menu", ROMX

LoadBattleMenu::
	ld hl, BattleMenuHeader
	call LoadMenuHeader
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call InterpretBattleMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

SafariBattleMenu:
; untranslated
	ld hl, MenuHeader_0x24f4e
	call LoadMenuHeader
	jr Function24f19

ContestBattleMenu::
	ld hl, MenuHeader_0x24f89
	call LoadMenuHeader

Function24f19:
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call _2DMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

BattleMenuHeader::
	db MENU_BACKUP_TILES ; flags
if !DEF(_CRYSTAL_EU)
	menu_coords 8, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
elif DEF(_CRYSTAL_DE)
	menu_coords 4, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
elif DEF(_CRYSTAL_ES)
	menu_coords 6, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
endc
	dw MenuData_0x24f34
	db 1 ; default option

MenuData_0x24f34:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
if !DEF(_CRYSTAL_EU)
	db 6 ; spacing
elif DEF(_CRYSTAL_DE)
	db 7 ; spacing
elif DEF(_CRYSTAL_ES)
	db 8 ; spacing
endc
	dba Strings24f3d
	dbw BANK(MenuData_0x24f34), 0

Strings24f3d:
if !DEF(_CRYSTAL_EU)
	db "FIGHT@"
	db "<PKMN>@"
	db "PACK@"
	db "RUN@"
elif DEF(_CRYSTAL_DE)
	db "KMPF@"
	db "<PKMN>@"
	db "BEUTEL@"
	db "FLUCHT@"
elif DEF(_CRYSTAL_ES)
	db "LUCHA@"
	db "<PKMN>@"
	db "MOCHILA@"
	db "ESC@"
endc

MenuHeader_0x24f4e:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f56
	db 1 ; default option

MenuData_0x24f56:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba Strings24f5f
	dba Function24f7c

Strings24f5f:
	db "サファりボール×　　@" ; "SAFARI BALL×  @"
	db "エサをなげる@" ; "THROW BAIT"
	db "いしをなげる@" ; "THROW ROCK"
	db "にげる@" ; "RUN"

Function24f7c:
	hlcoord 17, 13
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

MenuHeader_0x24f89:
	db MENU_BACKUP_TILES ; flags
if !DEF(_CRYSTAL_EU)
	menu_coords 2, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
elif DEF(_CRYSTAL_DE)
	menu_coords 3, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
elif DEF(_CRYSTAL_ES)
	menu_coords 6, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
endc
	dw MenuData_0x24f91
	db 1 ; default option

MenuData_0x24f91:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
if !DEF(_CRYSTAL_EU)
	db 12 ; spacing
elif DEF(_CRYSTAL_DE)
	db 8 ; spacing
elif DEF(_CRYSTAL_ES)
	db 8 ; spacing
endc
	dba Strings24f9a
	dba Function24fb2

Strings24f9a:
if !DEF(_CRYSTAL_EU)
	db "FIGHT@"
	db "<PKMN>@"
	db "PARKBALL×  @"
	db "RUN@"
elif DEF(_CRYSTAL_DE)
	db "KMPF@"
	db "<PKMN>@"
	db "BALL×  @"
	db "FLUCHT@"
elif DEF(_CRYSTAL_ES)
	db "LUCHA@"
	db "<PKMN>@"
	db "BALL×  @"
	db "ESC@"
endc

Function24fb2:
if !DEF(_CRYSTAL_DE)
	hlcoord 13, 16
else
	hlcoord 10, 16
endc
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
