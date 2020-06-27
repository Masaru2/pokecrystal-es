INCLUDE "macros/data.inc"
INCLUDE "macros/scripts/text.inc"


SECTION "data/text/battle", ROMX

BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney::
	text "<PLAYER> hebt"
	line "¥@"
	text_decimal wPayDayMoney, 3, 6
	text " auf!"
	prompt

WildPokemonAppearedText::
	text "Ein wildes"
	line "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

HookedPokemonAttackedText::
	text "Das gefangene"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "greift an!"
	prompt

PokemonFellFromTreeText::
	text_ram wEnemyMonNick
	text_start
	line "fällt vom Baum!"
	prompt

WildCelebiAppearedText::
	text "Ein wildes"
	line "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "möchte kämpfen!"
	prompt

BattleText_WildFled::
	text "Das wilde"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "ist geflohen!"
	prompt

BattleText_EnemyFled::
	text "Gegn. @"
	text_ram wEnemyMonNick
	text_start
	line "ist geflohen!"
	prompt

HurtByPoisonText::
	text "Das Gift schadet"
	line "<USER>!"
	prompt

HurtByBurnText::
	text "Die Verbrennung"
	line "schadet"
	cont "<USER>!"
	prompt

LeechSeedSapsText::
	text "Die EGELSAMEN-"
	line "ATTACKE schadet"
	cont "<USER>!"
	prompt

HasANightmareText::
	text "NACHTMAHR schadet"
	line "<USER>!"
	prompt

HurtByCurseText::
	text "FLUCH schadet"
	line "<USER>!"
	prompt

SandstormHitsText::
	text "SANDSTURM trifft"
	line "<USER>!"
	prompt

PerishCountText::
	text "<USER>:"
	line "ABGESANG steht bei"
	cont "@"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem::
	text "<TARGET>"
	line "erholt sich mit"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing::
	text "<USER>"
	line "füllt die AP mit"
	cont "@"
	text_ram wStringBuffer1
	text " auf."
	prompt

BattleText_TargetWasHitByFutureSight::
	text "<TARGET>"
	line "wurde von"
	cont "SEHER"
	cont "erfasst!"
	prompt

BattleText_SafeguardFaded::
	text "Der BODYGUARD von"
	line "<USER>"
	cont "schwindet!"
	prompt

BattleText_MonsLightScreenFell::
	text_ram wStringBuffer1
	text_start
	line "LICHTSCHILD"
	cont "schwindet!"
	prompt

BattleText_MonsReflectFaded::
	text_ram wStringBuffer1
	text_start
	line "REFLEKTOR"
	cont "schwindet!"
	prompt

BattleText_RainContinuesToFall::
	text "Es regnet immer"
	line "noch."
	prompt

BattleText_TheSunlightIsStrong::
	text "Das Sonnenlicht"
	line "ist stark."
	prompt

BattleText_TheSandstormRages::
	text "SANDSTURM wütet."
	prompt

BattleText_TheRainStopped::
	text "Es hat aufgehört"
	line "zu regnen."
	prompt

BattleText_TheSunlightFaded::
	text "Das Sonnenlicht"
	line "schwindet."
	prompt

BattleText_TheSandstormSubsided::
	text "Der SANDSTURM"
	line "lässt nach."
	prompt

BattleText_EnemyMonFainted::
	text "Gegn. @"
	text_ram wEnemyMonNick
	text_start
	line "wurde besiegt!"
	prompt

GotMoneyForWinningText::
	text "<PLAYER>"
	line "erhält ¥@"
	text_decimal wBattleReward, 3, 6
	text "!"
	prompt

BattleText_EnemyWasDefeated::
	text "<ENEMY>"
	line "wurde besiegt!"
	prompt

TiedAgainstText::
	text "Spielt Remis gegen"
	line "<ENEMY>!"
	prompt

SentSomeToMomText::
	text "<PLAYER> erhält"
	line "¥@"
	text_decimal wBattleReward, 3, 6
	text " und schickt"

	para "einen Teil nach"
	line "Hause."
	prompt

SentHalfToMomText::
	text "Die Hälfte wurde"
	cont "nach Hause"
	cont "geschickt!"
	prompt

SentAllToMomText::
	text "Alles wurde nach"
	cont "Hause geschickt!"
	prompt

BattleText_0x80a4f::
	text "<RIVAL>: Hä? Ich"
	line "hätte deine"
	cont "#MON auswählen"
	cont "sollen!"
	prompt

BattleText_MonFainted::
	text_ram wBattleMonNick
	text_start
	line "wurde besiegt!"
	prompt

