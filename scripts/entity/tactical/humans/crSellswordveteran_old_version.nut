this.crSellswordveteran <- this.inherit("scripts/entity/tactical/human", {
	m = {
		IsLow = false
	},
	function create()
	{
		this.m.Type = this.Const.EntityType.crSellswordveteran;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.crSellswordveteran.XP;
		this.human.create();
		this.m.Bodies = this.Const.Bodies.AllMale;
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.BeardChance = 40;
		this.m.Ethnicity = 1;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.crSellswordveteran);
		b.IsSpecializedInThrowing = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_nomads");

		if (this.Math.rand(1, 100) <= 15)
		{
			local pox = this.getSprite("tattoo_head");
			pox.Visible = true;
			pox.setBrush("bust_head_darkeyes_01");
		}
		else
		{
			local dirt = this.getSprite("dirt");
			dirt.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			this.getSprite("eye_rings").Visible = true;
		}

		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_rebound"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_footwork"));		
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_balance"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));	
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_lithe"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_perfect_fit"));	
		this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_in_the_zone"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_full_force"));

		if (::Is_PTR_Exist)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_momentum"));
		}

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));		
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			this.m.Skills.add(this.new("scripts/skills/traits/iron_jaw_trait"));

			if (::Is_PTR_Exist)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigorous_assault"));
			}
		}

		if (this.World.getTime().Days >= 180)
		{
			b.MeleeSkill += 2;
			b.RangedSkill += 2;			
			b.Bravery += 5;

			if (this.World.getTime().Days >= 220)
			{
				b.MeleeDefense += 3;
				b.RangedDefense += 3;				

				if (this.World.getTime().Days >= 260)
				{					
					b.MeleeSkill += 1;			
					b.RangedDefense += 1;			
					b.Bravery += 5;
					if (this.World.getTime().Days >= 300)
					{
						b.MeleeSkill += 2;
						b.RangedSkill += 2;							
						b.Initiative += 5;
						if (this.World.getTime().Days >= 340)
						{
							b.MeleeDefense += 4;
							b.RangedDefense += 4;							
							b.Initiative += 5;
							b.Bravery += 5;							
						}						
					}		
				}
			}
		}
	}

	function assignRandomEquipment()
	{
	    local r;
	    local v = this.Math.rand(1, 100);
		
		if (v <= 60)		
		{
			if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
			{
				local weapons = [
					"weapons/legend_estoc",
					"weapons/greataxe",
					"weapons/legend_battle_glaive",
					"weapons/three_headed_flail",
					"weapons/legend_military_goedendag",
					"weapons/ancient/legend_great_khopesh",
					"weapons/oriental/two_handed_scimitar"
					"weapons/two_handed_flanged_mace",
					"weapons/two_handed_hammer"			
					"weapons/fighting_spear",				
					"weapons/military_cleaver",
					"weapons/noble_sword",
					"weapons/warhammer",	
					"weapons/fighting_axe",					
					"weapons/scimitar"				
				]


				this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
				
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));					
				this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_muscularity"));

				if (::Is_PTR_Exist)
				{
					//this.m.Skills.addTreeOfEquippedWeapon(7);

					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_survival_instinct"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_menacing"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bully"));	
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_exude_confidence"));
				}

				::Mod_Chirutiru.HookHelper.addTreeOfEquippedWeapon(this);		
			}
            
			if (::Is_PTR_Exist && this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand) != null)
			{
				this.m.Skills.addPerkTree(this.Const.Perks.TwoHandedTree);
			}	
			
			else if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
			{
				this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_double_strike"));
				
				if (this.Math.rand(1, 100) <= 66)
				{
					r = this.Math.rand(0, 2);

					if (r == 0)
					{
						this.m.Items.equip(this.new("scripts/items/tools/fire_bomb_item"));
					}
					else if (r == 1)
					{
						this.m.Items.equip(this.new("scripts/items/tools/daze_bomb_item"));
					}
					else if (r == 2)
					{
						this.m.Items.equip(this.new("scripts/items/tools/acid_flask_item"));
					}
				}
				else
				{
					r = this.Math.rand(0, 1);

					if (r == 0)
					{
						this.m.Items.equip(this.new("scripts/items/tools/throwing_net"));
					}
					else if (r == 1)
					{
						this.m.Items.equip(this.new("scripts/items/tools/reinforced_throwing_net"));
					}
				}
			}

			if (this.getIdealRange() == 1 && this.Math.rand(1, 100) <= 80)
			{
				r = this.Math.rand(1, 3);

				if (r == 1)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
				}
				else if (r == 2)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
				}
				else if (r == 3)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_spear"));
				}

			}
			
            local amr = this.Math.rand(1, 10);
			
            if (amr <= 6)	
  			{
				this.m.Items.equip(this.Const.World.Common.pickArmor([
					[
						1,
						"sellsword_armor_heavy_north"
					]
				]));
				
				this.m.Items.equip(this.Const.World.Common.pickHelmet([
					[
						1,
						"sellsword_helmet_heavy_north"
					]
				]))
			}
            else if (amr <= 10)	
  			{
				this.m.Items.equip(this.Const.World.Common.pickArmor([
					[
						1,
						"sellsword_armor_heavy_south"
					]
				]));
				
				this.m.Items.equip(this.Const.World.Common.pickHelmet([
					[
						1,
						"sellsword_helmet_heavy_south"
					]
				]))
			}		
		}
		
		else if (v <= 85)
		{
			if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
			{
				local weapons = [
					"weapons/legend_halberd",
					"weapons/legend_swordstaff",
					"weapons/legend_military_voulge",
					"weapons/longaxe",
					"weapons/polehammer",
					"weapons/polehammer",
					"weapons/two_handed_flanged_mace",
					"weapons/oriental/polemace",	
					"weapons/oriental/swordlance",
					"weapons/oriental/swordlance"		
				]

				this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
				
				this.m.BaseProperties.MeleeSkill += 5;
				this.m.BaseProperties.MeleeDefense -= 10;				
			    this.m.Skills.add(this.new("scripts/skills/perks/perk_killing_frenzy"));
			    this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_muscularity"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_push_the_advantage"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_onslaught"));				

				if (::Is_PTR_Exist)
				{
					//this.m.Skills.addTreeOfEquippedWeapon(7);
					this.m.Skills.addPerkTree(this.Const.Perks.PolearmTree);

					this.m.Skills.removeByID("perk_ptr_vigorous_assault");
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_unstoppable"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_dismemberment"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_deep_impact"));
				}

				::Mod_Chirutiru.HookHelper.addTreeOfEquippedWeapon(this);
			}


			if (this.getIdealRange() == 1 && this.Math.rand(1, 100) <= 80)
			{
				r = this.Math.rand(1, 3);

				if (r == 1)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
				}
				else if (r == 2)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
				}
				else if (r == 3)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_spear"));
				}

			}

            local amr = this.Math.rand(1, 15);
			
            if (amr <= 9)	
  			{
				this.m.Items.equip(this.Const.World.Common.pickArmor([
					[
						1,
						"sellsword_armor_medium"
					]
				]));
				
				this.m.Items.equip(this.Const.World.Common.pickHelmet([
					[
						1,
						"sellsword_helmet_medium"
					]
				]))
			}
            else if (amr <= 11)	
  			{
				this.m.Items.equip(this.Const.World.Common.pickArmor([
					[
						1,
						"sellsword_armor_ancient"
					]
				]));
				
				this.m.Items.equip(this.Const.World.Common.pickHelmet([
					[
						1,
						"sellsword_helmet_ancient"
					]
				]))
			}
            else if (amr <= 13)	
  			{
				this.m.Items.equip(this.Const.World.Common.pickArmor([
					[
						1,
						"sellsword_armor_undead"
					]
				]));
				
				this.m.Items.equip(this.Const.World.Common.pickHelmet([
					[
						1,
						"sellsword_helmet_undead"
					]
				]))
			}
            else if (amr <= 15)	
  			{
				this.m.Items.equip(this.Const.World.Common.pickArmor([
					[
						1,
						"sellsword_armor_barb"
					]
				]));
				
				this.m.Items.equip(this.Const.World.Common.pickHelmet([
					[
						1,
						"sellsword_helmet_barb"
					]
				]))
			}	
		}
		
		else if (v <= 100)
		{
			if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
			{
				local weapons = [
					"weapons/fighting_spear",
					"weapons/winged_mace",
					"weapons/warhammer"				
				];

				this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
				this.m.BaseProperties.Hitpoints += 10;
				this.m.BaseProperties.MeleeSkill -= 20;
				this.m.BaseProperties.RangedSkill -= 15;
				this.m.BaseProperties.MeleeDefense += 10;
				this.m.BaseProperties.Bravery += 10;
				this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));	
				this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));		
			    this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));			
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_smashing_shields"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_true_believer"));
			    this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));				
				
			    if (::Is_PTR_Exist)
				{
					//this.m.Skills.addTreeOfEquippedWeapon(7);
				    this.m.Skills.addPerkTree(this.Const.Perks.SturdyTree);	
					this.m.Skills.addPerkTree(this.Const.Perks.ResilientTree);

					this.m.Skills.removeByID("perk_ptr_vigorous_assault");
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigilant"));
				    this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_man_of_steel"));
				    this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_the_rush_of_battle"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_personal_armor"));
					this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_bulwark"));
				}

				::Mod_Chirutiru.HookHelper.addTreeOfEquippedWeapon(this);
			}

			r = this.Math.rand(1, 8);
			local shield;

			if (r <= 5)
			{
				shield = this.new("scripts/items/shields/legend_tower_shield");
			}
			else if (r == 6)
			{
				shield = this.new("scripts/items/shields/oriental/metal_round_shield");
			}
			else if (r == 7)
			{
				shield = this.new("scripts/items/shields/beasts/schrat_shield");
			}
			else if (r == 8)
			{
				shield = this.new("scripts/items/shields/oriental/metal_round_shield");
			}		

			this.m.Items.equip(shield);

			this.m.Items.equip(this.Const.World.Common.pickArmor([
				[
					1,
					"sellsword_armor_heavy_north"
				]
			]));
			
			this.m.Items.equip(this.Const.World.Common.pickHelmet([
				[
					1,
					"sellsword_helmet_heavy_north"
				]
			]))
		}	
    }

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");
				
		this.m.Skills.add(this.new("scripts/skills/perks/perk_adrenalin"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steadfast"));	
				
		return true;
	}

});


