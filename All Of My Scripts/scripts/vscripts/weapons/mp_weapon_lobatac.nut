#if SERVER
untyped
#endif

global function LobaTac_Init

#if CLIENT
global function ClLobaTac_Init
#endif

global function OnProjectileCollision_weapon_loba_tac
global function OnProjectileIgnite_weapon_loba_tac
global function LobaTac_OnWeaponTossRelease

const asset FLASHEFFECT    = $"wpn_grenade_sonar_impact"

void function LobaTac_Init()
{
	PrecacheParticleSystem( $"wpn_grenade_sonar_impact" )
	PrecacheParticleSystem( $"P_ar_holopilot_trail" )
}

#if CLIENT
void function ClLobaTac_Init()
{
	PrecacheParticleSystem( $"wpn_grenade_sonar_impact" )
	PrecacheParticleSystem( $"P_ar_holopilot_trail" )
}
#endif

var function LobaTac_OnWeaponTossRelease( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	#if SERVER
	var result = LobaTac_OnWeaponToss( weapon, attackParams, 1.0 )
	return result
	#endif
}

int function LobaTac_OnWeaponToss( entity weapon, WeaponPrimaryAttackParams attackParams, float directionScale )
{
	weapon.EmitWeaponSound_1p3p( GetGrenadeThrowSound_1p( weapon ), GetGrenadeThrowSound_3p( weapon ) )
	bool projectilePredicted = PROJECTILE_PREDICTED
	bool projectileLagCompensated = PROJECTILE_LAG_COMPENSATED
#if SERVER
	if ( weapon.IsForceReleaseFromServer() )
	{
		projectilePredicted = false
		projectileLagCompensated = false
	}
#endif
	entity grenade = LobaTac_Launch( weapon, attackParams.pos, (attackParams.dir * directionScale), projectilePredicted, projectileLagCompensated )
	entity weaponOwner = weapon.GetWeaponOwner()
	weaponOwner.Signal( "ThrowGrenade" )

	PlayerUsedOffhand( weaponOwner, weapon, true, grenade ) // intentionally here and in Hack_DropGrenadeOnDeath - accurate for when cooldown actually begins

	if ( IsValid( grenade ) )
		grenade.proj.savedDir = weaponOwner.GetViewForward()

#if SERVER
	#if BATTLECHATTER_ENABLED
		TryPlayWeaponBattleChatterLine( weaponOwner, weapon )
	#endif
#endif

	return weapon.GetWeaponSettingInt( eWeaponVar.ammo_per_shot )
}

entity function LobaTac_Launch( entity weapon, vector attackPos, vector throwVelocity, bool isPredicted, bool isLagCompensated )
{
	//TEMP FIX while Deploy anim is added to sprint
	float currentTime = Time()
	if ( weapon.w.startChargeTime == 0.0 )
		weapon.w.startChargeTime = currentTime

	// Note that fuse time of 0 means the grenade won't explode on its own, instead it depends on OnProjectileCollision() functions to be defined and explode there.
	float fuseTime = weapon.GetGrenadeFuseTime()
	bool startFuseOnLaunch = bool( weapon.GetWeaponInfoFileKeyField( "start_fuse_on_launch" ) )

	if ( fuseTime > 0 && !startFuseOnLaunch )
	{
		fuseTime = fuseTime - ( currentTime - weapon.w.startChargeTime )
		if ( fuseTime <= 0 )
			fuseTime = 0.001
	}

	// NOTE: DO NOT apply randomness to angularVelocity, it messes up lag compensation
	// KNOWN ISSUE: angularVelocity is applied relative to the world, so currently the projectile spins differently based on facing angle
	vector angularVelocity = <10, -1600, 10>

	int damageFlags = weapon.GetWeaponDamageFlags()
	WeaponFireGrenadeParams fireGrenadeParams
	fireGrenadeParams.pos = attackPos
	fireGrenadeParams.vel = throwVelocity
	fireGrenadeParams.angVel = angularVelocity
	fireGrenadeParams.fuseTime = fuseTime
	fireGrenadeParams.scriptTouchDamageType = (damageFlags & ~DF_EXPLOSION) // when a grenade "bonks" something, that shouldn't count as explosive.explosive
	fireGrenadeParams.scriptExplosionDamageType = damageFlags
	fireGrenadeParams.clientPredicted = isPredicted
	fireGrenadeParams.lagCompensated = isLagCompensated
	fireGrenadeParams.useScriptOnDamage = true
	entity frag = weapon.FireWeaponGrenade( fireGrenadeParams )
	if ( frag == null )
		return null

	#if SERVER
		entity owner = weapon.GetWeaponOwner()
		if ( IsValid( owner ) )
		{
			if ( IsWeaponOffhand( weapon ) )
			{
				AddToUltimateRealm( owner, frag )
			}
			else
			{
				frag.RemoveFromAllRealms()
				frag.AddToOtherEntitysRealms( owner )
			}
		}

		entity fxID = StartParticleEffectOnEntity_ReturnEntity( frag, GetParticleSystemIndex( $"P_ar_holopilot_trail" ), FX_PATTACH_ABSORIGIN_FOLLOW, -1 )
		//HolsterAndDisableWeapons( owner )
        owner.ForceStand()
	#endif

	LobaTac_OnPlayerNPCTossGrenade_Common( weapon, frag )

	return frag
}