BattleText_UseNextMon::
	text "Nächstes #MON"
	line "einsetzen?"
	done

BattleText_0x80a93::
	text "<RIVAL>: Ja!"
	line "Ich denke, ich"
	cont "habe ein gutes"
	cont "#MON!"
	prompt

LostAgainstText::
	text "Verlor gegen"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon::
	text "<ENEMY>"
	line "setzt"
	cont "@"
	text_ram wEnemyMonNick
	text " ein."

	para "Möchtest du das"
	line "#MON wechseln?"
	done

BattleText_EnemySentOut::
	text "<ENEMY>"
	line "schickt"
	cont "@"
	text_ram wEnemyMonNick
	text_start
	cont "in den Kampf!"
	done

BattleText_TheresNoWillToBattle::
	text "Es kann nicht"
	line "kämpfen!"
	prompt

BattleText_AnEGGCantBattle::
	text "Ein EI kann"
	line "nicht kämpfen!"
	prompt

BattleText_CantEscape2::
	text "Flucht unmöglich!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle::
	text "Du kannst aus"
	line "Trainerkämpfen"
	cont "nicht fliehen!"
	prompt

BattleText_GotAwaySafely::
	text "Du bist entkommen!"
	prompt

BattleText_UserFledUsingAStringBuffer1::
	text "<USER>"
	line "floh durch"
	cont "den Einsatz von"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape::
	text "Flucht unmöglich!"
	prompt

BattleText_UserHurtBySpikes::
	text "STACHLER schadet"
	line "<USER>!"
	prompt

RecoveredUsingText::
	text "<TARGET>"
	line "heilt sich mit"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated::
	text "<USER>s"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "aktiviert!"
	prompt

BattleText_ItemsCantBeUsedHere::
	text "Items können hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt

BattleText_MonIsAlreadyOut::
	text_ram wBattleMonNick
	text_start
	line "kämpft bereits."
	prompt

BattleText_MonCantBeRecalled::
	text_ram wBattleMonNick
	text_start
	line "kann nicht aus-"
	cont "getauscht werden!"
	prompt

BattleText_TheresNoPPLeftForThisMove::
	text "Du hast keine AP"
	line "für diese Attacke"
	cont "mehr übrig!"
	prompt

BattleText_TheMoveIsDisabled::
	text "Die Attacke ist"
	line "BLOCKIERT!"
	prompt

BattleText_MonHasNoMovesLeft::
	text_ram wBattleMonNick
	text_start
	line "hat keine Attacken"
	cont "mehr übrig!"
	done

BattleText_TargetsEncoreEnded::
	text "<TARGET>s"
	line "ZUGABE hört auf!"
	prompt

BattleText_StringBuffer1GrewToLevel::
	text_ram wStringBuffer1
	text_start
	line "erreicht LV @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_end

	text_end ; unused

BattleText_WildMonIsEating::
	text "Wildes @"
	text_ram wEnemyMonNick
	text_start
	line "frisst!"
	prompt

BattleText_WildMonIsAngry::
	text "Wildes @"
	text_ram wEnemyMonNick
	text_start
	line "ist wütend!"
	prompt

FastAsleepText::
	text "<USER>"
	line "schläft tief!"
	prompt

WokeUpText::
	text "<USER>"
	line "ist aufgewacht!"
	prompt

FrozenSolidText::
	text "<USER>"
	line "ist tiefgefroren!"
	prompt

FlinchedText::
	text "<USER>"
	line "schreckt zurück!"
	prompt

MustRechargeText::
	text "<USER>"
	line "muss sich wieder"
	cont "aufladen!"
	prompt

DisabledNoMoreText::
	text "<USER>"
	line "wird nicht"
	cont "mehr blockiert!"
	prompt

IsConfusedText::
	text "<USER>"
	line "ist verwirrt!"
	prompt

HurtItselfText::
	text "Es hat sich vor"
	line "Verwirrung selbst"
	cont "verletzt!"
	prompt

ConfusedNoMoreText::
	text "<USER>"
	line "ist nicht mehr"
	cont "verwirrt!"
	prompt

BecameConfusedText::
	text "<TARGET>"
	line "ist verwirrt!"
	prompt

BattleText_ItemHealedConfusion::
	text "Dank @"
	text_ram wStringBuffer1
	text_start
	line "ist"

	para "<TARGET>"
	line "nicht mehr"
	cont "verwirrt."
	prompt

AlreadyConfusedText::
	text "<TARGET>"
	line "ist schon verwir.!"
	prompt

