INCLUDE "constants/maps_common.inc"

	object_const_def ; object_event constants
	const ROUTE32_FISHER1
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER1
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_YOUNGSTER4
	const ROUTE32_FISHER4
	const ROUTE32_POKE_BALL1
	const ROUTE32_FISHER5
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2


SECTION "maps/Route32", ROMX

Route32_MapScripts::
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script .DummyScene2 ; SCENE_ROUTE32_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Frieda

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Frieda:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	return

.FriedaAppears:
	appear ROUTE32_FRIEDA
	return

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMContinueScene:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
	writetext Route32CooltrainerMText_AideIsWaiting
	waitbutton
	closetext
	end

.Unreferenced:
	writetext Route32CooltrainerMText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	sjump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext Route32CooltrainerMText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext Route32CooltrainerMText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

Route32CooltrainerMStopsYouScene:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMContinueScene
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	promptbutton
	verbosegiveitem TM_ROAR
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjump _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOTHING
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end

TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	endifjustbattled
	opentext
	checkflag ENGINE_RALPH
	iftrue .Rematch
	checkflag ENGINE_FISH_SWARM
	iftrue .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftrue .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext FisherRalphAfterText
	promptbutton
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH
	end

.Swarm:
	writetext FisherRalphSwarmText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.RematchStd:
	jumpstd rematchm
	end

TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	endifjustbattled
	opentext
	checkflag ENGINE_LIZ
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ
	end

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.RematchStd:
	jumpstd rematchf
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32GreatBall:
	itemball GREAT_BALL

Route32Repel:
	itemball REPEL

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokecenterSign:
	jumpstd pokecentersign

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step UP
	step UP
	step_end

Movement_Route32CooltrainerMReset1:
	step DOWN
	step_end

Movement_Route32CooltrainerMReset2:
	step RIGHT
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "Warte!"
	line "Warum die Eile?"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, oder?"
	line "Ein Typ mit einer"

	para "Brille hat nach"
	line "dir gefragt."

	para "Kümmere dich um"
	line "ihn. Er erwartet"

	para "dich im #MON-"
	line "CENTER."
	done

Route32CooltrainerMText_UnusedSproutTower:
; unused
	text "Warst du im"
	line "KNOFENSA-TURM?"

	para "Wenn du jemals"
	line "nach VIOLA CITY"

	para "kommst, erwartet"
	line "man von dir, dass"
	cont "du dort trai-"
	cont "nierst."

	para "Das ist ein Muss"
	line "für alle Trainer."
	cont "Geh zum"
	cont "KNOFENSA-TURM!"
	done

Route32CooltrainerMText_VioletGym:
	text "Warst du schon in"
	line "der PKMN-ARENA?"

	para "Dort kannst du"
	line "deine #MON und"
	cont "dich auf die Probe"
	cont "stellen."

	para "Es ist eine Art"
	line "Ritus für alle"
	cont "Trainer!"
	done

Route32CooltrainerMText_HaveThisSeed:
	text "Du besitzt einige"
	line "gute #MON."

	para "Sie sind bestimmt"
	line "wegen der vielen"

	para "Kämpfe, die du mit"
	line "ihnen bei VIOLA"
	cont "CITY absolviert"
	cont "hast, so gut."

	para "Das Training in"
	line "der PKMN-ARENA"

	para "muss von großem"
	line "Nutzen gewesen"

	para "sein. Nimm dies"
	line "als Andenken an"
	cont "VIOLA CITY."

	para "Damit werden"
	line "Pflanzen-Attacken"
	cont "verstärkt."
	done

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "Die Erfahrungen"
	line "von VIOLA CITY"

	para "werden dir auf"
	line "deiner Reise von"
	cont "großem Nutzen"
	cont "sein."
	done

Text_MillionDollarSlowpokeTail:
	text "Wie möchtest du"
	line "die schmackhafte,"

	para "gehaltvolle"
	line "FLEGMONRUTE"
	cont "zubereitet haben?"

	para "Für dich jetzt nur"
	line "¥1,000,000!"

	para "Möchtest du sie?"
	done

