this.rogue_armorsmith_oriental_building <- this.inherit("scripts/entity/world/settlements/buildings/armorsmith_building", {
	m = {
		Stash = null
	},
	function getStash()
	{
		return this.m.Stash;
	}

	function create()
	{
		this.armorsmith_building.create();
		this.m.ID = "building.rogue_armorsmith_oriental";
		this.m.UIImage = "ui/settlements/desert_building_01";
		this.m.UIImageNight = "ui/settlements/desert_building_01_night";
	}

	function onUpdateShopList()
	{
		local list = [
			{
				R = 0,
				P = 1.0,
				S = "shields/wooden_shield"
			},
			{
				R = 25,
				P = 1.0,
				S = "shields/kite_shield"
			},
			{
				R = 25,
				P = 1.0,
				S = "shields/heater_shield"
			},
			{
				R = 50,
				P = 1.0,
				S = "shields/oriental/metal_round_shield"
			},	
			{
				R = 75,
				P = 1.0,
				S = "shields/buckler_shield"
			},				
			{
				R = 0,
				P = 1.0,
				S = "legend_armor/cloth/legend_padded_surcoat"
			},		
			{
				R = 0,
				P = 1.0,
				S = "legend_armor/cloth/legend_southern_tunic"
			},
			{
				R = 0,
				P = 0.75,
				S = "legend_armor/cloth/legend_gladiator_harness"
			},
			{
				R = 0,
				P = 1.0,
				S = "legend_armor/cloth/legend_padded_surcoat"
			},
			{
				R = 0,
				P = 1.0,
				S = "legend_armor/cloth/legend_gambeson_plain"
			},
			{
				R = 75,
				P = 1.0,
				S = "legend_armor/cloth/legend_tunic_noble"
			},
			{
				R = 50,
				P = 1.0,
				S = "legend_armor/cloth/legend_southern_noble_surcoat"  
			},	
			{
				R = 30,
				P = 1.0,
				S = "legend_armor/chain/legend_armor_mail_shirt_simple"  	  // 25,-3,250
			},
			{
				R = 75,
				P = 8.0,
				S = "legend_armor/chain/legend_southern_cloth"  			  // 30,-2,50
			},			
			{
				R = 0,
				P = 1.0,
				S = "legend_armor/chain/legend_southern_padded_chest"  		  // 45,-4,325
			},	
			{
				R = 0,
				P = 1.0,
				S = "legend_armor/chain/legend_armor_mail_shirt"              // 50,-6,375
			},	
			{
				R = 20,
				P = 0.7,
				S = "legend_armor/chain/legend_armor_hauberk_sleevless"       // 65,-7,1250
			},	
			{
				R = 30,
				P = 0.7,
				S = "legend_armor/chain/legend_armor_reinforced_mail_shirt"   // 80,-10,1000
			},
			{
				R = 40,
				P = 0.7,
				S = "legend_armor/chain/legend_armor_hauberk"                 // 95,-11,1750
			},
			{
				R = 50,
				P = 0.7,
				S = "legend_armor/chain/legend_southern_mail"                 // 100,-13,1400
			},
			{
				R = 0,
				P = 1.0,
				S = "legend_armor/plate/legend_armor_leather_jacket"          // 25,-3,75
			},	
			{
				R = 75,
				P = 1.0,
				S = "legend_armor/plate/legend_southern_arm_guards"           // 30,-2,300
			},			
			{
				R = 0,
				P = 1.0,
				S = "legend_armor/plate/legend_armor_leather_padded"          // 40,-5,175
			},
			{
				R = 0,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_leather_brigandine"      // 65,-8,750
			},
			{
				R = 75,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_leather_noble"           // 65,-6,1500
			},			
			{
				R = 20,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_scale_shirt"             // 85,-10,1750
			},
			{
				R = 30,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_scale"                  // 100,-12,2250
			},			
			{
				R = 30,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_scale_coat"              // 120,-15,2500
			},
			{
				R = 30,
				P = 0.8,
				S = "legend_armor/plate/legend_armor_plate_chest"             // 140,-20,2500
			},
			{
				R = 40,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_plate_cuirass"           // 165,-24,3500
			},
			{
				R = 50,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_plate_full"              // 180,-26,4500
			},
			{
				R = 60,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_leather_lamellar_heavy"  // 195,-28,5000
			},
			{
				R = 70,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_plate_milanese"          // 235,-34,6000
			},
			{
				R = 80,
				P = 0.7,
				S = "legend_armor/plate/legend_armor_plate_full_greaves"      // 260,-38,7500
			},
			{
				R = 40,
				P = 0.75,
				S = "legend_armor/tabard/legend_common_tabard"                // 5,0,200
			},	
			{
				R = 60,
				P = 0.5,
				S = "legend_armor/tabard/legend_noble_tabard"                 // 10,0,1000
			},	
			{
				R = 50,
				P = 1.0,
				S = "legend_armor/cloak/legend_shoulder_cloth"                // 5,0,50
			},	
			{
				R = 75,
				P = 1.0,
				S = "legend_armor/cloak/legend_southern_scarf_wrap"           // 15,-1,150
			},	
			{
				R = 75,
				P = 1.0,
				S = "legend_armor/cloak/legend_armor_cloak_common"            // 10,-1,100
			},	
			{
				R = 90,
				P = 1.0,
				S = "legend_armor/cloak/legend_armor_cloak_heavy"             // 30,-4,500
			},		
			{
				R = 30,
				P = 1.0,
				S = "legend_armor/armor_upgrades/legend_leather_shoulderguards_upgrade"   // 30,-2,250	
			},	
			{
				R = 50,
				P = 0.8,
				S = "legend_armor/armor_upgrades/legend_metal_pauldrons_upgrade"          // 60,-6,800
			},
			{
				R = 75,
				P = 0.8,
				S = "legend_armor/armor_upgrades/legend_heraldic_plates_upgrade"          // 60,-10,1800	
			},
			{
				R = 30,
				P = 0.8,
				S = "legend_armor/armor_upgrades/legend_leather_neckguard_upgrade"        // 10,-2,250		
			},	
			{
				R = 50,
				P = 0.8,
				S = "legend_armor/armor_upgrades/legend_mail_patch_upgrade"              // 20,-4,500	
			},
			{
				R = 75,
				P = 0.8,
				S = "legend_armor/armor_upgrades/legend_joint_cover_upgrade"             // 30,-6,750		
			},
			{
				R = 40,
				P = 0.8,
				S = "legend_armor/armor_upgrades/legend_double_mail_upgrade"            // 20,+20%,600	
			},
			{
				R = 80,
				P = 0.8,
				S = "legend_armor/armor_upgrades/legend_metal_plating_upgrade"          // 10,+25%,800	
			},	
			{
				R = 0,
				P = 1.0,
				S = "legend_helmets/hood/legend_helmet_padded_cap"          // 40,-1,90 
			},	
			{
				R = 0,
				P = 1.0,
				S = "legend_helmets/hood/legend_helmet_open_chain_hood"     // 65,-3,225	
			},
			{
				R = 0,
				P = 1.23,
				S = "legend_helmets/hood/legend_helmet_chain_hood"          // 80,-4,325 
			},
			{
				R = 20,
				P = 1.0,
				S = "legend_helmets/hood/legend_helmet_chain_hood_full"     // 90,-5,600
			},
			{
				R = 75,
				P = 1.0,
				S = "legend_helmets/hood/legend_helmet_enclave_bevor"       // 120,-8,1000
			},	
			{
				R = 0,
				P = 1.0,
				S = "legend_helmets/helm/legend_helmet_norman_helm"         // 50,-3,150,-1 
			},	
			{
				R = 75,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_sallet"              // 50,-2,800,0	
			},
			{
				R = 20,
				P = 1.0,
				S = "legend_helmets/helm/legend_helmet_kettle_helm_low"     //75,-5,250,-1
			},			
			{
				R = 75,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_barbute"             // 75,-3,1250,-2 
			},
			{
				R = 20,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_flat_top_helm_polished"   // 100,-5,1000,-1
			},	
			{
				R = 30,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_kettle_helm_high"    // 125,-9,850,-1
			},
			{
				R = 90,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_southern_gladiator_helm_crested" //130,-6,2500,-3
			},			
			{
				R = 40,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_southern_helmet_nasal"// 160,-10,2000,-2
			},			
			{
				R = 40,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_great_helm"          // 175,-12,2500,-2
			},		
			{
				R = 50,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_legend_armet"        // 215,-15,3000,-2
			},	
			{
				R = 60,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_legend_frogmouth"    // 250,-18,3500	
			},	
			{
				R = 65,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_enclave_venitian_bascinet"   // 285,-22,4000,-2 
			},	
			{
				R = 70,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_enclave_great_helm"   // 320,-26,4800 
			},
			{
				R = 80,
				P = 0.7,
				S = "legend_helmets/helm/legend_helmet_lion_helm"            // 340,-28,5200
			},	
			{
				R = 0,
				P = 1.0,
				S = "legend_helmets/top/legend_helmet_chain_attachment"      //25,-1,250
			},
			{
				R = 50,
				P = 1.0,
				S = "legend_helmets/top/legend_helmet_facemask"              //35,-1,450,-2
			},
			{
				R = 80,
				P = 0.7,
				S = "legend_helmets/top/legend_helmet_busijun"               //50,-2,1200,-2
			},
			{
				R = 33,
				P = 1.14,
				S = "legend_helmets/top/legend_helmet_faceplate_flat"        //40,-2,350,-1
			},	
			{
				R = 60,
				P = 0.7,
				S = "legend_helmets/top/legend_helmet_faceplate_winged"      //60,-4,800,0
			},	
			{
				R = 75,
				P = 0.7,
				S = "legend_helmets/top/legend_helmet_faceplate_full"        //75,-5,1000,-1 
			},	
			{
				R = 50,
				P = 1.0,
				S = "legend_helmets/vanity/legend_helmet_faction_helmet"      //10,0,100
			},
			{
				R = 50,
				P = 1.0,
				S = "legend_helmets/vanity/legend_helmet_plait"      //10,0,100
			},			
		];

		foreach( i in this.Const.Items.NamedArmors )
		{
			list.push({
				R = 99,
				P = 2.0,
				S = i
			});
		}

		foreach( i in this.Const.Items.NamedHelmets )
		{
			list.push({
				R = 99,
				P = 2.0,
				S = i
			});
		}
		
		foreach( i in this.Const.Items.NamedShields )
		{
			list.push({
				R = 99,
				P = 2.0,
				S = i
			});
		}	

		local mn = this.World.Statistics.getFlags().getAsInt("ArenaFightsWon");

		if (mn >= 6)
		{
			list.extend([
				{
					R = 75,
					P = 1.0,
					S = "shields/legend_tower_shield"
				},
				{
					R = 75,
					P = 1.0,
					S = "shields/legend_faction_tower_shield"
				},	
				{
					R = 90,
					P = 0.75,
					S = "legend_armor/cloak/legend_unhold_fur_cloak"              // 25,-2,1000
				},
				{
					R = 90,
					P = 0.75,
					S = "legend_armor/cloak/legend_serpent_skin_cloak"            // 25,-2,800
				},
				{
					R = 90,
					P = 0.75,
					S = "legend_armor/cloak/legend_lindwurm_scales_cloak"         // 25,-2,1800	
				},				
				{
					R = 90,
					P = 1.5,
					S = "legend_armor/armor_upgrades/legend_heavy_gladiator_upgrade"        // 85,-6,800
				},
				{
					R = 90,
					P = 1.5,
					S = "legend_armor/armor_upgrades/legend_light_gladiator_upgrade"        // 45,-2,400	
				},
				{
					R = 80,
					P = 1.0,
					S = "legend_armor/armor_upgrades/legend_hyena_fur_upgrade"             // 600	
				},				
				{
					R = 80,
					P = 1.0,
					S = "legend_armor/armor_upgrades/legend_direwolf_pelt_upgrade"         // 600	
				},			
				{
					R = 90,
					P = 1.0,
					S = "legend_armor/armor_upgrades/legend_light_padding_replacement_upgrade"  // 2000	
				},
				{
					R = 90,
					P = 1.0,
					S = "legend_armor/armor_upgrades/legend_additional_padding_upgrade"         // 1200	
				},
				{
					R = 90,
					P = 0.8,
					S = "legend_armor/armor_upgrades/legend_bone_platings_upgrade"              // 850	
				},
				{
					R = 99,
					P = 1.5,
					S = "legend_armor/armor_upgrades/legend_horn_plate_upgrade"                 // 4000	
				},
				{
					R = 80,
					P = 2.0,
					S = "weapons/legend_parrying_dagger"
				},				
			]);
		}
		
		if (mn >= 9)
		{
			list.extend([
				{
					R = 75,
					P = 0.7,
					S = "legend_armor/plate/legend_armor_scale_shirt"             // 85,-10,1750
				},
				{
					R = 80,
					P = 0.7,
					S = "legend_armor/plate/legend_armor_scale"                  // 100,-12,2250
				},			
				{
					R = 80,
					P = 0.7,
					S = "legend_armor/plate/legend_armor_scale_coat"              // 120,-15,2500
				},
				{
					R = 85,
					P = 0.8,
					S = "legend_armor/plate/legend_armor_plate_chest"             // 140,-20,2500
				},
				{
					R = 85,
					P = 0.7,
					S = "legend_armor/plate/legend_armor_plate_cuirass"           // 165,-24,3500
				},
				{
					R = 90,
					P = 0.7,
					S = "legend_armor/plate/legend_armor_plate_full"              // 180,-26,4500
				},
				{
					R = 90,
					P = 0.7,
					S = "legend_armor/plate/legend_armor_leather_lamellar_heavy"  // 195,-28,5000
				},
				{
					R = 95,
					P = 0.7,
					S = "legend_armor/plate/legend_armor_plate_milanese"          // 235,-34,6000
				},
				{
					R = 95,
					P = 0.7,
					S = "legend_armor/plate/legend_armor_plate_full_greaves"      // 260,-38,7500
				},
				{
					R = 50,
					P = 0.75,
					S = "legend_armor/tabard/legend_common_tabard"                // 5,0,200
				},	
				{
					R = 75,
					P = 0.5,
					S = "legend_armor/tabard/legend_noble_tabard"                 // 10,0,1000
				},				
				{
					R = 80,
					P = 0.7,
					S = "legend_helmets/helm/legend_helmet_southern_helmet_nasal"// 160,-10,2000,-2
				},			
				{
					R = 85,
					P = 0.7,
					S = "legend_helmets/helm/legend_helmet_great_helm"          // 175,-12,2500,-2
				},		
				{
					R = 85,
					P = 0.7,
					S = "legend_helmets/helm/legend_helmet_legend_armet"        // 215,-15,3000,-2
				},	
				{
					R = 90,
					P = 0.7,
					S = "legend_helmets/helm/legend_helmet_legend_frogmouth"    // 250,-18,3500	
				},	
				{
					R = 90,
					P = 0.7,
					S = "legend_helmets/helm/legend_helmet_enclave_venitian_bascinet"   // 285,-22,4000,-2 
				},	
				{
					R = 95,
					P = 0.7,
					S = "legend_helmets/helm/legend_helmet_enclave_great_helm"   // 320,-26,4800 
				},
				{
					R = 95,
					P = 0.7,
					S = "legend_helmets/helm/legend_helmet_lion_helm"            // 340,-28,5200
				}			
			]);
		}		

		if (mn >= 12)
		{
			list.extend([
				{
					R = 75,
					P = 1.0,
					S = "shields/legend_tower_shield"
				},
				{
					R = 75,
					P = 1.0,
					S = "shields/legend_faction_tower_shield"
				},
				{
					R = 75,
					P = 1.0,
					S = "shields/oriental/metal_round_shield"
				},				
				{
					R = 90,
					P = 0.75,
					S = "legend_armor/cloak/legend_unhold_fur_cloak"              // 25,-2,1000
				},
				{
					R = 90,
					P = 0.75,
					S = "legend_armor/cloak/legend_serpent_skin_cloak"            // 25,-2,800
				},
				{
					R = 90,
					P = 0.75,
					S = "legend_armor/cloak/legend_lindwurm_scales_cloak"         // 25,-2,1800	
				},				
				{
					R = 90,
					P = 1.5,
					S = "legend_armor/armor_upgrades/legend_heavy_gladiator_upgrade"        // 85,-6,800
				},
				{
					R = 90,
					P = 1.5,
					S = "legend_armor/armor_upgrades/legend_light_gladiator_upgrade"        // 45,-2,400	
				},
				{
					R = 80,
					P = 0.8,
					S = "legend_armor/armor_upgrades/legend_hyena_fur_upgrade"             // 600	
				},				
				{
					R = 80,
					P = 0.8,
					S = "legend_armor/armor_upgrades/legend_direwolf_pelt_upgrade"         // 600	
				},			
				{
					R = 90,
					P = 1.0,
					S = "legend_armor/armor_upgrades/legend_light_padding_replacement_upgrade"  // 2000	
				},
				{
					R = 90,
					P = 1.0,
					S = "legend_armor/armor_upgrades/legend_additional_padding_upgrade"         // 1200	
				},
				{
					R = 90,
					P = 0.8,
					S = "legend_armor/armor_upgrades/legend_bone_platings_upgrade"              // 850	
				},
				{
					R = 99,
					P = 1.5,
					S = "legend_armor/armor_upgrades/legend_horn_plate_upgrade"                 // 4000	
				},	
				{
					R = 75,
					P = 1.5,
					S = "legend_armor/shields/special/craftable_schrat_shield"                 // 1000	
				},	
				{
					R = 75,
					P = 1.5,
					S = "legend_armor/shields/special/craftable_lindwurm_shield"                 // 800	
				},				
			]);
		}
		
		if (mn >= 20)
		{	
			foreach( i in this.Const.Items.NamedArmors )
			{
				list.push({
					R = 99,
					P = 2.0,
					S = i
				});
			}
			foreach( i in this.Const.Items.NamedHelmets )
			{
				list.push({
					R = 99,
					P = 2.0,
					S = i
				});
			}			
			foreach( i in this.Const.Items.NamedShields )
			{
				list.push({
					R = 99,
					P = 2.0,
					S = i
				});
			}
			foreach( i in this.Const.Items.NamedSouthernShields )
			{
				list.push({
					R = 99,
					P = 2.0,
					S = i
				});
			}
			foreach( i in this.Const.Items.NamedUndeadShields )
			{
				list.push({
					R = 99,
					P = 2.0,
					S = i
				});
			}			
		}
		this.m.Settlement.onUpdateShopList(this.m.ID, list);
		this.fillStash(list, this.m.Stash, 1.15, false);
	}

});

