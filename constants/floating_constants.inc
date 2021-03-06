if !DEF(FLOATING_CONSTANTS_INC)
FLOATING_CONSTANTS_INC EQU 1

; This file is a stop-gap solution until the assembler supports BANK[] with section/label names.
; Floating-related caveats that aren't listed in this file, are commented with the FLOAT keyword.
; These constants shouldn't *ever* be used as a replacement for BANK()!

; See gfx/pics.asm
BANK_PICS EQU $48

; See gfx/sprites.asm
BANK_SPRITES EQU $30

; These functions are expected to be in the same bank by Init
BANK_GAME_INIT EQU $01 ; {WriteOAMDMACodeToHram, GameInit}

; Tracks with alternate versions
BANK_MUSIC_WILD_VICTORY      EQU $3d
BANK_MUSIC_RIVAL_ENCOUNTER   EQU $3d
BANK_MUSIC_JOHTO_WILD_BATTLE EQU $3d
BANK_MUSIC_ROCKET_ENCOUNTER  EQU $3d

; Maps
BANK_MAP_RUINS_OF_ALPH_RESEARCH_CENTER EQU $16 ; RuinsOfAlphKabutoChamberScientistScript -> RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
BANK_MAP_ROUTE_35_NATIONAL_PARK_GATE   EQU $1a ; Route36NationalParkGate_MapEvents -> BugCatchingContestExplanationSign (Only in US release)
BANK_MAP_CELADON_DEPT_STORE_1F         EQU $1c ; CeladonDeptStore6F_MapEvents -> CeladonDeptSotre1FElevatorButton
if !DEF(_CRYSTAL_EU)
BANK_MAP_BATTLE_TOWER                  EQU $27
else
BANK_MAP_BATTLE_TOWER                  EQU $76
endc
BANK_MAP_COLOSSEUM                     EQU $64 ; TradeCenter_MapEvents -> CableClubFriendScript

; Code
BANK_HAPPINESS           EQU $01 ; {GetFirstPokemonHappiness, CheckFirstMonIsEgg} -> CopyPokemonName_Buffer1_Buffer3; HaircutOrGrooming -> ChangeHappiness
BANK_MAP_OBJECTS         EQU $01 ; MapObjectMovementPattern -> CanObjectMoveInDirection; ReanchorBGMap_NoOAMUpdate -> ApplyBGMapAnchorToObjects
BANK_ANIMATE_HP_BAR      EQU $03 ; AnimateHPBar -> _AnimateHPBar; {_AnimateHPBar, LongAnim_UpdateVariables, LongHPBarAnim_UpdateTiles} -> ComputeHPBarPixels
BANK_MOVE_MON            EQU $03 ; RetrieveMonFromDayCareMan -> GetBreedMon1LevelGrowth; RetrieveMonFromDayCareLady -> GetBreedMon2LevelGrowth; BugContest_SetCaughtContestMon -> GeneratePartyMonStats
BANK_BUG_CONTEST_JUDGING EQU $04 ; ComputeAIContestantScores -> CheckBugContestContestantFlag
BANK_PACK                EQU $04 ; GiveItem -> TryGiveItemToPartymon
BANK_BUY_SELL_TOSS       EQU $09 ; Kurt_SelectQuantity_InterpretJoypad -> BuySellToss_InterpretJoypad
BANK_TRAINER_ATTRIBUTES  EQU $0e ; {AI_SwitchOrTryItem, AI_TryItem} -> TrainerClassAttributes
BANK_PARTY_MENU          EQU $14 ; PlacePartyMonGender -> GetGender; PlacePartyMonStatus -> PlaceStatusString
BANK_MOBILE_22           EQU $22
BANK_BATTLE_TRANSITION   EQU $23 ; {DoBattleTransition, StartTrainerBattle_LoadPokeBallGraphics} -> BattleStart_CopyTilemapAtOnce
BANK_PHONE_CALL          EQU $24 ; PokegearPhone_MakePhoneCall -> Function90199; PokegearPhone_UpdateDisplayList -> Function90380
BANK_BUG_CONTEST_RESULTS EQU $2f ; BugContestResultsWarpScript -> Movement_ContestResults_WalkAfterWarp
BANK_PHONE_TIFFANY       EQU $2f ; TiffanysFamilyMemebers -> {GrandmaString, GrandpaString, MomString, DadString, SisterString, BrotherString}
BANK_DUMMY_GAME          EQU $38 ; _DummyGame -> {Unknown_e00ed, ret_e00ed}

; Function48689 -> GetMysteryGift_MobileAdapterLayout
; Function4a098 -> MG_Mobile_Layout_LoadPals
; Function4a0c2 -> InitMobileProfile
; Function4a492 -> MG_Mobile_Layout00
; InitMobileProfile -> {Function4a3a7, GetMysteryGift_MobileAdapterLayout}
; {Function49f16, Function4a149, Function4a28a, Function4a4c4} -> Function48cdc
BANK_CRYSTAL             EQU $12

; The Unown pic pointers should start at the same address as the others
ADDR_PIC_POINTERS EQU $4000

endc
