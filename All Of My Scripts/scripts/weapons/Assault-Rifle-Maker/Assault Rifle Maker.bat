@echo off
echo Tool Made By Average User.#5826
echo No One Else Made This Tool!
pause
cls
RMDIR "Output" /S /Q
mkdir Output

Echo Do You Have JANU's Framework?
echo Janu's Framework helps with setting up a
echo instant dev menu for custom guns, easy 
echo setup, auto precache!
echo.
set /p Janu=Yes/No: 
cls

Echo Do You Want To Enable Advanced Sounds?
echo ENABLE THIS ONLY IF YOU KNOW WHAT YOU ARE DOING!
echo YOU MUST KNOW SOUND NAMES!
echo.
set /p SoundYesOrNo=Yes/No: 
cls

Echo Do You Want To Enable Custom Projectile Model?
echo ENABLE THIS ONLY IF YOU KNOW WHAT YOU ARE DOING!
echo YOU MUST KNOW SOUND NAMES!
echo.
set /p Projectile=Yes/No: 
cls

Echo Do You Want To Enable Explosive Bullets?
echo Enable this and I will do everything
echo else for you : )
echo.
set /p Explosive=Yes/No: 
cls

Echo Please Enter The Name USE _ FOR SPACES ALL LOWERCASE LETTERS TOO
echo Example, large_machine_gun or ice_fire_gun
echo.
set /p Name=Enter Name: 
cls

Echo Please Enter The  Weapon Print Name
echo.
set /p PrintName=Enter Print Name: 
cls

Echo Please Enter The Weapon Description.
echo.
set /p Desc=Enter Description: 
cls



if "%SoundYesOrNo%"=="Yes" (goto Yep1)
if "%SoundYesOrNo%"=="No" (goto Nope1)
if "%SoundYesOrNo%"=="yes" (goto Yep1)
if "%SoundYesOrNo%"=="no" (goto Nope1)
if "%SoundYesOrNo%"=="Y" (goto Yep1)
if "%SoundYesOrNo%"=="N" (goto Nope1)
if "%SoundYesOrNo%"=="y" (goto Yep1)
if "%SoundYesOrNo%"=="n" (goto Nope1)


:Yep1

echo Please Enter The 1P Fire Sound Or Say Skip.
echo Example: "Weapon_Wingman_Fire_1P" ONlY USE 1P FOR THIS ONE!
echo Remember that every Fire_1P has a second version 
echo such as Fire_3P Means Third Person, while Fire_1P means First Person!
echo.
set /p FireSound1P=Enter 1P Fire Sound :  
cls



Echo Please Enter The 3P Fire Sound Or Say Skip.
echo Example: "Weapon_Wingman_Fire_3P" ONlY USE 3P FOR THIS ONE!
echo Remember that every Fire_3P has a second version 
echo such as Fire_3P Means Third Person, while Fire_1P means First Person!
echo.
set /p FireSound3P=Enter 3P Fire Sound :  
cls

:Nope1

if "%Projectile%"=="Yes" (goto Yep11)
if "%Projectile%"=="No" (goto Nope11)
if "%Projectile%"=="yes" (goto Yep11)
if "%Projectile%"=="no" (goto Nope11)
if "%Projectile%"=="Y" (goto Yep11)
if "%Projectile%"=="N" (goto Nope11)
if "%Projectile%"=="y" (goto Yep11)
if "%Projectile%"=="n" (goto Nope11)

:Yep11
Echo Please Enter The Projectile Model!
echo You can find these in Sounds_Models
echo.
set /p ProjectileModel=Enter Projectile Model: 
cls
:Nope11

Echo Please Enter The Ammo Type!
echo special = energy, bullet = light
echo highcal = heavy, shotgun = shotgun
echo EXAMPLE: Enter Ammo Type: special
echo special would be energy : )
echo.
set /p AmmoType=Enter Ammo Type: 
cls

Echo Please Enter Clip Size
echo.
set /p AmmoClipSize=Enter Ammo Clip Size: 
cls


Echo Please Enter Reload Speed.
echo.
set /p ReloadSpeed=Enter Reload Speed: 
cls

Echo Please Enter Reload Speed Late.
echo.
set /p ReloadSpeedLate=Enter Reload Speed Late: 
cls

Echo Please Enter Empty Ammo Reload Speed.
echo.
set /p ReloadSpeedEmpty=Enter Empty Reload Speed: 
cls


Echo Please Enter A Number You Want Damage Near To Be.
echo.
set /p DamageNear=Enter Near Damage:  
cls


Echo Please Enter A Number You Want Damage Far To Be.
echo.
set /p DamageFar=Enter Far Damage:   
cls


Echo Please Enter A Number You Want Damage Very Far To Be.
echo.
set /p DamageVeryFar=Enter Very Far Damage: 
cls

Echo Please Enter Fire Rate Amount.
echo.
set /p FireRate=Enter Fire Rate: 
cls



Echo Do You Want Burst?.
echo.
set /p Burst=Yes/No: 
cls
if "%Burst%"=="Yes" (goto BurstYes)
if "%Burst%"=="No" (goto BurstNo)
if "%Burst%"=="yes" (goto BurstYes)
if "%Burst%"=="no" (goto BurstNo)
if "%Burst%"=="Y" (goto BurstYes)
if "%Burst%"=="N" (goto BurstNo)
if "%Burst%"=="y" (goto BurstYes)
if "%Burst%"=="n" (goto BurstNo)

:BurstYes
Echo What Do You Want Burst Amount To Be?.
echo.
set /p BurstAmount=Enter Burst Amount: 
cls

Echo What Do You Want Burst Delay To Be?.
echo.
set /p BurstDelay=Enter Burst Delay Time: 
cls

:BurstNo


copy  output\mp_weapon_%Name%.txt 

