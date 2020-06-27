INCLUDE "macros/coords.inc"
INCLUDE "constants/charmap.inc"
INCLUDE "constants/gfx_constants.inc"


SECTION "engine/pokegear/townmap_convertlinebreakcharacters", ROMX

TownMap_ConvertLineBreakCharacters::
	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .end
	cp "%"
	jr z, .line_feed
	cp "¯"
	jr z, .line_feed
if DEF(_CRYSTAL_EU)
	cp "<¯>"
	jr z, .hyphen_split
endc
	inc hl
	jr .loop

if DEF(_CRYSTAL_EU)
.hyphen_split
	ld [hl], "<->"
	jr .end
endc

.line_feed
	ld [hl], "<LF>"

.end
	ld de, wStringBuffer1
	hlcoord 9, 0
	call PlaceString
	ret
