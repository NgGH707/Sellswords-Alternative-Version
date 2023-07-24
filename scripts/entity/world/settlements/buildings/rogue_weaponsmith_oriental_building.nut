this.rogue_weaponsmith_oriental_building <- this.inherit("scripts/entity/world/settlements/buildings/weaponsmith_building", {
	m = {},
	function create()
	{
		this.weaponsmith_building.create();
		this.m.ID = "building.rogue_weaponsmith_oriental";
		this.m.UIImage = "ui/settlements/desert_building_04";
		this.m.UIImageNight = "ui/settlements/desert_building_04_night";
	}

	function onUpdateShopList()
	{
		local list = [	
			{
				R = 50,
				P = 0.8,
				S = "weapons/scimitar"
			},
			{
				R = 50,
				P = 0.8,
				S = "weapons/arming_sword"
			},				
			{
				R = 66,
				P = 0.8,
				S = "weapons/noble_sword"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/fencing_sword"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/fighting_axe"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/fighting_spear"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/flail"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/two_handed_flail"
			},				
			{
				R = 66,
				P = 1.0,
				S = "weapons/greataxe"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/greatsword"
			},			
			{
				R = 66,
				P = 1.0,
				S = "weapons/military_cleaver"
			},
			{
				R = 66,
				P = 0.8,
				S = "weapons/shamshir"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/three_headed_flail"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/two_handed_flanged_mace"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/two_handed_hammer"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/warbrand"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/warhammer"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/winged_mace"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/oriental/qatal_dagger"
			},	
			{
				R = 66,
				P = 1.2,
				S = "weapons/rondel_dagger"
			},			
			{
				R = 66,
				P = 1.0,
				S = "weapons/oriental/two_handed_scimitar"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/bardiche"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/battle_whip"
			},				
			//------------T2----------------	
			{
				R = 66,
				P = 1.0,
				S = "weapons/legend_ranged_flail"
			},			
			{
				R = 66,
				P = 1.0,
				S = "weapons/billhook"
			},				
			{
				R = 66,
				P = 1.0,
				S = "weapons/spetum"
			},			
			{
				R = 66,
				P = 1.0,
				S = "weapons/longaxe"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/pike"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/polehammer"
			},	
			{
				R = 40,
				P = 1.0,
				S = "weapons/oriental/polemace"
			},
			{
				R = 40,
				P = 1.0,
				S = "weapons/oriental/swordlance"
			},
			{
				R = 40,
				P = 1.0,
				S = "weapons/oriental/two_handed_saif"
			},				
			{
				R = 66,
				P = 1.0,
				S = "weapons/longsword"
			},	
			{
				R = 75,
				P = 1.0,
				S = "weapons/barbarians/skull_hammer"
			},
			{
				R = 75,
				P = 1.0,
				S = "weapons/barbarians/two_handed_spiked_mace"
			},			
			//------------------------t3--------------------------------------
			{
				R = 75,
				P = 1.0,
				S = "weapons/legend_estoc"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/legend_battle_glaive"
			},		
			{
				R = 66,
				P = 1.0,
				S = "weapons/legend_katar"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/legend_military_goedendag"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/legend_heavy_goedendag"
			},	
			{
				R = 66,
				P = 1.0,
				S = "weapons/longsword03"
			},				
			//------------------------t2--------------------------------------			
			{
				R = 66,
				P = 1.0,
				S = "weapons/legend_voulge"
			},			
			{
				R = 50,
				P = 1.0,
				S = "weapons/legend_reinforced_flail"
			},			
			{
				R = 70,
				P = 1.0,
				S = "weapons/legend_militia_glaive"
			},
			{
				R = 50,
				P = 1.0,
				S = "weapons/legend_longsword"
			},
			{
				R = 66,
				P = 1.0,
				S = "weapons/legend_infantry_axe"
			},
			{
				R = 50,
				P = 1.0,
				S = "weapons/legend_glaive"
			},	
			//------------------------encke--------------------------------------		
			{
				R = 66,
				P = 1.0,
				S = "weapons/spontoon03"
			},	
			{
				R = 50,
				P = 1.0,
				S = "weapons/spontoon02"
			}			
		];

		foreach( i in this.Const.Items.NamedMeleeWeapons )
		{
			list.push({
				R = 98,
				P = 2.0,
				S = i
			});
		}
		
		local mn = this.World.Statistics.getFlags().getAsInt("ArenaFightsWon");

		if (mn <= 8)
		{
			list.extend([
				{
					R = 0,
					P = 1.0,
					S = "weapons/hatchet"
				},	
				{
					R = 0,
					P = 1.0,
					S = "weapons/pitchfork"
				},
				{
					R = 0,
					P = 1.0,
					S = "weapons/shortsword"
				},
				{
					R = 0,
					P = 1.0,
					S = "weapons/militia_spear"
				},
				{
					R = 50,
					P = 1.0,
					S = "weapons/oriental/light_southern_mace"
				},
				{
					R = 50,
					P = 1.0,
					S = "weapons/goedendag"
				},				
			]);
		}
		
		if (mn <= 12)
		{
			list.extend([
				{
					R = 0,
					P = 1.0,
					S = "weapons/oriental/saif"
				},			
				{
					R = 0,
					P = 1.0,
					S = "weapons/falchion"
				},	
				{
					R = 0,
					P = 1.0,
					S = "weapons/morning_star"
				},
				{
					R = 0,
					P = 1.0,
					S = "weapons/scramasax"
				},
				{
					R = 0,
					P = 1.0,
					S = "weapons/military_pick"
				},			
				{
					R = 0,
					P = 1.0,
					S = "weapons/boar_spear"
				},	
				{
					R = 0,
					P = 1.0,
					S = "weapons/hand_axe"
				},	
				{
					R = 0,
					P = 1.0,
					S = "weapons/reinforced_wooden_flail"
				},
				{
					R = 0,
					P = 1.0,
					S = "weapons/woodcutters_axe"
				},			
				{
					R = 0,
					P = 1.0,
					S = "weapons/two_handed_mace"
				},
				{
					R = 0,
					P = 1.0,
					S = "weapons/two_handed_wooden_hammer"
				},	
				{
					R = 0,
					P = 1.0,
					S = "weapons/two_handed_wooden_flail"
				},			
				{
					R = 0,
					P = 1.0,
					S = "weapons/hooked_blade"
				},
				{
					R = 0,
					P = 1.0,
					S = "weapons/warfork"
				},				
			])
		}

		if (mn >= 8)
		{
			list.extend([
				{
					R = 20,
					P = 2.0,
					S = "weapons/greenskins/goblin_falchion"
				},
				{
					R = 20,
					P = 2.0,
					S = "weapons/greenskins/goblin_pike"
				},
				{
					R = 20,
					P = 2.0,
					S = "weapons/greenskins/goblin_spear"
				},
				{
					R = 40,
					P = 2.0,
					S = "weapons/greenskins/goblin_axe"
				},
				{
					R = 60,
					P = 1.0,
					S = "weapons/legend_chain"
				},				
				{
					R = 40,
					P = 1.0,
					S = "weapons/kuangzhanshishuangfu02"
				},
				{
					R = 85,
					P = 1.67,
					S = "weapons/crbarbarian_hammer"
				},
				{
					R = 85,
					P = 2.0,
					S = "weapons/crbarbarian_mace"
				},				
			]);
		}	

		if (mn >= 12)
		{
			list.extend([
				{
					R = 20,
					P = 2.25,
					S = "weapons/greenskins/orc_axe"
				},
				{
					R = 20,
					P = 2.25,
					S = "weapons/greenskins/orc_axe_2h"
				},
				{
					R = 20,
					P = 2.25,
					S = "weapons/greenskins/orc_cleaver"
				},
				{
					R = 20,
					P = 2.25,
					S = "weapons/greenskins/orc_flail_2h"
				},			
				{
					R = 40,
					P = 1.0,
					S = "weapons/kuangzhanshishuangfu"
				},		
				{
					R = 40,
					P = 1.0,
					S = "weapons/kuangzhanshishuangkandao"
				},				
				//------------------------legend orcs--------------------------------------		
				{
					R = 30,
					P = 2.25,
					S = "weapons/greenskins/legend_bough"
				},	
				{
					R = 30,
					P = 2.25,
					S = "weapons/greenskins/legend_limb_lopper"
				},	
				{
					R = 30,
					P = 2.25,
					S = "weapons/greenskins/legend_man_mangler"
				},	
				{
					R = 30,
					P = 2.25,
					S = "weapons/greenskins/legend_skullbreaker"
				},
				{
					R = 30,
					P = 2.25,
					S = "weapons/greenskins/legend_skullsmasher"
				},
				{
					R = 30,
					P = 1.5,
					S = "weapons/greenskins/legend_meat_hacker"
				},
				{
					R = 30,
					P = 2.25,
					S = "weapons/greenskins/legend_skin_flayer"
				},
				//------------------------legend others--------------------------------------	
				{
					R = 50,
					P = 1.2,
					S = "weapons/ancient/legend_fan_axe"
				},
				{
					R = 50,
					P = 1.5,
					S = "weapons/ancient/legend_great_khopesh"
				},				
			]);
		}	

		if (mn >= 15)
		{
			list.extend([
				//-----------------------------SS-------------------
				{
					R = 50,
					P = 1.0,
					S = "weapons/legend_military_voulge"
				},	
				{
					R = 50,
					P = 1.0,
					S = "weapons/legend_swordstaff"
				},			
				{
					R = 50,
					P = 1.0,
					S = "weapons/crlongaxe"
				},
				{
					R = 50,
					P = 1.0,
					S = "weapons/crorc_mace"
				},
				{
					R = 50,
					P = 1.0,
					S = "weapons/crpolehammer"
				},
				{
					R = 50,
					P = 1.0,
					S = "weapons/crpolemace"
				},
				{
					R = 50,
					P = 1.0,
					S = "weapons/crranged_flail"
				},	
				{
					R = 50,
					P = 1.0,
					S = "weapons/crswordlance"
				},
				{
					R = 50,
					P = 1.0,
					S = "weapons/legend_halberd"
				},				
			]);
			
			foreach( i in this.Const.Items.NamedMeleeWeapons )
			{
				list.push({
					R = 99,
					P = 2.0,
					S = i
				});
			}
			foreach( i in this.Const.Items.NamedOrcWeapons )
			{
				list.push({
					R = 98,
					P = 2.0,
					S = i
				});
			}	
			foreach( i in this.Const.Items.NamedGoblinWeapons )
			{
				list.push({
					R = 98,
					P = 2.0,
					S = i
				});
			}
			foreach( i in this.Const.Items.NamedBarbarianWeapons )
			{
				list.push({
					R = 98,
					P = 2.0,
					S = i
				});
			}
			foreach( i in this.Const.Items.NamedUndeadWeapons )
			{
				list.push({
					R = 98,
					P = 2.0,
					S = i
				});
			}			
		}		

		this.m.Settlement.onUpdateShopList(this.m.ID, list);
		this.fillStash(list, this.m.Stash, 1.15, false);
	}

});

