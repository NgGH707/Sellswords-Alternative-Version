this.crRetiredsoldier <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.crRetiredsoldier;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.crRetiredsoldier.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.Old;
		this.m.Beards = this.Const.Beards.All;
		this.m.Flags.add("militia");
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/militia_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.crRetiredsoldier);
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");
		this.getSprite("accessory_special").setBrush("bust_militia_band_01");
		this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_recover"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_specialist_militia_damage"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crDiscipline"));

		if (::Is_PTR_Exist)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_phalanx"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_str_cover_ally"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));
		}

		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));		
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_back_to_basics"));			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_rotation"));														
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crAnchor"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));	
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_clarity"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
		
		if (this.World.getTime().Days >= 50)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));		

			if (this.World.getTime().Days >= 80)
			{
				b.Hitpoints += 5;				
				b.MeleeSkill += 5;				
				b.MeleeDefense += 5;				
				b.Bravery += 5;	
				if (this.World.getTime().Days >= 140)
				{
					if (::Is_PTR_Exist)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_vigilant"));
					}
					
					b.MeleeSkill += 2;
					b.MeleeDefense += 2;											

					if (this.World.getTime().Days >= 200)
					{
						b.Hitpoints += 10;				
						b.MeleeSkill += 3;				
						b.MeleeDefense += 3;				
						b.Bravery += 5;					
					}
				}				
			}			
		}

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getEconomicDifficulty() == this.Const.Difficulty.Legendary)
		{
			local dc = this.World.getTime().Days;
			local dca = this.Math.floor(dc/50) + this.Math.floor(dc/100) + this.Math.floor(dc/150) + this.Math.floor(dc/200);
			dca = this.Math.min(dca, 8 + this.Math.floor(dc/100));				
			this.m.BaseProperties.MeleeSkill += dca;
			this.m.BaseProperties.MeleeDefense += 0.5 * dca;
			this.m.BaseProperties.RangedSkill += dca;	
			this.m.BaseProperties.RangedDefense += 0.5 * dca;				
			this.m.BaseProperties.Bravery += dca;
			this.m.BaseProperties.Hitpoints += 2 * dca;	
		}		

	}

	function assignRandomEquipment()
	{

		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand) == null)
		{
			local weapons = [
				"weapons/boar_spear"
			];

			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
			
			if (::Is_PTR_Exist)
			{
				this.m.Skills.addTreeOfEquippedWeapon(4);	
			}			
		}

		this.m.Items.equip(this.new("scripts/items/shields/heater_shield"));

		this.m.Items.equip(this.Const.World.Common.pickArmor([
			[1, "retiredsoldier_armor"]
		]));

		this.m.Items.equip(this.Const.World.Common.pickHelmet([
			[1, "retiredsoldier_helmet"]
		]))
	}

});