BattleText_UsersHurtByStringBuffer1::
	text_ram wStringBuffer1
	text_start
	line "schadet"

	para "<USER>!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1::
	text "<USER>"
	line "wurde von"

	para "@"
	text_ram wStringBuffer1
	text_start
	line "erlöst!"
	prompt

UsedBindText::
	text "<TARGET>"
	line "erleidet Schaden"

	para "durch"
	line "<USER>s"

	para "KLAMMERGRIFF!"
	prompt

WhirlpoolTrapText::
	text "<TARGET>"
	line "ging in die Falle!"
	prompt

FireSpinTrapText::
	text "<TARGET>"
	line "ging in die Falle!"
	prompt

WrappedByText::
	text "<TARGET>"
	line "erleidet Schaden"

	para "durch"
	line "<USER>s"

	para "WICKEL!"
	prompt

ClampedByText::
	text "<TARGET>"
	line "erleidet Schaden"

	para "durch"
	line "<USER>s"

	para "SCHNAPPER."
	prompt

StoringEnergyText::
	text "<USER>"
	line "lädt sich auf!"
	prompt

UnleashedEnergyText::
	text "<USER>"
	line "erzeugt Energie!"
	prompt

HungOnText::
	text "<TARGET>"
	line "klammert sich an"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText::
	text "<TARGET>s"
	line "AUSDAUER mindert"
	cont "die Attacke!"
	prompt

InLoveWithText::
	text "<USER>"
	line "verliebt sich in"
	cont "<TARGET>!"
	prompt

InfatuationText::
	text "<USER>"
	line "ist zu verliebt,"
	cont "um anzugreifen!"
	prompt

DisabledMoveText::
	text "<USER>s"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wird BLOCKIERT!"
	prompt

LoafingAroundText::
	text_ram wBattleMonNick
	text_start
	line "faulenzt."
	prompt

BeganToNapText::
	text_ram wBattleMonNick
	text_start
	line "macht ein"
	cont "Nickerchen!"
	prompt

WontObeyText::
	text_ram wBattleMonNick
	text_start
	line "ist ungehorsam!"
	prompt

TurnedAwayText::
	text_ram wBattleMonNick
	text_start
	line "wendet sich ab!"
	prompt

IgnoredOrdersText::
	text_ram wBattleMonNick
	text_start
	line "ignoriert Befehl!"
	prompt

IgnoredSleepingText::
	text_ram wBattleMonNick
	text " igno-"
	line "riert den Befehl"
	cont "…es schläft!"
	prompt

NoPPLeftText::
	text "Es sind nicht"
	line "genügend AP für"
	cont "diese Attacke"
	cont "vorhanden!"
	prompt

HasNoPPLeftText::
	text "<USER>"
	line "hat keine AP für"
	cont "@"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText::
	text "<USER>"
	line "schläft ein!"
	done

RestedText::
	text "<USER>"
	line "schläft und"
	cont "erholt sich!"
	done

RegainedHealthText::
	text "<USER>"
	line "erholt sich!"
	prompt

AttackMissedText::
	text "<USER>s"
	line "Attacke ging"
	cont "daneben!"
	prompt

AttackMissed2Text::
	text "<USER>s"
	line "Attacke ging"
	cont "daneben!"
	prompt

CrashedText::
	text "<USER>"
	line "macht weiter und"

	para "fällt hin!"
	prompt

UnaffectedText::
	text "<TARGET>"
	line "ist unversehrt!"
	prompt

DoesntAffectText::
	text "Es hat keine"
	line "Wirkung!"
	prompt

CriticalHitText::
	text "Volltreffer!"
	prompt

OneHitKOText::
	text "Mit einem Schlag"
	line "K.O.!"
	prompt

SuperEffectiveText::
	text "Die Attacke ist"
	line "sehr effektiv!"
	prompt

NotVeryEffectiveText::
	text "Die Attacke ist"
	line "nicht sehr"
	cont "effektiv…"
	prompt

TookDownWithItText::
	text "K.O. für beide"
	line "<TARGET>,"
	cont "<USER>!"
	prompt

RageBuildingText::
	text "<USER>"
	line "verfällt in"
	cont "RASEREI!"
	prompt

GotAnEncoreText::
	text "<TARGET>"
	line "setzt"
	cont "ZUGABE ein!"
	prompt

SharedPainText::
	text "Die Kämpfer teilen"
	line "den Schmerz!"
	prompt

TookAimText::
	text "<USER>"
	line "nimmt Ziel!"
	prompt