cls
echo #base "_base_assault_rifle.txt"                                                                                  >> output\mp_weapon_%Name%.txt
echo #base "_base_mags_light.txt"                                                                                     >> output\mp_weapon_%Name%.txt
echo #base "_base_barrels_medium.txt"                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo WeaponData                                                                                                       >> output\mp_weapon_%Name%.txt
echo {                                                                                                                >> output\mp_weapon_%Name%.txt
echo. >> output\mp_weapon_%Name%.txt
if "%Janu%"=="Yes" (goto Yes20)
if "%Janu%"=="No" (goto No20)
if "%Janu%"=="yes" (goto Yes20)
if "%Janu%"=="no" (goto No20)
if "%Janu%"=="Y" (goto Yes20)
if "%Janu%"=="N" (goto No20)
if "%Janu%"=="y" (goto Yes20)
if "%Janu%"=="n" (goto No20)
:Yes20
echo            //Dont delete the bottom bit if publishing!	>> output\mp_weapon_%Name%.txt
echo            //This was made using Average User.#3903's Assault Rifle Maker! >> output\mp_weapon_%Name%.txt
echo. >> output\mp_weapon_%Name%.txt
echo     	"tier"    "2" >> output\mp_weapon_%Name%.txt
echo		"attachments"            "barrel mag sight grip" >> output\mp_weapon_%Name%.txt
echo		"low_chance"            "5.0" >> output\mp_weapon_%Name%.txt
echo		"med_chance"            "10.0" >> output\mp_weapon_%Name%.txt
echo		"high_chance"            "25.0" >> output\mp_weapon_%Name%.txt
echo		"class"                    "assault" >> output\mp_weapon_%Name%.txt
echo. >> output\mp_weapon_%Name%.txt
echo. >> output\mp_weapon_%Name%.txt
:No20
echo 	// General                                                                                                    >> output\mp_weapon_%Name%.txt
echo 	"printname"   									"%PrintName%"                                                 >> output\mp_weapon_%Name%.txt
echo 	"shortprintname"								"%PrintName%"                                                 >> output\mp_weapon_%Name%.txt
echo 	"description" 									"%Desc%"                                                      >> output\mp_weapon_%Name%.txt
echo 	"longdesc"										"%Desc%"                                                      >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"weapon_type_flags"								"WPT_PRIMARY"                                                 >> output\mp_weapon_%Name%.txt
echo 	"ammo_pool_type"								"%AmmoType%"                                                      >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     // UI/HUD                                                                                                    >> output\mp_weapon_%Name%.txt
echo 	"menu_icon"										"rui/weapon_icons/r5/weapon_r301"                             >> output\mp_weapon_%Name%.txt
echo 	"hud_icon"										"rui/weapon_icons/r5/weapon_r301"                             >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"weaponClass" 									"human"                                                       >> output\mp_weapon_%Name%.txt
echo 	"weaponSubClass"								"rifle"                                                       >> output\mp_weapon_%Name%.txt
echo 	"body_type"										"medium"                                                      >> output\mp_weapon_%Name%.txt
echo 	"fire_mode"   									"automatic"                                                   >> output\mp_weapon_%Name%.txt
if "%Burst%"=="Yes" (goto Yep81)                                                                                
if "%Burst%"=="No" (goto Nope81)                                                                                 
if "%Burst%"=="yes" (goto Yep81)                                                                               
if "%Burst%"=="no" (goto Nope81)
if "%Burst%"=="Y" (goto Yep81)                                                                                
if "%Burst%"=="N" (goto Nope81)                                                                                 
if "%Burst%"=="y" (goto Yep81)                                                                               
if "%Burst%"=="n" (goto Nope81)      
:Yep81
echo	"is_semi_auto"                                                                 "1"  >> output\mp_weapon_%Name%.txt
:Nope81									
echo 	"pickup_hold_prompt"  							"Hold [USE] [WEAPONNAME]" >> output\mp_weapon_%Name%.txt
echo 	"pickup_press_prompt" 							"[USE] [WEAPONNAME]" >> output\mp_weapon_%Name%.txt
echo 	"minimap_reveal_distance"						"32000" >> output\mp_weapon_%Name%.txt
echo 	"leveled_pickup"								"1" >> output\mp_weapon_%Name%.txt
echo. >> output\mp_weapon_%Name%.txt
echo     "projectile_launch_speed"						"29000" >> output\mp_weapon_%Name%.txt
echo. >> output\mp_weapon_%Name%.txt
echo 	// Menu >> output\mp_weapon_%Name%.txt
echo 	"menu_category"                                 "ar" >> output\mp_weapon_%Name%.txt
echo 	"menu_anim_class"                               "medium" >> output\mp_weapon_%Name%.txt
echo 	"stat_damage" 									"55" >> output\mp_weapon_%Name%.txt
echo 	"stat_range"  									"65" >> output\mp_weapon_%Name%.txt
echo 	"stat_accuracy"   								"90" >> output\mp_weapon_%Name%.txt
echo 	"stat_rof"										"80" >> output\mp_weapon_%Name%.txt
echo. >> output\mp_weapon_%Name%.txt
echo 	// Models >> output\mp_weapon_%Name%.txt
echo 	"viewmodel"   									"mdl/weapons/rspn101/ptpov_rspn101.rmdl" >> output\mp_weapon_%Name%.txt
echo 	"playermodel" 									"mdl/weapons/rspn101/w_rspn101.rmdl" >> output\mp_weapon_%Name%.txt
if "%Projectile%"=="Yes" (goto Yep13)
if "%Projectile%"=="No" (goto Nope13)
if "%Projectile%"=="yes" (goto Yep13)
if "%Projectile%"=="no" (goto Nope13)
if "%Projectile%"=="Y" (goto Yep13)
if "%Projectile%"=="N" (goto Nope13)
if "%Projectile%"=="y" (goto Yep13)
if "%Projectile%"=="n" (goto Nope13)

:Yep13
echo 	"projectilemodel"								"%ProjectileModel%" >> output\mp_weapon_%Name%.txt
:Nope13
echo 	"holster_type"									"rifle"                              >> output\mp_weapon_%Name%.txt                                                                                                                                           
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"chroma_color"									"1.8.4"                       >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"OnWeaponActivate"                              "OnWeaponActivate_R101"                                       >> output\mp_weapon_%Name%.txt
echo     "OnWeaponDeactivate"                            "OnWeaponDeactivate_R101"                                    >> output\mp_weapon_%Name%.txt
echo     "OnWeaponPrimaryAttack"                         "OnWeaponPrimaryAttack_R101"                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"looping_sounds"								"1"                                   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                         >> output\mp_weapon_%Name%.txt
if "%SoundYesOrNo%"=="Yes" (goto Yep3)                                                                                
if "%SoundYesOrNo%"=="No" (goto Nope3)                                                                                 
if "%SoundYesOrNo%"=="yes" (goto Yep3)                                                                               
if "%SoundYesOrNo%"=="no" (goto Nope3) 
if "%SoundYesOrNo%"=="Y" (goto Yep3)                                                                                
if "%SoundYesOrNo%"=="N" (goto Nope3)                                                                                 
if "%SoundYesOrNo%"=="y" (goto Yep3)                                                                               
if "%SoundYesOrNo%"=="n" (goto Nope3)                                                                                   
:Yep3       
echo 	"burst_or_looping_fire_sound_start_1p"			""                                    			      >> output\mp_weapon_%Name%.txt
echo 	"burst_or_looping_fire_sound_middle_1p"			""                                        		      >> output\mp_weapon_%Name%.txt
echo 	"burst_or_looping_fire_sound_end_1p"			""                                      		      >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 	      >> output\mp_weapon_%Name%.txt
echo 	"burst_or_looping_fire_sound_start_3p"			""                                                            >> output\mp_weapon_%Name%.txt
echo 	"burst_or_looping_fire_sound_middle_3p"			""                                        		      >> output\mp_weapon_%Name%.txt
echo 	"burst_or_looping_fire_sound_end_3p"			""                                     			      >> output\mp_weapon_%Name%.txt
echo.                                                                                                                	      >> output\mp_weapon_%Name%.txt
echo 	"burst_or_looping_fire_sound_start_npc"			""                                                            >> output\mp_weapon_%Name%.txt
echo 	"burst_or_looping_fire_sound_middle_npc"		""                                   			      >> output\mp_weapon_%Name%.txt
echo 	"burst_or_looping_fire_sound_end_npc"			""                                                            >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"low_ammo_sound_name_1"							"R101_LowAmmo_Shot1"                  >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt                                                                                                        
echo 	"fire_sound_1_player_1p"						"%FireSound1P%"                                               	      >> output\mp_weapon_%Name%.txt
echo 	"fire_sound_1_player_3p"						"%FireSound3P%"                                               	      >> output\mp_weapon_%Name%.txt
echo 	"fire_sound_2_player_1p"						"%FireSound1P%"                                               	      >> output\mp_weapon_%Name%.txt
echo 	"fire_sound_2_player_3p"						"%FireSound3P%"                                                       >> output\mp_weapon_%Name%.txt
echo 	"fire_sound_2_npc"								"Weapon_r101_SecondShot_NPC"                                  >> output\mp_weapon_%Name%.txt
echo 	"sound_dryfire"									"%DryFireSound%"                                              >> output\mp_weapon_%Name%.txt
echo 	"sound_zoom_in"									"Weapon_r101_ADS_In"                                          >> output\mp_weapon_%Name%.txt
echo 	"sound_zoom_out"								"Weapon_r101_ADS_Out"                                         >> output\mp_weapon_%Name%.txt
goto After5                                                                                                           
:Nope3          
echo.      
echo	        "burst_or_looping_fire_sound_start_1p"			"Weapon_R101_FirstShot_1P"   >> output\mp_weapon_%Name%.txt
echo		"burst_or_looping_fire_sound_middle_1p"			"Weapon_R101_Loop_1P"   >> output\mp_weapon_%Name%.txt
echo		"burst_or_looping_fire_sound_end_1p"			"Weapon_R101_LoopEnd_1P"   >> output\mp_weapon_%Name%.txt
echo.	   >> output\mp_weapon_%Name%.txt
echo		"burst_or_looping_fire_sound_start_3p"			""   >> output\mp_weapon_%Name%.txt
echo		"burst_or_looping_fire_sound_middle_3p"			"Weapon_R101_Loop_3P"   >> output\mp_weapon_%Name%.txt
echo		"burst_or_looping_fire_sound_end_3p"			"Weapon_R101_LoopEnd_3P"   >> output\mp_weapon_%Name%.txt
echo.   >> output\mp_weapon_%Name%.txt
echo		"burst_or_looping_fire_sound_start_npc"			""   >> output\mp_weapon_%Name%.txt
echo		"burst_or_looping_fire_sound_middle_npc"		"weapon_r101_loop_3p_npc_a"   >> output\mp_weapon_%Name%.txt
echo		"burst_or_looping_fire_sound_end_npc"			""   >> output\mp_weapon_%Name%.txt
echo.   >> output\mp_weapon_%Name%.txt
echo		"low_ammo_sound_name_1"							"R101_LowAmmo_Shot1"   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt                                                                                                   
echo		"fire_sound_1_player_1p"						"Weapon_bulletCasings.Bounce">> mp_weapon_%name%.txt              	  >> output\mp_weapon_%Name%.txt
echo		"fire_sound_1_player_3p"						"Weapon_bulletCasings.Bounce">> mp_weapon_%name%.txt              	  >> output\mp_weapon_%Name%.txt
echo		"fire_sound_2_player_1p"						"Weapon_r101_SecondShot_1P">> mp_weapon_%name%.txt                	  >> output\mp_weapon_%Name%.txt
echo		"fire_sound_2_player_3p"						""									  >> output\mp_weapon_%Name%.txt                                      	
echo		"fire_sound_2_npc"								"Weapon_r101_SecondShot_NPC" >> mp_weapon_%name%.txt              >> output\mp_weapon_%Name%.txt
echo		"sound_dryfire"									"assault_rifle_dryfire">> mp_weapon_%name%.txt                    >> output\mp_weapon_%Name%.txt
echo		"sound_zoom_in"									"Weapon_r101_ADS_In">> mp_weapon_%name%.txt                       >> output\mp_weapon_%Name%.txt
echo		"sound_zoom_out"								"Weapon_r101_ADS_Out">> mp_weapon_%name%.txt                      >> output\mp_weapon_%Name%.txt																													  >> output\mp_weapon_%Name%.txt
:After5                                                                                                                  output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt


if "%Explosive%"=="Yes" (goto Yes22)
if "%Explosive%"=="No" (goto No22)
if "%Explosive%"=="yes" (goto Yes22)
if "%Explosive%"=="no" (goto No22)
if "%Explosive%"=="Y" (goto Yes22)
if "%Explosive%"=="N" (goto No22)
if "%Explosive%"=="y" (goto Yes22)
if "%Explosive%"=="n" (goto No22)

:Yes22
echo   		//This makes weapons explosive for future reference! >> output\mp_weapon_%Name%.txt
echo      	"impact_effect_table" 							"exp_defender" >> output\mp_weapon_%Name%.txt
echo		"explosion_damages_owner"						"1" >> output\mp_weapon_%Name%.txt
echo 		"explosion_damage"								"13" >> output\mp_weapon_%Name%.txt
echo		"explosion_inner_radius"  						"110" >> output\mp_weapon_%Name%.txt
echo		"explosionradius" 								"110" >> output\mp_weapon_%Name%.txt
echo		"impulse_force_explosions"   								"10000" >> output\mp_weapon_%Name%.txt
:Nope22
echo     "ammo_clip_size"   								"50000000"                                             >> output\mp_weapon_%Name%.txt
echo     "ammo_default_total"							"5000000000"                                                 >> output\mp_weapon_%Name%.txt
echo     "ammo_stockpile_max"							"5000000000"                                             >> output\mp_weapon_%Name%.txt
echo     "ammo_no_remove_from_stockpile"					"1"                                                       >> output\mp_weapon_%Name%.txt
echo     "ammo_min_to_fire"								"1"                                                   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	// Damage - When Used by Players                                                                              >> output\mp_weapon_%Name%.txt
echo     "damage_near_value"   							"%DamageNear%"                                                >> output\mp_weapon_%Name%.txt
echo     "damage_far_value"								"%DamageFar%"                                                 >> output\mp_weapon_%Name%.txt
echo     "damage_very_far_value"							"%DamageVeryFar%"                                         >> output\mp_weapon_%Name%.txt
echo     "damage_near_value_titanarmor"					"%DamageNear%"                                                >> output\mp_weapon_%Name%.txt
echo     "damage_far_value_titanarmor" 					"%DamageFar%"                                                 >> output\mp_weapon_%Name%.txt
echo     "damage_very_far_value_titanarmor" 				"%DamageVeryFar%"                                         >> output\mp_weapon_%Name%.txt
echo 	"damage_rodeo" 									"100"                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"damage_leg_scale"                              "0.75"                                                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	// Behavior                                                                                                   >> output\mp_weapon_%Name%.txt
echo 	"deployfirst_time"								"1.1"                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     // NPC                                                                                                       >> output\mp_weapon_%Name%.txt
echo 	"proficiency_poor_additional_rest"				"0.2"                                                         >> output\mp_weapon_%Name%.txt
echo 	"proficiency_average_additional_rest"			"0.2"                                                         >> output\mp_weapon_%Name%.txt
echo 	"proficiency_good_additional_rest"				"0.2"                                                         >> output\mp_weapon_%Name%.txt
echo     "proficiency_poor_spreadscale"					"5.0"                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     "proficiency_average_spreadscale" 				"2.0"                                                         >> output\mp_weapon_%Name%.txt
echo     "proficiency_good_spreadscale"					"3.0"                                                         >> output\mp_weapon_%Name%.txt
echo     "proficiency_very_good_spreadscale"   			"2.5"                                                         >> output\mp_weapon_%Name%.txt
echo     "proficiency_perfect_spreadscale"   			"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     "npc_damage_near_value"   						"10"                                                          >> output\mp_weapon_%Name%.txt
echo     "npc_damage_far_value"							"8"                                                           >> output\mp_weapon_%Name%.txt
echo     "npc_damage_near_value_titanarmor"				"0"                                                           >> output\mp_weapon_%Name%.txt
echo     "npc_damage_far_value_titanarmor" 				"0"                                                           >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     "npc_min_engage_range"							"0"                                                           >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     "npc_max_range"   								"2500"                                                        >> output\mp_weapon_%Name%.txt
echo     "npc_max_engage_range"							"2000"                                                        >> output\mp_weapon_%Name%.txt
echo     "npc_min_engage_range_heavy_armor"				"500"                                                         >> output\mp_weapon_%Name%.txt
echo     "npc_max_engage_range_heavy_armor"				"2000"                                                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"npc_min_burst"   								"2"                                                           >> output\mp_weapon_%Name%.txt
echo 	"npc_max_burst"   								"4"                                                           >> output\mp_weapon_%Name%.txt
echo 	"npc_rest_time_between_bursts_min"				"0.5"                                                         >> output\mp_weapon_%Name%.txt
echo 	"npc_rest_time_between_bursts_max"				"0.8"                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	// Behavior                                                                                                   >> output\mp_weapon_%Name%.txt
echo 	"fire_rate"   									"%FireRate%"                                                  >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     "viewmodel_offset_hip"                          "0 1.1 0.4"                                                  >> output\mp_weapon_%Name%.txt
echo 	"viewmodel_offset_ads"							"0 0.38 0"                                                    >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"dof_zoom_nearDepthStart"						"-0.5"                                                        >> output\mp_weapon_%Name%.txt
echo 	"dof_zoom_nearDepthEnd"							"5.05"                                                        >> output\mp_weapon_%Name%.txt
echo 	"dof_nearDepthStart"							"0.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"dof_nearDepthEnd"							    "0.0"                                                         >> output\mp_weapon_%Name%.txt
echo.     
if "%Burst%"=="Yes" (goto Yep8)                                                                                
if "%Burst%"=="No" (goto Nope8)                                                                                 
if "%Burst%"=="yes" (goto Yep8)                                                                               
if "%Burst%"=="no" (goto Nope8)  
if "%Burst%"=="Y" (goto Yep8)                                                                                
if "%Burst%"=="N" (goto Nope8)                                                                                 
if "%Burst%"=="y" (goto Yep8)                                                                               
if "%Burst%"=="n" (goto Nope8)   
:Yep8
echo	"burst_fire_count"								"%BurstAmount%" >> output\mp_weapon_%Name%.txt
echo	"burst_fire_delay"								"%BurstDelay%" >> output\mp_weapon_%Name%.txt
:Nope8                                                                                                      >> output\mp_weapon_%Name%.txt
echo 	"reload_time" 									"%ReloadSpeed%"                                                         >> output\mp_weapon_%Name%.txt
echo 	"reload_time_late1"								"%ReloadSpeedLate%"                                                         >> output\mp_weapon_%Name%.txt
echo 	"reloadempty_time"								"%ReloadSpeedEmpty%"                                                         >> output\mp_weapon_%Name%.txt
echo 	"reloadempty_time_late1"						"%ReloadSpeedEmpty%"                                                        >> output\mp_weapon_%Name%.txt
echo 	"reloadempty_time_late2"						"%ReloadSpeedEmpty%"                                                         >> output\mp_weapon_%Name%.txt
echo 	"vortex_refire_behavior"  						"bullet"                                                      >> output\mp_weapon_%Name%.txt
echo 	"allow_empty_fire"								"0"                                                           >> output\mp_weapon_%Name%.txt
echo 	"reload_enabled"  								"1"                                                           >> output\mp_weapon_%Name%.txt
echo 	"allow_empty_click"   							"1"                                                           >> output\mp_weapon_%Name%.txt
echo 	"empty_reload_only"   							"0"                                                           >> output\mp_weapon_%Name%.txt
echo 	"allow_headshots" 								"1"                                                           >> output\mp_weapon_%Name%.txt
echo 	"primary_fire_does_not_block_sprint"			"0"                                                           >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	// View Kick                                                                                                  >> output\mp_weapon_%Name%.txt
echo 	"viewkick_pattern"                              "rspn101_2"                                                   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     "viewkick_spring"                               "rspn101_vkp"                                                >> output\mp_weapon_%Name%.txt
echo     "viewkick_spring_hot"                           "rspn101_vkp_hot"                                            >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     "viewkick_spring_heatpershot"                   "1.0"                                                        >> output\mp_weapon_%Name%.txt
echo     "viewkick_spring_cooldown_holdtime"             "0.08"                                                       >> output\mp_weapon_%Name%.txt
echo     "viewkick_spring_cooldown_fadetime"             "0.05"                                                       >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo     "viewmodel_spring_jolt"                          "autofire_viewmodel_jolt"                                   >> output\mp_weapon_%Name%.txt
echo     "viewmodel_jolt_scale"                           "1.0"                                                       >> output\mp_weapon_%Name%.txt
echo     "viewmodel_jolt_backwardPerShot"                 "-0.3"                                                      >> output\mp_weapon_%Name%.txt
echo     "viewmodel_jolt_roll"                            "0 3.5 0.0"                                                 >> output\mp_weapon_%Name%.txt
echo     "viewmodel_jolt_side"                            "0 0.05 0"                                                  >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"viewkick_pitch_base" 							"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_pitch_random"   						"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_pitch_softScale"						"2.325"   //2.1                                               >> output\mp_weapon_%Name%.txt
echo 	"viewkick_pitch_hardScale"						"0.35"                                                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"viewkick_yaw_base"   							"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_yaw_random" 							"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_yaw_random_innerexclude"				"0.05"   //0                                                  >> output\mp_weapon_%Name%.txt
echo 	"viewkick_yaw_softScale"  						"0.725"  //.65                                                >> output\mp_weapon_%Name%.txt
echo 	"viewkick_yaw_hardScale"  						"0.35"                                                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"viewkick_roll_base"  							"0.8"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_roll_randomMin" 						"-0.2"                                                        >> output\mp_weapon_%Name%.txt
echo 	"viewkick_roll_randomMax" 						"0.2"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_roll_softScale" 						"0.7"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_roll_hardScale" 						"0.45"                                                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"viewkick_hipfire_weaponFraction" 				"0.05"                                                        >> output\mp_weapon_%Name%.txt
echo 	"viewkick_hipfire_weaponFraction_vmScale" 		"0.95"                                                        >> output\mp_weapon_%Name%.txt
echo 	"viewkick_ads_weaponFraction" 					"0.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_ads_weaponFraction_vmScale" 			"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_firstshot_hipfire"			    "1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_min_hipfire"  					"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_max_hipfire"  					"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_firstshot_ads"					"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_min_ads"  						"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_max_ads"  						"1.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_valuePerShot" 					"1"                                                           >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_pitch_valueLerpStart"   		"0"                                                           >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_pitch_valueLerpEnd" 			"6"                                                           >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_yaw_valueLerpStart"   			"0"                                                           >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_yaw_valueLerpEnd" 				"6"                                                           >> output\mp_weapon_%Name%.txt
echo 	"viewkick_scale_valueDecayDelay"  				"0.09"                                                        >> output\mp_weapon_%Name%.txt
echo     "viewkick_scale_valueDecayRate"   				"50"                                                          >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"viewkick_perm_pitch_base" 						"0.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_perm_pitch_random"   					"0.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_perm_yaw_base"   						"0.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_perm_yaw_random" 						"0.0"                                                         >> output\mp_weapon_%Name%.txt
echo 	"viewkick_perm_yaw_random_innerexclude"			"0.0"                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"viewmodel_shake_forward"						"0.2"                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	//setting to "0" so it's tunable in Bakery                                                                    >> output\mp_weapon_%Name%.txt
echo 	"sprintcycle_time"								"0"                                                           >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	// Bodygroups:                                                                                                >> output\mp_weapon_%Name%.txt
echo 	"clip_bodygroup"						"r101_magazine"                                                       >> output\mp_weapon_%Name%.txt
echo 	"clip_bodygroup_index_shown"			"0"                                                                   >> output\mp_weapon_%Name%.txt
echo 	"clip_bodygroup_index_hidden"			"1"                                                                   >> output\mp_weapon_%Name%.txt
echo 	"clip_bodygroup_show_for_milestone_0"	"1"                                                                   >> output\mp_weapon_%Name%.txt
echo 	"clip_bodygroup_show_for_milestone_1"	"0"                                                                   >> output\mp_weapon_%Name%.txt
echo 	"clip_bodygroup_show_for_milestone_2"	"1"                                                                   >> output\mp_weapon_%Name%.txt
echo 	"clip_bodygroup_show_for_milestone_3"	"1"                                                                   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	dof_zoom_focusArea_horizontal					0.061                                                         >> output\mp_weapon_%Name%.txt
echo 	dof_zoom_focusArea_top							0.064                                                         >> output\mp_weapon_%Name%.txt
echo 	dof_zoom_focusArea_bottom						-0.016                                                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	Mods                                                                                                          >> output\mp_weapon_%Name%.txt
echo 	{                                                                                                             >> output\mp_weapon_%Name%.txt
echo 	    gold                                                                                                      >> output\mp_weapon_%Name%.txt
echo 	    {                                                                                                         >> output\mp_weapon_%Name%.txt
echo 	    }                                                                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 		survival_finite_ammo                                                                                    >> output\mp_weapon_%Name%.txt
echo         {                                                                                                        >> output\mp_weapon_%Name%.txt
echo             "ammo_default_total"							"5000000"                                         >> output\mp_weapon_%Name%.txt
echo             "ammo_stockpile_max"							"5000000"                                     >> output\mp_weapon_%Name%.txt
echo             "ammo_no_remove_from_stockpile"					"1"                                               >> output\mp_weapon_%Name%.txt
echo.            "ammo_clip_size"   								"%AmmoClipSize%"                                                                                                    >> output\mp_weapon_%Name%.txt
echo             "low_ammo_fraction" 							"0.0"                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	   		"uses_ammo_pool"								"0"                                                   >> output\mp_weapon_%Name%.txt
echo         }                                                                                                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo         // single shot                                                                                           >> output\mp_weapon_%Name%.txt
echo 		altfire                                                                                                   >> output\mp_weapon_%Name%.txt
echo 		{                                                                                                         >> output\mp_weapon_%Name%.txt
echo 			"mod_activity_modifier"							"fire_select"                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 			"is_semi_auto"									"1"                                                   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 			"fire_sound_1_player_1p"						"Weapon_bulletCasings.Bounce"                         >> output\mp_weapon_%Name%.txt
echo 			"fire_sound_1_player_3p"						"Weapon_bulletCasings.Bounce"                         >> output\mp_weapon_%Name%.txt
echo 			"fire_sound_2_player_1p"						"Weapon_r101_SingleShot_1P"                           >> output\mp_weapon_%Name%.txt
echo 			"fire_sound_2_player_3p"						"Weapon_r101_SingleShot_3P"                           >> output\mp_weapon_%Name%.txt
echo 			"fire_sound_2_npc"								"Weapon_r101_SingleShot_3P"                           >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 			"burst_or_looping_fire_sound_start_1p"			""                                                    >> output\mp_weapon_%Name%.txt
echo 			"burst_or_looping_fire_sound_middle_1p"			""                                                    >> output\mp_weapon_%Name%.txt
echo 			"burst_or_looping_fire_sound_end_1p"			""                                                    >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 			"burst_or_looping_fire_sound_start_3p"			""                                                    >> output\mp_weapon_%Name%.txt
echo 			"burst_or_looping_fire_sound_middle_3p"			""                                                    >> output\mp_weapon_%Name%.txt
echo 			"burst_or_looping_fire_sound_end_3p"			""                                                    >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 			"burst_or_looping_fire_sound_start_npc"			""                                                    >> output\mp_weapon_%Name%.txt
echo 			"burst_or_looping_fire_sound_middle_npc"		""                                                    >> output\mp_weapon_%Name%.txt
echo 			"burst_or_looping_fire_sound_end_npc"			""                                                    >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 			"looping_sounds"								"0"                                                   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 			"low_ammo_sound_name_1"                         "R101_LowAmmo_Shot1"                                  >> output\mp_weapon_%Name%.txt
echo 			"low_ammo_sound_name_2"                         "R101_LowAmmo_Shot2"                                  >> output\mp_weapon_%Name%.txt
echo 			"low_ammo_sound_name_3"                         "R101_LowAmmo_Shot3"                                  >> output\mp_weapon_%Name%.txt
echo 			"low_ammo_sound_name_4"                         "R101_LowAmmo_Shot4"                                  >> output\mp_weapon_%Name%.txt
echo 			"low_ammo_sound_name_5"                         "R101_LowAmmo_Shot5"                                  >> output\mp_weapon_%Name%.txt
echo 			"low_ammo_sound_name_6"                         "R101_LowAmmo_Shot6"                                  >> output\mp_weapon_%Name%.txt
echo 		}                                                                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo         hopup_highcal_rounds                                                                                     >> output\mp_weapon_%Name%.txt
echo         {                                                                                                        >> output\mp_weapon_%Name%.txt
echo         	// This mod is only used to indicate that the hop-up is active                                        >> output\mp_weapon_%Name%.txt
echo         	// When player changes fire modes, we activate "altfire_empowered"                                    >> output\mp_weapon_%Name%.txt
echo         }                                                                                                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo         // single shot empowered                                                                                 >> output\mp_weapon_%Name%.txt
echo         altfire_highcal                                                                                          >> output\mp_weapon_%Name%.txt
echo         {                                                                                                        >> output\mp_weapon_%Name%.txt
echo             "mod_activity_modifier"							"fire_select"                                     >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "is_semi_auto"									"1"                                                   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 			"projectile_trail_effect_0"                     "P_tracer_proj_sniper_piercer"                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "fire_sound_1_player_1p"						"Weapon_bulletCasings.Bounce"                         >> output\mp_weapon_%Name%.txt
echo             "fire_sound_1_player_3p"						"Weapon_bulletCasings.Bounce"                         >> output\mp_weapon_%Name%.txt
echo             "fire_sound_2_player_1p"						"Weapon_r101_SingleShot_1P"                           >> output\mp_weapon_%Name%.txt
echo             "fire_sound_2_player_3p"						"Weapon_r101_SingleShot_3P"                           >> output\mp_weapon_%Name%.txt
echo             "fire_sound_2_npc"								"Weapon_r101_SingleShot_3P"                           >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "burst_or_looping_fire_sound_start_1p"			""                                                    >> output\mp_weapon_%Name%.txt
echo             "burst_or_looping_fire_sound_middle_1p"			""                                                >> output\mp_weapon_%Name%.txt
echo             "burst_or_looping_fire_sound_end_1p"			""                                                    >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "burst_or_looping_fire_sound_start_3p"			""                                                    >> output\mp_weapon_%Name%.txt
echo             "burst_or_looping_fire_sound_middle_3p"			""                                                >> output\mp_weapon_%Name%.txt
echo             "burst_or_looping_fire_sound_end_3p"			""                                                    >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "burst_or_looping_fire_sound_start_npc"			""                                                >> output\mp_weapon_%Name%.txt
echo             "burst_or_looping_fire_sound_middle_npc"		""                                                    >> output\mp_weapon_%Name%.txt
echo             "burst_or_looping_fire_sound_end_npc"			""                                                    >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "looping_sounds"								"0"                                                   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "low_ammo_sound_name_1"                         "R101_LowAmmo_Shot1"                                 >> output\mp_weapon_%Name%.txt
echo             "low_ammo_sound_name_2"                         "R101_LowAmmo_Shot2"                                 >> output\mp_weapon_%Name%.txt
echo             "low_ammo_sound_name_3"                         "R101_LowAmmo_Shot3"                                 >> output\mp_weapon_%Name%.txt
echo             "low_ammo_sound_name_4"                         "R101_LowAmmo_Shot4"                                 >> output\mp_weapon_%Name%.txt
echo             "low_ammo_sound_name_5"                         "R101_LowAmmo_Shot5"                                 >> output\mp_weapon_%Name%.txt
echo             "low_ammo_sound_name_6"                         "R101_LowAmmo_Shot6"                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             // behavior                                                                                          >> output\mp_weapon_%Name%.txt
echo 	        "fire_rate"   					                "3.5"   //"13.5"                                      >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "damage_near_value"   							"35"                                                  >> output\mp_weapon_%Name%.txt
echo             "damage_far_value"								"35"                                                  >> output\mp_weapon_%Name%.txt
echo             "damage_very_far_value"							"35"                                              >> output\mp_weapon_%Name%.txt
echo             "damage_near_value_titanarmor"					"35"                                                  >> output\mp_weapon_%Name%.txt
echo             "damage_far_value_titanarmor" 					"35"                                                  >> output\mp_weapon_%Name%.txt
echo             "damage_very_far_value_titanarmor" 				"35"                                              >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "damage_leg_scale"                              "0.9"                                                >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "ammo_per_shot" 				                "2"                                                   >> output\mp_weapon_%Name%.txt
echo             "ammo_min_to_fire"				                "1"                                                   >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             // viewkick                                                                                          >> output\mp_weapon_%Name%.txt
echo             "viewkick_pattern"                              "rspn101_highcal"                                    >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_spring" 						        "rspn101_highcal_vkp"                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_spring_hot"                           "rspn101_highcal_vkp_hot"                            >> output\mp_weapon_%Name%.txt
echo             "viewkick_spring_cooldown_holdtime"             "0.26"                                               >> output\mp_weapon_%Name%.txt
echo             "viewkick_spring_cooldown_fadetime"             "0.18"                                               >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_scale_valueDecayDelay"                "0.48"                                               >> output\mp_weapon_%Name%.txt
echo             "viewkick_scale_valueDecayRate"                 "25"                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_pitch_base" 							"1.0"                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_pitch_random"   						"1.0"                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_pitch_softScale"						"2.9"                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_pitch_hardScale"						"0.4"                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_yaw_base"   							"1.0"                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_yaw_random" 							"1.0"                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_yaw_random_innerexclude"				"0.05"                                                >> output\mp_weapon_%Name%.txt
echo             "viewkick_yaw_softScale"  						"1.4"                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_yaw_hardScale"  						"0.2"                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_roll_base"  	                        "1.85"                                                >> output\mp_weapon_%Name%.txt
echo             "viewkick_roll_randomMin"                       "-0.2"                                               >> output\mp_weapon_%Name%.txt
echo             "viewkick_roll_randomMax"                       "0.2"                                                >> output\mp_weapon_%Name%.txt
echo             "viewkick_roll_softScale"                       "1.1"                                                >> output\mp_weapon_%Name%.txt
echo             "viewkick_roll_hardScale"                       "0.25"                                               >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "viewkick_hipfire_weaponFraction" 				"0.125"                                               >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "viewmodel_jolt_scale"                          "1.9"           //1.0                                >> output\mp_weapon_%Name%.txt
echo             "viewmodel_jolt_backwardPerShot"                "-0.65"         //-0.3                               >> output\mp_weapon_%Name%.txt
echo             "viewmodel_jolt_roll"                           "0 3.9 0.0"     //0 3.5 0                            >> output\mp_weapon_%Name%.txt
echo             "viewmodel_jolt_side"                           "0 0.065 0"     //0 0.05 0                           >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             // spread                                                                                            >> output\mp_weapon_%Name%.txt
echo             "spread_stand_hip"								"6.5"   //2.5                                         >> output\mp_weapon_%Name%.txt
echo             "spread_stand_hip_run"							"8.5"   //5.5                                         >> output\mp_weapon_%Name%.txt
echo             "spread_stand_hip_sprint"                       "9.5"   //7.0                                        >> output\mp_weapon_%Name%.txt
echo             "spread_crouch_hip"   							"5.0"   //2.0                                         >> output\mp_weapon_%Name%.txt
echo             "spread_air_hip"  								"9.5"   //7.0                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "spread_moving_increase_rate" 					"20"    //3                                           >> output\mp_weapon_%Name%.txt
echo             "spread_moving_decay_rate" 						"25"    //10.5                                    >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "spread_kick_on_fire_stand_hip"   				"0.65"  //0.2                                         >> output\mp_weapon_%Name%.txt
echo             "spread_kick_on_fire_crouch_hip"  				"0.65"  //0.2                                         >> output\mp_weapon_%Name%.txt
echo             "spread_kick_on_fire_air_hip" 					"0.65"  //0.2                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "spread_max_kick_stand_hip"   					"9.0"   //2.0                                         >> output\mp_weapon_%Name%.txt
echo             "spread_max_kick_crouch_hip"  					"6.0"   //1.5                                         >> output\mp_weapon_%Name%.txt
echo             "spread_max_kick_air_hip" 						"9.0"   //3.0                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo             "spread_decay_delay"  							"0.275" //0.25                                        >> output\mp_weapon_%Name%.txt
echo             "spread_decay_rate"   							"12"    //10                                          >> output\mp_weapon_%Name%.txt
echo         }                                                                                                        >> output\mp_weapon_%Name%.txt
echo // end HAS_HIGHCAL_ROUNDS                                                                                        >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 		barrel_stabilizer_l4_flash_hider                                                                          >> output\mp_weapon_%Name%.txt
echo 		{                                                                                                         >> output\mp_weapon_%Name%.txt
echo 			"fx_muzzle_flash_view"		"wpn_muzzleflash_assault_sup_FP"                                          >> output\mp_weapon_%Name%.txt
echo 			"fx_muzzle_flash_world"		"wpn_muzzleflash_assault_sup"                                             >> output\mp_weapon_%Name%.txt
echo 		}                                                                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 		bullets_mag_l1                                                                                            >> output\mp_weapon_%Name%.txt
echo 		{                                                                                                         >> output\mp_weapon_%Name%.txt
echo 			"ammo_clip_size" 		 "++5"                                                             >> output\mp_weapon_%Name%.txt
echo 		}                                                                                                         >> output\mp_weapon_%Name%.txt
echo 		bullets_mag_l2                                                                                            >> output\mp_weapon_%Name%.txt
echo 		{                                                                                                         >> output\mp_weapon_%Name%.txt
echo 			"ammo_clip_size" 		 "++8"                                                             >> output\mp_weapon_%Name%.txt
echo 		}                                                                                                         >> output\mp_weapon_%Name%.txt
echo 		bullets_mag_l3                                                                                            >> output\mp_weapon_%Name%.txt
echo 		{                                                                                                         >> output\mp_weapon_%Name%.txt
echo 			"ammo_clip_size"		 "++11"                                                             >> output\mp_weapon_%Name%.txt
echo 		}                                                                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	}                                                                                                             >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"ui1_enable"		"1"                                                                                       >> output\mp_weapon_%Name%.txt
echo 	"ui1_draw_cloaked"	"1"                                                                                       >> output\mp_weapon_%Name%.txt
echo 	UiData1                                                                                                       >> output\mp_weapon_%Name%.txt
echo 	{                                                                                                             >> output\mp_weapon_%Name%.txt
echo 		"ui"							"ui/r301_reticle"                                                         >> output\mp_weapon_%Name%.txt
echo 		"mesh"							"models/weapons/attachments/r301_rui_upper"                               >> output\mp_weapon_%Name%.txt
echo 		Args                                                                                                      >> output\mp_weapon_%Name%.txt
echo 		{                                                                                                         >> output\mp_weapon_%Name%.txt
echo 			vis							player_zoomfrac                                                           >> output\mp_weapon_%Name%.txt
echo 			ammo						weapon_ammo                                                               >> output\mp_weapon_%Name%.txt
echo 			clipSize					weapon_clipSize                                                           >> output\mp_weapon_%Name%.txt
echo 		}                                                                                                         >> output\mp_weapon_%Name%.txt
echo 	}                                                                                                             >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	"ui2_enable"		"1"                                                                                       >> output\mp_weapon_%Name%.txt
echo 	UiData2                                                                                                       >> output\mp_weapon_%Name%.txt
echo 	{                                                                                                             >> output\mp_weapon_%Name%.txt
echo 		"ui"							"ui/r101_ammo_counter"                                                    >> output\mp_weapon_%Name%.txt
echo 		"mesh"							"models/weapons/attachments/r101_rui_lower"                               >> output\mp_weapon_%Name%.txt
echo 		Args                                                                                                      >> output\mp_weapon_%Name%.txt
echo 		{                                                                                                         >> output\mp_weapon_%Name%.txt
echo 			vis							player_zoomfrac                                                           >> output\mp_weapon_%Name%.txt
echo 			ammo						weapon_ammo                                                               >> output\mp_weapon_%Name%.txt
echo 			clipSize					weapon_clipSize                                                           >> output\mp_weapon_%Name%.txt
echo 		}                                                                                                         >> output\mp_weapon_%Name%.txt
echo 	}                                                                                                             >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	active_crosshair_count				"1"                                                                       >> output\mp_weapon_%Name%.txt
echo 	rui_crosshair_index					"0"                                                                       >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 	RUI_CrosshairData                                                                                             >> output\mp_weapon_%Name%.txt
echo 	{                                                                                                             >> output\mp_weapon_%Name%.txt
echo 		DefaultArgs                                                                                               >> output\mp_weapon_%Name%.txt
echo 		{                                                                                                         >> output\mp_weapon_%Name%.txt
echo 			adjustedSpread				weapon_spread                                                             >> output\mp_weapon_%Name%.txt
echo 			adsFrac 					player_zoomFrac                                                           >> output\mp_weapon_%Name%.txt
echo 			isSprinting					player_is_sprinting                                                       >> output\mp_weapon_%Name%.txt
echo 			isReloading					weapon_is_reloading                                                       >> output\mp_weapon_%Name%.txt
echo 			teamColor					crosshair_team_color                                                      >> output\mp_weapon_%Name%.txt
echo 			isAmped						weapon_is_amped                                                           >> output\mp_weapon_%Name%.txt
echo 			crosshairMovementX          crosshair_movement_x                                                      >> output\mp_weapon_%Name%.txt
echo 			crosshairMovementY          crosshair_movement_y                                                      >> output\mp_weapon_%Name%.txt
echo 		}                                                                                                         >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
echo 		Crosshair_1                                                                                               >> output\mp_weapon_%Name%.txt
echo 		{                                                                                                         >> output\mp_weapon_%Name%.txt
echo 			"ui"						"ui/crosshair_tri"                                                        >> output\mp_weapon_%Name%.txt
echo 			"base_spread"				"0.0"                                                                     >> output\mp_weapon_%Name%.txt
echo 			Args                                                                                                  >> output\mp_weapon_%Name%.txt
echo 			{                                                                                                     >> output\mp_weapon_%Name%.txt
echo 				//isFiring				weapon_is_firing                                                          >> output\mp_weapon_%Name%.txt
echo 			}                                                                                                     >> output\mp_weapon_%Name%.txt
echo 		}                                                                                                         >> output\mp_weapon_%Name%.txt
echo 	}                                                                                                             >> output\mp_weapon_%Name%.txt
echo }                                                                                                                >> output\mp_weapon_%Name%.txt
echo.                                                                                                                 >> output\mp_weapon_%Name%.txt
copy output\mapspawn_and_dev_menu.txt 
cls

echo The Commands For Map Spawn Are	PrecacheWeapon( $"mp_weapon_%Name%" ) >> output\mapspawn_and_dev_menu.txt
echo The Commands For Dev Menu Are 	SetupDevCommand( "%PrintName%", "give mp_weapon_%Name%" )>> output\mapspawn_and_dev_menu.txt
echo. >> output\mapspawn_and_dev_menu.txt
echo The Command For The JANU's Framework is  mp_weapon_%Name% >> output\mapspawn_and_dev_menu.txt
echo If you use JANU's Framework you do not need to map spawn or use the dev menu! >> output\mapspawn_and_dev_menu.txt
echo. Please wait 5 seconds before proceeding!
PING localhost -n 5 >NUL
cls
echo.
echo.
echo Files Created On Your Computer!
echo Please Enjoy Your Scripts!
echo.
echo.
pause

