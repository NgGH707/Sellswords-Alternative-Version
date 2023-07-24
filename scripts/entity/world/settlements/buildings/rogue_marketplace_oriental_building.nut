this.rogue_marketplace_oriental_building <- this.inherit("scripts/entity/world/settlements/buildings/marketplace_building", {
	m = {},
	function create()
	{
		this.marketplace_building.create();
		this.m.UIImage = "ui/settlements/desert_building_06";
		this.m.UIImageNight = "ui/settlements/desert_building_06_night";
	}

	function onUpdateShopList()
	{
		local list = [
			{
				R = 50,
				P = 2,
				S = "supplies/ground_grains_item"      //20
			},	
			{
				R = 50,
				P = 2,
				S = "supplies/legend_yummy_sausages"      //20
			},
			{
				R = 50,
				P = 2,
				S = "supplies/legend_fresh_fruit_item"      //20
			},				
			{
				R = 50,
				P = 2,
				S = "supplies/ground_grains_item"      //20
			},				
			{
				R = 55,
				P = 2,
				S = "supplies/rice_item"               //25
			},
			{
				R = 60,
				P = 2,
				S = "supplies/goat_cheese_item"        //30 
			},				
			{
				R = 65,
				P = 2,
				S = "supplies/bread_item"              //35
			},
			{
				R = 70,
				P = 2,
				S = "supplies/legend_pudding_item"      //40
			},
			{
				R = 75,
				P = 2,
				S = "supplies/legend_porridge_item"     //45
			},			
			{
				R = 80,
				P = 2,
				S = "supplies/legend_pie_item"          //50
			},	
			{
				R = 85,
				P = 2,
				S = "supplies/cured_rations_item"       //60
			},		
			//---------------------------------------------------------
			{
				R = 50,
				P = 2,
				S = "supplies/legend_yummy_sausages"      //20
			},				
			{
				R = 60,
				P = 2,
				S = "supplies/dried_fish_item"               //25
			},
			{
				R = 65,
				P = 2,
				S = "supplies/smoked_ham_item"        //30 
			},				
			{
				R = 70,
				P = 2,
				S = "supplies/dried_lamb_item"              //35
			},
			{
				R = 80,
				P = 2,
				S = "supplies/cured_venison_item"     //45
			},	
			//---------------------------------------------------------
			{
				R = 50,
				P = 2,
				S = "supplies/legend_fresh_fruit_item"      //20
			},				
			{
				R = 60,
				P = 2,
				S = "supplies/roots_and_berries_item"           //25
			},
			{
				R = 65,
				P = 2,
				S = "supplies/pickled_mushrooms_item"        //30 
			},				
			{
				R = 70,
				P = 2,
				S = "supplies/dried_fruits_item"            //35
			},
			{
				R = 75,
				P = 2,
				S = "supplies/dates_item"      //40
			},
			{
				R = 80,
				P = 2,
				S = "supplies/salad_item"     //45
			},				
			//---------------------------------------------------------			
			{
				R = 75,
				P = 2,
				S = "supplies/mead_item"
			},
			{
				R = 75,
				P = 2,
				S = "supplies/wine_item"
			},			
			{
				R = 75,
				P = 2,
				S = "supplies/beer_item"
			},
			{
				R = 80,
				P = 3,
				S = "supplies/fermented_unhold_heart_item"
			},
			{
				R = 90,
				P = 2,
				S = "supplies/banquet_item"
			},			
			{
				R = 0,
				P = 1.0,
				S = "supplies/medicine_item"
			},
			{
				R = 0,
				P = 1.0,
				S = "supplies/ammo_item"
			},
			{
				R = 0,
				P = 1.0,
				S = "supplies/ammo_item"
			},
			{
				R = 0,
				P = 1.0,
				S = "supplies/armor_parts_item"
			},
			{
				R = 0,
				P = 1.0,
				S = "supplies/armor_parts_item"
			},
			{
				R = 10,
				P = 1.0,
				S = "accessory/bandage_item"
			},
			//{
			//	R = 0,
			//	P = 1.0,
			//	S = "tools/throwing_net"
			//},
			{
				R = 0,
				P = 1.0,
				S = "weapons/throwing_axe"
			},	
			{
				R = 0,
				P = 1.0,
				S = "weapons/javelin"
			},
			{
				R = 0,
				P = 1.0,
				S = "weapons/throwing_spear"
			},			
			{
				R = 20,
				P = 2.0,
				S = "weapons/greenskins/goblin_spiked_balls"
			},	
			{
				R = 50,
				P = 2.0,
				S = "weapons/lute"
			},	
			{
				R = 75,
				P = 2.0,
				S = "weapons/legend_drum"
			},			
			{
				R = 0,
				P = 1.0,
				S = "accessory/wardog_item"
			},
			{
				R = 0,
				P = 1.0,
				S = "accessory/warhound_item"
			},			
			{
				R = 20,
				P = 1.0,
				S = "misc/wardog_armor_upgrade_item"
			},
			{
				R = 60,
				P = 1.0,
				S = "misc/wardog_heavy_armor_upgrade_item"
			},
			{
				R = 60,
				P = 1.0,
				S = "accessory/berserker_mushrooms_item"
			},
			{
				R = 75,
				P = 1.0,
				S = "accessory/legend_apothecary_mushrooms_item"
			}			
		];
		this.m.Settlement.onUpdateShopList(this.m.ID, list);
		this.fillStash(list, this.m.Stash, 1.0, true);
	}

});