SketchedText::
	text "<USER>"
	line "benutzt NACHAHMER"

	para "und setzt"
	line "@"
	text_ram wStringBuffer1
	text " ein!"
	prompt

DestinyBondEffectText::
	text "<USER>"
	line "versucht ein"
	cont "beidseitiges"
	cont "K.O.!"
	prompt

SpiteEffectText::
	text "<TARGET>s"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "sinkt um @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BellChimedText::
	text "Eine Glocke"
	line "erklingt!"
	prompt

FellAsleepText::
	text "<TARGET>"
	line "schläft!"
	prompt

AlreadyAsleepText::
	text "<TARGET>"
	line "schläft bereits!"
	prompt

WasPoisonedText::
	text "<TARGET>"
	line "wurde vergiftet!"
	prompt

BadlyPoisonedText::
	text "<TARGET>"
	line "ist schwer"
	cont "vergiftet!"
	prompt

AlreadyPoisonedText::
	text "<TARGET>"
	line "ist bereits"
	cont "vergiftet!"
	prompt

SuckedHealthText::
	text "<TARGET>"
	line "hat KP verloren!"
	prompt

DreamEatenText::
	text "<TARGET>s"
	line "Traum gefressen!"
	prompt

WasBurnedText::
	text "<TARGET>"
	line "brennt!"
	prompt

DefrostedOpponentText::
	text "<TARGET>"
	line "ist aufgetaut!"
	prompt

WasFrozenText::
	text "<TARGET>"
	line "wurde eingefroren!"
	prompt

WontRiseAnymoreText::
	text_ram wStringBuffer2
	text " von"
	line "<USER>"
	cont "steigt nicht mehr!"
	prompt

WontDropAnymoreText::
	text_ram wStringBuffer2
	text " von"
	line "<TARGET>"
	cont "sinkt nicht mehr!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "flieht!"
	prompt

FledInFearText::
	text "<TARGET>"
	line "flieht vor Angst!"
	prompt

BlownAwayText::
	text "<TARGET>"
	line "wurde weggeweht!"
	prompt

PlayerHitTimesText::
	text "Erleidet @"
	text_decimal wPlayerDamageTaken, 1, 1
	text_start
	line "Treffer!"
	prompt

EnemyHitTimesText::
	text "Erleidet @"
	text_decimal wEnemyDamageTaken, 1, 1
	text_start
	line "Treffer!"
	prompt

MistText::
	text "<USER>s"
	line "ist von"
	cont "WEISSNEBEL"
	cont "umgeben!"
	prompt

ProtectedByMistText::
	text "WEISSNEBEL schützt"
	line "<TARGET>."
	prompt

GettingPumpedText::
	text_pause
	text "<USER>"
	line "pumpt sich auf!"
	prompt

RecoilText::
	text "<USER>"
	line "wird verletzt!"
	prompt

MadeSubstituteText::
	text "<USER>"
	line "generiert einen"
	cont "DELEGATOR!"
	prompt

HasSubstituteText::
	text "<USER>"
	line "hat schon einen"
	cont "DELEGATOR!"
	prompt

TooWeakSubText::
	text "Keine Energie für"
	line "den DELEGATOR!"
	prompt

SubTookDamageText::
	text "Der DELEGATOR"
	line "nimmt Schaden für"
	cont "<TARGET>!"
	prompt

SubFadedText::
	text "Der DELEGATOR von"
	line "<TARGET>"
	cont "lässt nach!"
	prompt

MimicLearnedMoveText::
	text "<USER>"
	line "erlernt "
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

WasSeededText::
	text "<TARGET>"
	line "wurde bepflanzt!"
	prompt

EvadedText::
	text "<TARGET>"
	line "ist ausgewichen!"
	prompt

WasDisabledText::
	text "<TARGET>s"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wird blockiert!"
	prompt

CoinsScatteredText::
	text "Es liegen überall"
	line "Münzen verstreut!"
	prompt

TransformedTypeText::
	text "<USER>"
	line "wird zu einem"
	cont "#MON des Typs"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EliminatedStatsText::
	text "Alle Status-"
	line "änderungen werden"
	cont "aufgehoben!"
	prompt

TransformedText::
	text "<USER>"
	line "ben. VERWANDLER"
	cont "und wird zu"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText::
	text "<USER>s"
	line "SPEZ. VER steigt!"
	prompt

ReflectEffectText::
	text "Die VERT von"
	line "<USER>"

	para "steigt!"
	prompt