void function LobaTac_OnPlayerNPCTossGrenade_Common( entity weapon, entity frag )
{
	LobaTacThrow_Init( frag, weapon )
	#if SERVER
		thread TrapExplodeOnDamage( frag, 20, 0.0, 0.0 )

		string projectileSound = GetGrenadeProjectileSound( weapon )
		if ( projectileSound != "" )
			EmitSoundOnEntity( frag, projectileSound )

		entity fxID = StartParticleEffectOnEntity_ReturnEntity( frag, GetParticleSystemIndex( $"P_ar_holopilot_trail" ), FX_PATTACH_ABSORIGIN_FOLLOW, -1 )
	#endif
}

void function LobaTacThrow_Init( entity grenade, entity weapon )
{
	entity weaponOwner = weapon.GetOwner()
	if ( IsValid( weaponOwner ) )
		SetTeam( grenade, weaponOwner.GetTeam() )

	// JFS: this is because I don't know if the above line should be
	// weapon.GetOwner() or it's a typo and should really be weapon.GetWeaponOwner()
	// and it's too close to ship and who knows what effect that will have
	entity owner = weapon.GetWeaponOwner()
	if ( IsValid( owner ) && owner.IsNPC() )
		SetTeam( grenade, owner.GetTeam() )

	#if SERVER
		bool smartPistolVisible = weapon.GetWeaponSettingBool( eWeaponVar.projectile_visible_to_smart_ammo )
		if ( smartPistolVisible )
		{
			grenade.SetDamageNotifications( true )
			grenade.SetTakeDamageType( DAMAGE_EVENTS_ONLY )
			grenade.proj.onlyAllowSmartPistolDamage = true

			if ( !grenade.GetProjectileWeaponSettingBool( eWeaponVar.projectile_damages_owner ) && !grenade.GetProjectileWeaponSettingBool( eWeaponVar.explosion_damages_owner ) )
				SetCustomSmartAmmoTarget( grenade, true ) // prevent friendly target lockon
		}
		else
		{
			grenade.SetTakeDamageType( DAMAGE_NO )
		}
	#endif
}

