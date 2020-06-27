INCLUDE "macros/data.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "constants/engine_flags.inc"
INCLUDE "constants/landmark_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/trainer_constants.inc"
INCLUDE "constants/wram_constants.inc"


SECTION "engine/phone/scripts/jose", ROMX

JosePhoneCalleeScript::
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	checkflag ENGINE_JOSE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue .NotSaturday
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .HasItem
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue JoseSaturdayNight

.NotSaturday:
	farsjump JoseHangUpScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_27
	farsjump JoseReminderScript

.HasItem:
	getlandmarkname STRING_BUFFER_5, ROUTE_27
	farsjump JoseReminderScript

JosePhoneCallerScript::
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOSE
	iftrue .Generic
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue .Generic
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, JoseWantsBattle
	farscall PhoneScript_Random3
	ifequal 0, JoseHasStarPiece

.Generic:
	farscall PhoneScript_Random3
	ifequal 0, JoseFoundRare
	farsjump Phone_GenericCall_Male

JoseSaturdayNight:
	setflag ENGINE_JOSE_SATURDAY_NIGHT

JoseWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_27
	setflag ENGINE_JOSE
	farsjump PhoneScript_WantsToBattle_Male

JoseFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

JoseHasStarPiece:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	getlandmarkname STRING_BUFFER_5, ROUTE_27
	farsjump PhoneScript_FoundItem_Male
