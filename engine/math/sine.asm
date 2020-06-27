INCLUDE "macros/code.inc"
INCLUDE "macros/data.inc"


SECTION "engine/math/sine", ROMX

_Sine::
; a = d * sin(e * pi/32)
	ld a, e
	calc_sine_wave
