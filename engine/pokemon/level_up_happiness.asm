INCLUDE "macros/rst.inc"
INCLUDE "constants/pokemon_data_constants.inc"


SECTION "engine/pokemon/level_up_happiness", ROMX

LevelUpHappinessMod::
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $7f
	ld d, a
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp d
	ld c, HAPPINESS_GAINLEVEL
	jr nz, .ok
	ld c, HAPPINESS_GAINLEVELATHOME

.ok
	callfar ChangeHappiness
	ret