NothingHappenedText::
	text "Nichts geschieht."
	prompt

ButItFailedText::
	text "Es schlug fehl!"
	prompt

ItFailedText::
	text "Daneben!"
	prompt

DidntAffect1Text::
	text "Es zeigt keine"
	line "Wirkung auf"
	cont "<TARGET>!"
	prompt

DidntAffect2Text::
	text "Es hat keine"
	line "Wirkung auf"
	cont "<TARGET>!"
	prompt

HPIsFullText::
	text "Die KP von"
	line "<USER>"

	para "wurden ganz"
	line "aufgefüllt!"
	prompt

DraggedOutText::
	text "<USER>"
	line "wurde auserwählt!"
	prompt

ParalyzedText::
	text "<TARGET>"
	line "ist paralysiert!"
	prompt

FullyParalyzedText::
	text "<USER>"
	line "ist paralysiert!"
	prompt

AlreadyParalyzedText::
	text "<TARGET>"
	line "ist schon paral.!"
	prompt

ProtectedByText::
	text "<TARGET>"
	line "geschützt durch"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText::
	text "Der SPIEGELTRICK"
	next "ging daneben!"
	prompt

StoleText::
	text "<USER>"
	line "raubt @"
	text_ram wStringBuffer1
	text_start
	cont "vom Gegner!"
	prompt

CantEscapeNowText::
	text "<TARGET>"
	line "kann nicht"
	cont "fliehen!"
	prompt

StartedNightmareText::
	text "<TARGET>"
	line "wird von NACHTMAHR"

	para "heimgesucht!"
	prompt

WasDefrostedText::
	text "<USER>"
	line "wurde aufgetaut!"
	prompt

PutACurseText::
	text "<USER>"
	line "zieht sich KP ab"

	para "und belegt"
	line "<TARGET>"
	cont "mit einem FLUCH!"
	prompt

ProtectedItselfText::
	text "<USER>"
	line "schützt sich"
	cont "selbst!"
	prompt

ProtectingItselfText::
	text "Der Schutz wendet"
	line "Schaden ab von"
	cont "<TARGET>!"
	done

SpikesText::
	text "STACHLER umgibt"
	line "<TARGET>!"
	prompt

IdentifiedText::
	text "<USER>"
	line "identifiziert"
	cont "<TARGET>!"
	prompt

StartPerishText::
	text "Beide #MON"
	line "werden in 3 Runden"
	cont "K.O. gehen!"
	prompt

SandstormBrewedText::
	text "Ein SANDSTURM"
	line "entsteht!"
	prompt

BracedItselfText::
	text "<USER>"
	line "macht sich bereit!"
	prompt

FellInLoveText::
	text "<TARGET>"
	line "verliebt sich!"
	prompt

CoveredByVeilText::
	text "<USER>"
	line "wird verschleiert!"
	prompt

SafeguardProtectText::
	text "<TARGET>"
	line "wird von BODYGUARD"
	cont "beschützt!"
	prompt

MagnitudeText::
	text "Intensität @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

ReleasedByText::
	text "<USER>"
	line "entkam"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText::
	text "<USER>"
	line "befreit sich von"
	cont "EGELSAMEN!"
	prompt

BlewSpikesText::
	text "<USER>"
	line "entfernt"
	cont "STACHLER!"
	prompt

DownpourText::
	text "Ein Platzregen"
	line "setzt ein!"
	prompt

SunGotBrightText::
	text "Die Sonne scheint"
	line "hell!"
	prompt

BellyDrumText::
	text "<USER>"
	line "zieht sich KP ab,"
	cont "um den ANGRIFFS-"
	cont "WERT zu erhöhen!"
	prompt

CopiedStatsText::
	text "<USER>"
	line "übernimmt"

	para "die Statusver-"
	line "änderungen von"
	cont "<TARGET>!"
	prompt

ForesawAttackText::
	text "<USER>"
	line "erahnt Attacke!"
	prompt

BeatUpAttackText::
	text_ram wStringBuffer1
	text "s"
	line "Attacke!"
	done

RefusedGiftText::
	text "<TARGET>"
	line "kann das Geschenk"
	cont "nicht annehmen!"
	prompt

IgnoredOrders2Text::
	text "<USER>"
	line "gehorcht nicht!"
	prompt

BattleText_LinkErrorBattleCanceled::
	text "Verbindungsfehler…"

	para "Der Kampf wurde"
	line "abgebrochen…"
	prompt

BattleText_0x8188e::
	text "Du hast heute"
	line "keine Zeit mehr!"
	done