Text_ThoughtKidsWereLoaded:
	text "Ts! Ich dachte,"
	line "die Kinder von"
	cont "heute wären"
	cont "stinkreich…"
	done

Text_RefusedToBuySlowpokeTail:
	text "Du möchtest sie"
	line "nicht? Dann mach"
	cont "dich vom Acker!"
	done

FisherJustinSeenText:
	text "Wow!"

	para "Wegen dir habe ich"
	line "den Fisch ver-"
	cont "loren!"
	done

FisherJustinBeatenText:
	text "Platsch!"
	done

FisherJustinAfterText:
	text "Geduld…"
	line "Die Voraussetzung"

	para "für das Angeln und"
	line "für #MON ist"
	cont "dieselbe."
	done

FisherRalph1SeenText:
	text "Ich beherrsche"
	line "beides, Angeln und"
	cont "#MON."

	para "Darum werde ich"
	line "nicht verlieren!"
	done

FisherRalph1BeatenText:
	text "Ts! Ich wollte"
	line "die Sache"
	cont "beschleunigen…"
	done

FisherRalphAfterText:
	text "Angeln ist eine"
	line "Leidenschaft für"

	para "das ganze Leben."
	line "#MON sind"
	cont "Kameraden fürs"
	cont "Leben!"
	done

FisherRalphSwarmText:
	text "Eins, Zwei, Drei…"
	line "Muahahaha, welch"

	para "ein Fang!"
	line "Ich bin fertig!"

	para "Mach weiter und"
	line "fange so viel du"
	cont "kannst, Kiddie!"
	done

; --- start a segment of unused text

Route32UnusedFisher1SeenText:
	text "Ich fange die"
	line "gleichen #MON…"

	para "Vielleicht ändert"
	line "ein Kampf"
	cont "die Sache."
	done

Route32UnusedFisher1BeatenText:
	text "Mir gelingt ein-"
	line "fach nichts…"
	done

Route32UnusedFisher1AfterText:
	text "Wie kann der"
	line "Bursche neben mir"
	cont "gute #MON"
	cont "fangen?"
	done

Route32UnusedFisher2SeenText:
	text "Heh, heute habe"
	line "ich einen Lauf."
	cont "Lass uns kämpfen,"
	cont "Kröte."
	done

Route32UnusedFisher2BeatenText:
	text "Uff. Dieses Mal"
	line "hatte ich kein"
	cont "Glück."
	done

Route32UnusedFisher2AfterText:
	text "Du benötigst die"
	line "PROFIANGEL, wenn"

	para "du gute #MON"
	line "fangen möchtest."
	done

; --- end a segment of unused texts

FisherHenrySeenText:
	text "Meine #MON?"
	line "Frisch gefangen!"
	done

FisherHenryBeatenText:
	text "PLATSCHER?"
	done

FisherHenryAfterText:
	text "Frisch gefangene"
	line "#MON können"

	para "gut trainierten"
	line "nicht Paroli"
	cont "bieten."
	done

YoungsterAlbertSeenText:
	text "Ich habe dich hier"
	line "noch nie gesehen."

	para "Du denkst also,"
	line "du bist stark?"
	done

YoungsterAlbertBeatenText:
	text "Du bist stark!"
	done

YoungsterAlbertAfterText:
	text "Ich versuche, mit"
	line "meinen Lieblingen"
	cont "der Beste zu sein."

	para "Ich setze nicht"
	line "auf zähe #MON,"
	cont "wie die anderen."
	done

YoungsterGordonSeenText:
	text "Ich habe gute"
	line "#MON im"
	cont "Gras gefunden!"

	para "Ich denke, sie"
	line "passen ganz gut"
	cont "zu mir!"
	done

YoungsterGordonBeatenText:
	text "Mist. Ich dachte,"
	line "ich könnte"
	cont "gewinnen."
	done

YoungsterGordonAfterText:
	text "Im Gras findest"
	line "du viele Dinge."
	done

