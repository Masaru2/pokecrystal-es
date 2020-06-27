INCLUDE "macros/data.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "constants/engine_flags.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/trainer_constants.inc"


SECTION "engine/phone/scripts/irwin", ROMX

IrwinPhoneCalleeScript::
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farsjump IrwinRandomTextScript

.Rockets:
	farsjump IrwinRocketRumorScript

IrwinPhoneCallerScript::
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farsjump IrwinRumorScript

.Rockets:
	farsjump IrwinRocketRumorScript