void function OnProjectileCollision_weapon_loba_tac( entity projectile, vector pos, vector normal, entity hitEnt, int hitbox, bool isCritical )
{
	#if SERVER
	entity player = projectile.GetOwner()
	entity viewModel = player.GetFirstPersonProxy()



	if (LobaTacCanTeleportHere( player, pos, null))
	{
		printl("player teleported")
		ScreenFadeToColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
		player.SetOrigin(pos)
		ScreenFadeFromColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
		EmitSoundOnEntity( player, "Wraith_PhaseGate_Portal_Open")
	}
	else
	{
		vector newpos = pos + <0,0,64>
		if(LobaTacCanTeleportHere( player, newpos, null))
		{
			ScreenFadeToColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
			player.SetOrigin(newpos)
			ScreenFadeFromColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
			EmitSoundOnEntity( player, "Wraith_PhaseGate_Portal_Open")
		}
		else
		{
			newpos = newpos + <0,0,64>
			if(LobaTacCanTeleportHere( player, newpos, null))
			{
				ScreenFadeToColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
				player.SetOrigin(newpos)
				ScreenFadeFromColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
				EmitSoundOnEntity( player, "Wraith_PhaseGate_Portal_Open")
			}
			else
			{
				newpos = newpos + <0,0,64>
				if(LobaTacCanTeleportHere( player, newpos, null))
				{
					ScreenFadeToColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
					player.SetOrigin(newpos)
					ScreenFadeFromColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
					EmitSoundOnEntity( player, "Wraith_PhaseGate_Portal_Open")
				}
				else
				{
					newpos = newpos + <0,0,64>
					if(LobaTacCanTeleportHere( player, newpos, null))
					{
						ScreenFadeToColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
						player.SetOrigin(newpos)
						ScreenFadeFromColor( player, 255.0, 255.0, 255.0, 150.0, 0.3, 0.1 )
						EmitSoundOnEntity( player, "Wraith_PhaseGate_Portal_Open")
					}
					else
					{
						printl("player was in a wall, player was not teleported")
						player.GetOffhandWeapon( OFFHAND_LEFT ).SetWeaponPrimaryClipCount( player.GetOffhandWeapon( OFFHAND_LEFT ).GetWeaponPrimaryClipCountMax() )
					}
				}
			}
		}
	}

	DeployAndEnableWeapons(player)
    player.UnforceStand()

	projectile.Destroy()
	#endif
}

#if SERVER
bool function LobaTacCanTeleportHere( entity player, vector testOrg, entity ignoreEnt = null ) //TODO: This is a copy of SP's PlayerPosInSolid(). Not changing it to avoid patching SP. Merge into one function next game
{
	int solidMask = TRACE_MASK_PLAYERSOLID
	vector mins
	vector maxs
	int collisionGroup = TRACE_COLLISION_GROUP_PLAYER
	array<entity> ignoreEnts = [ player ]

	if ( IsValid( ignoreEnt ) )
		ignoreEnts.append( ignoreEnt )
	TraceResults result

	mins = player.GetPlayerMins()
	maxs = player.GetPlayerMaxs()
	result = TraceHull( testOrg, testOrg + < 0, 0, 1 >, mins, maxs, ignoreEnts, solidMask, collisionGroup )

	if ( result.startSolid )
		return false

	return true
}

vector function LobaTacNewPos( entity player, vector testOrg, entity ignoreEnt = null ) //TODO: This is a copy of SP's PlayerPosInSolid(). Not changing it to avoid patching SP. Merge into one function next game
{
	int solidMask = TRACE_MASK_PLAYERSOLID
	vector mins
	vector maxs
	int collisionGroup = TRACE_COLLISION_GROUP_PLAYER
	array<entity> ignoreEnts = [ player ]

	if ( IsValid( ignoreEnt ) )
		ignoreEnts.append( ignoreEnt )
	TraceResults result

	mins = player.GetPlayerMins()
	maxs = player.GetPlayerMaxs()
	result = TraceHull( testOrg, testOrg - <0, 0, 128>, mins, maxs, ignoreEnts, solidMask, collisionGroup )
	//vector fallbackPos = result.endPos

	//fallbackPos = fallbackPos - (player.GetViewVector() * (Length( mins )))

	return result.endPos
}
#endif

void function OnProjectileIgnite_weapon_loba_tac( entity projectile )
{

}
