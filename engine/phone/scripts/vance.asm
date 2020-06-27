INCLUDE "macros/data.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "constants/engine_flags.inc"
INCLUDE "constants/landmark_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/trainer_constants.inc"
INCLUDE "constants/wram_constants.inc"


SECTION "engine/phone/scripts/vance", ROMX

VancePhoneCalleeScript::
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue .NotWednesday
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue VanceWednesdayNight

.NotWednesday:
	farsjump VanceLookingForwardScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	farsjump VanceHurryHurryScript

VancePhoneCallerScript::
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue .WantsBattle
	farscall PhoneScript_Random3
	ifequal 0, VanceWantsRematch
	ifequal 1, VanceWantsRematch

.WantsBattle:
	farsjump Phone_GenericCall_Male

VanceWednesdayNight:
	setflag ENGINE_VANCE_WEDNESDAY_NIGHT

VanceWantsRematch:
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	setflag ENGINE_VANCE
	farsjump PhoneScript_WantsToBattle_Male
