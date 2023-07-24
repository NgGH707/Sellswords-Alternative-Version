this.rogue_alchemist_building <- this.inherit("scripts/entity/world/settlements/buildings/building", {
	m = {
		Stash = null
	},
	function getStash()
	{
		return this.m.Stash;
	}

	function create()
	{
		this.building.create();
		this.m.ID = "building.rogue_alchemist";
		this.m.Name = "Alchemist";
		this.m.Description = "Exotic and dangerous alchemical contraptions can be bought here";
		this.m.UIImage = "ui/settlements/desert_building_14";
		this.m.UIImageNight = "ui/settlements/desert_building_14_night";
		this.m.Tooltip = "world-town-screen.main-dialog-module.Alchemist";
		this.m.TooltipIcon = "ui/icons/buildings/alchemist.png";
		this.m.Stash = this.new("scripts/items/stash_container");
		this.m.Stash.setID("shop");
		this.m.Stash.setResizable(true);
		this.m.Sounds = [
			{
				File = "ambience/buildings/alchemist_cooking_pot_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_cooking_pot_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_cooking_pot_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_cooking_pot_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_cooking_pot_05.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_creaking_door_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_grinder_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_grinder_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_metal_pot_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_metal_pot_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_metal_pot_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/alchemist_metal_pot_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [];
	}

	function onClicked( _townScreen )
	{
		_townScreen.getShopDialogModule().setShop(this);
		_townScreen.showShopDialog();
		this.pushUIMenuStack();
	}

	function onSettlementEntered()
	{
		foreach( item in this.m.Stash.getItems() )
		{
			if (item != null)
			{
				item.setSold(false);
			}
		}
	}

	function onUpdateShopList()
	{
		local list = [
			{
				R = 10,
				P = 1.0,
				S = "tools/daze_bomb_item"
			},
			{
				R = 10,
				P = 0.9,
				S = "tools/fire_bomb_item"
			},
			{
				R = 10,
				P = 1.0,
				S = "tools/smoke_bomb_item"
			},
			{
				R = 50,
				P = 1.0,
				S = "tools/acid_flask_item"
			},
			{
				R = 10,
				P = 1.0,
				S = "accessory/antidote_item"
			},
			{
				R = 40,
				P = 3.0,
				S = "tools/holy_water_item"
			},	
			{
				R = 40,
				P = 1.0,
				S = "accessory/spider_poison_item"
			},			
			{
				R = 40,
				P = 1.0,
				S = "accessory/cat_potion_item"
			},
			{
				R = 40,
				P = 1.0,
				S = "accessory/iron_will_potion_item"
			},
			{
				R = 40,
				P = 1.0,
				S = "accessory/lionheart_potion_item"
			},
			{
				R = 40,
				P = 1.0,
				S = "accessory/night_vision_elixir_item"
			},
			{
				R = 40,
				P = 1.0,
				S = "accessory/recovery_potion_item"
			},
			{
				R = 40,
				P = 1.0,
				S = "accessory/spider_poison_item"
			},
			//{
			//	R = 40,
			//	P = 1.5,
			//	S = "misc/potion_of_knowledge_item"
			//},			
			{
				R = 10,
				P = 1.0,
				S = "weapons/short_bow"
			},
			{
				R = 20,
				P = 1.0,
				S = "weapons/hunting_bow"
			},
			{
				R = 70,
				P = 1.0,
				S = "weapons/oriental/nomad_sling"
			},
			{
				R = 10,
				P = 1.0,
				S = "weapons/light_crossbow"
			},
			{
				R = 20,
				P = 1.0,
				S = "weapons/crossbow"
			},	
			{
				R = 20,
				P = 1.0,
				S = "weapons/oriental/firelance"
			},
			{
				R = 0,
				P = 1.0,
				S = "ammo/powder_bag"
			},
			{
				R = 0,
				P = 1.0,
				S = "ammo/quiver_of_arrows"
			},
			{
				R = 0,
				P = 1.0,
				S = "ammo/quiver_of_bolts"
			},
			{
				R = 0,
				P = 1.0,
				S = "supplies/ammo_item"
			},
			{
				R = 40,
				P = 1.0,
				S = "ammo/legend_armor_piercing_arrows"
			},
			{
				R = 40,
				P = 1.0,
				S = "ammo/legend_broad_head_arrows"
			},
			{
				R = 40,
				P = 1.0,
				S = "ammo/legend_armor_piercing_bolts"
			},
			{
				R = 40,
				P = 1.0,
				S = "ammo/legend_broad_head_bolts"
			}			
		];
		
		foreach( i in this.Const.Items.NamedRangedWeapons )
		{
			list.push({
				R = 98,
				P = 2.0,
				S = i
			});
		}
		
		local mn = this.World.Statistics.getFlags().getAsInt("ArenaFightsWon");
		
		if (mn >= 8)
		{
			list.extend([
				{
					R = 25,
					P = 1.0,
					S = "weapons/heavy_crossbow"
				},				
				{
					R = 25,
					P = 1.0,
					S = "weapons/war_bow"
				},
				{
					R = 25,
					P = 1.5,
					S = "weapons/greenskins/goblin_heavy_bow"
				},
				{
					R = 25,
					P = 1.0,
					S = "weapons/legend_slingstaff"
				},	
				{
					R = 25,
					P = 1.0,
					S = "weapons/oriental/handgonne"
				},
				{
					R = 33,
					P = 1.0,
					S = "weapons/huomao"
				}
				{
					R = 33,
					P = 0.8,
					S = "tools/acid_flask_item_02"
				},				
			]);
		}

		if (mn >= 12)
		{
			list.extend([
				{
					R = 25,
					P = 1.5,
					S = "weapons/greenskins/goblin_crossbow"
				},				
				{
					R = 70,
					P = 1.0,
					S = "ammo/large_quiver_of_bolts"
				},
				{
					R = 70,
					P = 1.0,
					S = "ammo/large_quiver_of_arrows"
				},
				{
					R = 75,
					P = 0.8,
					S = "accessory/legend_hexen_ichor_potion_item"     //2000
				},
				{
					R = 75,
					P = 0.8,
					S = "accessory/legend_heartwood_sap_flask_item"    //2000
				},	
				{
					R = 75,
					P = 0.8,
					S = "accessory/legend_skin_ghoul_blood_flask_item"    //2000
				},	
				{
					R = 75,
					P = 0.8,
					S = "accessory/legend_stollwurm_blood_flask_item"    //2000
				},					
			]);
			foreach( i in this.Const.Items.NamedRangedWeapons )
			{
				list.push({
					R = 99,
					P = 2.0,
					S = i
				});
			}			
		}		
	
		this.m.Settlement.onUpdateShopList(this.m.ID, list);
		this.fillStash(list, this.m.Stash, 1.0, false);
	}

	function onUpdateDraftList( _list, _gender = null )
	{
		_gender = ::Legends.Mod.ModSettings.getSetting("GenderEquality").getValue() != "Disabled";
		_list.push("legend_alchemist_background");
		_list.push("legend_alchemist_background");
	}

	function onSerialize( _out )
	{
		this.building.onSerialize(_out);
		this.m.Stash.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.building.onDeserialize(_in);
		this.m.Stash.onDeserialize(_in);
	}

});

