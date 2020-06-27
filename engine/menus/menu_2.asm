INCLUDE "macros/code.inc"
INCLUDE "macros/coords.inc"
INCLUDE "macros/data.inc"
INCLUDE "macros/rst.inc"
INCLUDE "constants/charmap.inc"
INCLUDE "constants/item_constants.inc"
INCLUDE "constants/menu_constants.inc"
INCLUDE "constants/text_constants.inc"
INCLUDE "constants/wram_constants.inc"


SECTION "engine/menus/menu_2@PlaceMenuItemName", ROMX

PlaceMenuItemName::
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	pop hl
	call PlaceString
	ret


SECTION "engine/menus/menu_2@PlaceMenuItemQuantity", ROMX

PlaceMenuItemQuantity::
	push de
	ld a, [wMenuSelection]
	ld [wCurItem], a
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	pop hl
	and a
	jr nz, .done
	ld de, $15
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wMenuSelectionQuantity
	lb bc, 1, 2
	call PrintNum

.done
	ret


SECTION "engine/menus/menu_2@PlaceMoneyTextbox", ROMX

PlaceMoneyTopRight::
	ld hl, MenuHeader_0x24b15
	call CopyMenuHeader
	jr PlaceMoneyTextbox

PlaceMoneyBottomLeft::
	ld hl, MenuHeader_0x24b1d
	call CopyMenuHeader
	jr PlaceMoneyTextbox

PlaceMoneyAtTopLeftOfTextbox::
	ld hl, MenuHeader_0x24b15
	lb de, 0, 11
	call OffsetMenuHeader

PlaceMoneyTextbox:
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	ret

MenuHeader_0x24b15:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 0, SCREEN_WIDTH - 1, 2
	dw NULL
	db 1 ; default option

MenuHeader_0x24b1d:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 11, 8, 13
	dw NULL
	db 1 ; default option


SECTION "engine/menus/menu_2@DisplayCoinCaseBalance", ROMX

DisplayCoinCaseBalance::
	; Place a text box of size 1x7 at 11, 0.
	hlcoord 11, 0
	ld b, 1
	ld c, 7
	call Textbox
	hlcoord 12, 0
	ld de, CoinString
	call PlaceString
	hlcoord 17, 1
	ld de, ShowMoney_TerminatorString
	call PlaceString
	ld de, wCoins
	lb bc, 2, 4
	hlcoord 13, 1
	call PrintNum
	ret

DisplayMoneyAndCoinBalance::
	hlcoord 5, 0
	ld b, 3
	ld c, 13
	call Textbox
	hlcoord 6, 1
	ld de, MoneyString
	call PlaceString
	hlcoord 12, 1
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 6, 3
	ld de, CoinString
	call PlaceString
if !DEF(_CRYSTAL_ES)
	hlcoord 15, 3
else
	hlcoord 14, 3
endc
	ld de, wCoins
	lb bc, 2, 4
	call PrintNum
	ret

if !DEF(_CRYSTAL_EU)
MoneyString: db "MONEY@"
CoinString:  db "COIN@"
elif DEF(_CRYSTAL_DE)
MoneyString: db "GELD@"
CoinString:  db "MÜNZEN@"
elif DEF(_CRYSTAL_ES)
MoneyString: db "DIN.@"
CoinString:  db "FICHAS@"
endc

ShowMoney_TerminatorString: db "@"


SECTION "engine/menus/menu_2@Unreferenced_Function24b8f", ROMX

Unreferenced_Function24b8f:
; related to safari?
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	hlcoord 0, 0
	ld b, 3
	ld c, 7
	call Textbox
	hlcoord 1, 1
	ld de, wSafariTimeRemaining
	lb bc, 2, 3
	call PrintNum
	hlcoord 4, 1
	ld de, .slash_500
	call PlaceString
	hlcoord 1, 3
	ld de, .booru_ko
	call PlaceString
	hlcoord 5, 3
	ld de, wSafariBallsRemaining
	lb bc, 1, 2
	call PrintNum
	pop af
	ld [wOptions], a
	ret

.slash_500
	db "／５００@"
.booru_ko
	db "ボール　　　こ@"


SECTION "engine/menus/menu_2@StartMenu_PrintBugContestStatus", ROMX

StartMenu_DrawBugContestStatusBox::
	hlcoord 0, 0
	ld b, 5
if !DEF(_CRYSTAL_EU)
	ld c, 17
else
	ld c, 18
endc
	call Textbox
	ret

StartMenu_PrintBugContestStatus::
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call StartMenu_DrawBugContestStatusBox
	hlcoord 1, 5
	ld de, .Balls_EN
	call PlaceString
if !DEF(_CRYSTAL_ES)
	hlcoord 8, 5
else
	hlcoord 7, 5
endc
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	hlcoord 1, 1
	ld de, .CAUGHT
	call PlaceString
	ld a, [wContestMon]
	and a
	ld de, .None
	jr z, .no_contest_mon
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName

.no_contest_mon
if !DEF(_CRYSTAL_EU)
	hlcoord 8, 1
elif DEF(_CRYSTAL_DE)
	hlcoord 9, 1
elif DEF(_CRYSTAL_ES)
	hlcoord 7, 1
endc
	call PlaceString
	ld a, [wContestMon]
	and a
	jr z, .skip_level
	hlcoord 1, 3
	ld de, .LEVEL
	call PlaceString
	ld a, [wContestMonLevel]
	ld h, b
	ld l, c
	inc hl
	ld c, 3
	call Print8BitNumLeftAlign

.skip_level
	pop af
	ld [wOptions], a
	ret

.Balls_JP:
	db "ボール　　　こ@"

if !DEF(_CRYSTAL_EU)
.CAUGHT:   db "CAUGHT@"
.Balls_EN: db "BALLS:@"
.None:     db "None@"
.LEVEL:    db "LEVEL@"
elif DEF(_CRYSTAL_DE)
.CAUGHT:   db "BESITZ:@"
.Balls_EN: db "BÄLLE:@"
.None:     db "KEINE@"
.LEVEL:    db "LEVEL@"
elif DEF(_CRYSTAL_ES)
.CAUGHT:   db "ATR.:@"
.Balls_EN: db "BALL:@"
.None:     db "Ninguno@"
.LEVEL:    db "NIVEL@"
endc


SECTION "engine/menus/menu_2@FindApricornsInBag", ROMX

FindApricornsInBag::
; Checks the bag for Apricorns.
	ld hl, wBuffer1
	xor a
	ld [hli], a
	dec a
	ld bc, 10
	call ByteFill

	ld hl, ApricornBalls
.loop
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	pop hl
	jr nc, .nope
	ld a, [hl]
	call .addtobuffer
.nope
	inc hl
	inc hl
	jr .loop

.done
	ld a, [wBuffer1]
	and a
	ret nz
	scf
	ret

.addtobuffer
	push hl
	ld hl, wBuffer1
	inc [hl]
	ld e, [hl]
	ld d, 0
	add hl, de
	ld [hl], a
	pop hl
	ret

INCLUDE "data/items/apricorn_balls.inc"
