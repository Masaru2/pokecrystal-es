INCLUDE "macros/code.inc"
INCLUDE "macros/rst.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/floating_constants.inc"
INCLUDE "constants/pokemon_data_constants.inc"


SECTION "engine/events/bug_contest/caught_mon", ROMX, BANK[BANK_MOVE_MON]

BugContest_SetCaughtContestMon::
	ld a, [wContestMon]
	and a
	jr z, .firstcatch
	ld [wNamedObjectIndexBuffer], a
	farcall DisplayAlreadyCaughtText
	farcall DisplayCaughtContestMonStats
if !DEF(_CRYSTAL_EU)
	lb bc, 14, 7
else
	lb bc, 14, 9
endc
	call PlaceYesNoBox
	ret c

.firstcatch
	call .generatestats
	ld a, [wTempEnemyMonSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .ContestCaughtMonText
	call PrintText
	ret

.generatestats
	ld a, [wTempEnemyMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	call ByteFill
	xor a
	ld [wMonType], a
	ld hl, wContestMon
	jp GeneratePartyMonStats

.ContestCaughtMonText:
	text_far _ContestCaughtMonText
	text_end