CamperRolandSeenText:
	text "Dieser Blick…"
	line "Wie faszinierend."
	done

CamperRolandBeatenText:
	text "Hm. Das ist"
	line "enttäuschend."
	done

CamperRolandAfterText:
	text "Wenn du nicht"
	line "kämpfen möchtest,"
	cont "vermeide Blick-"
	cont "kontakt."
	done

PicnickerLiz1SeenText:
	text "A-ha. Ja,"
	line "du weißt…"

	para "Wie bitte? Kampf?"
	line "Ich telefoniere."

	para "Oh, O.K. Aber"
	line "mach schnell."
	done

PicnickerLiz1BeatenText:
	text "Ich muss meinem"
	line "Ärger Luft machen!"
	done

PicnickerLiz1AfterText:
	text "Ich hatte einen"
	line "netten Plausch."
	done

BirdKeeperPeterSeenText:
	text "Dieser ORDEN! Er"
	line "ist aus VIOLA"
	cont "CITY!"

	para "Du hast FALK"
	line "besiegt?"
	done

BirdKeeperPeterBeatenText:
	text "Ich kenne meine"
	line "Schwächen."
	done

BirdKeeperPeterAfterText:
	text "Ich sollte in der"
	line "PKMN-ARENA von"
	cont "VIOLA CITY weiter"
	cont "trainieren."
	done

Route32UnusedText:
; unused
	text "Die Angler schrien"
	line "mich an, weil ich"
	cont "sie belauschte…"
	done

Text_RoarIntro:
	text "BRÜLL!"
	line "DIE LEUTE LAUFEN"

	para "DAVON, WENN ICH"
	line "BRÜLLE! DU ABER"
	cont "WOLLTEST MICH"
	cont "SEHEN!"

	para "DAS GEFÄLLT MIR!"
	line "HIER BITTE SCHÖN!"
	done

Text_RoarOutro:
	text "BRÜLL!"
	line "ES IST BRÜLLER!"

	para "SOGAR #MON"
	line "LAUFEN DAVON,"
	cont "WENN DU IHN"
	cont "EINSETZT!"
	done

MeetFriedaText:
	text "FRIEDA: Juhu!"
	line "Es ist Freitag!"

	para "Ich bin FRIEDA"
	line "von Freitag!"

	para "Schön dich"
	line "kennen zu lernen!"
	done

FriedaGivesGiftText:
	text "Hier, GIFTSTICH"
	line "ist für dich!"
	done

FriedaGaveGiftText:
	text "FRIEDA: Gib es"
	line "einem #MON, das"
	cont "über Gift-Attacken"
	cont "verfügt."

	para "Oh!"

	para "Es ist gemein!"

	para "Du wirst dich"
	line "wundern, wie"
	cont "effektiv deine"
	cont "Gift-Attacken"
	cont "werden!"
	done

FriedaFridayText:
	text "FRIEDA: Hossa!"
	line "Welchen Wochentag"
	cont "hast du am"
	cont "liebsten?"

	para "Ich liebe Freitag."
	line "Daran gibt es"
	cont "keinen Zweifel!"

	para "Denkst du nicht"
	line "auch, dass Freitag"
	cont "großartig ist?"
	done

FriedaNotFridayText:
	text "FRIEDA: Ist heute"
	line "nicht Freitag?"

	para "Es wäre langwei-"
	line "lig, wenn nicht!"
	done

Route32SignText:
	text "ROUTE 32"

	para "VIOLA CITY -"
	line "AZALEA CITY"
	done

Route32RuinsSignText:
	text "ALPH-RUINEN"
	line "OSTEINGANG"
	done

Route32UnionCaveSignText:
	text "EINHEITSTUNNEL"
	line "Geradeaus"
	done

Route32_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	db 2 ; coord events
	coord_event 18,  8, SCENE_DEFAULT, Route32CooltrainerMStopsYouScene
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	db 6 ; bg events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	db 14 ; object events
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event 12, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 10, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	object_event 11, 82, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPeter, -1
	object_event  7, 70, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6, 53, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
