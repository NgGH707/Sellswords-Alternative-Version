this.cr_rogue_champion_racial <- this.inherit("scripts/skills/skill", {
	m = {
		level = 0,
		weak = false
	},
	function create()
	{
		this.m.ID = "racial.cr_rogue_champion";
		this.m.Name = "Champion";
		this.m.Description = "";
		this.m.Icon = "";
		//this.m.IconMini = "status_effect_108_mini";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.StatusEffect;	
		this.m.Order = this.Const.SkillOrder.First;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.level == 0;
	}
	
	function onUpdate( _properties )
	{
		if (!::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{
			return;
		}	
		local mn = this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon");	
		this.m.level = this.Math.min(6, this.Math.max(0, (mn - 22) / 8));
		if (this.m.weak)
		{
			this.m.level = this.Math.min(this.Math.max(0, this.m.level - 2), 3);
		}
		//_properties.DamageTotalMult *= 1 + this.m.level * 0.03;
		_properties.BraveryMult *= 1 + this.m.level * 0.1;
		_properties.StaminaMult *= 1 + this.m.level * 0.1;
		_properties.MeleeSkillMult *= 1 + this.m.level * 0.03;
		_properties.RangedSkillMult *= 1 + this.m.level * 0.03;
		_properties.MeleeDefenseMult *= 1 + this.m.level * 0.03;
		_properties.RangedDefenseMult *= 1 + this.m.level * 0.03;
		_properties.InitiativeMult *= 1 + this.m.level * 0.01;
		_properties.HitpointsMult *= 1 + this.m.level * 0.03;
		_properties.ArmorMax[this.Const.BodyPart.Head] += this.m.level * 5;
		_properties.ArmorMax[this.Const.BodyPart.Body] += this.m.level * 5;
		_properties.Armor[this.Const.BodyPart.Head] += this.m.level * 5;
		_properties.Armor[this.Const.BodyPart.Body] += this.m.level * 5;		
		if (this.getContainer().getActor().getBaseProperties().MeleeDefense >= 20 || this.getContainer().getActor().getBaseProperties().RangedDefense >= 20 || this.getContainer().getActor().getBaseProperties().MeleeDefense >= 15 && this.getContainer().getActor().getBaseProperties().RangedDefense >= 15)
		{
			_properties.MeleeDefenseMult *= 1 + this.m.level * 0.03;
			_properties.RangedDefenseMult *= 1 + this.m.level * 0.03;
		}
		else
		{
			_properties.HitpointsMult *= 1 + this.m.level * 0.03;
		}
		
		if (this.m.level == 1)
		{
			this.m.Name = "Maverick";
			this.m.Icon = "ui/traits/trait_icon_64.png";			
		}
		else if (this.m.level == 2)
		{
			this.m.Name = "Pioneer";
			this.m.Icon = "ui/traits/trait_icon_65.png";			
		}
		else if (this.m.level == 3)
		{
			this.m.Name = "Master";
			this.m.Icon = "ui/traits/trait_icon_66.png";			
		}
		else if (this.m.level == 4)
		{
			this.m.Name = "Paragon";
			this.m.Icon = "ui/traits/trait_icon_67.png";			
		}		
		else if (this.m.level == 5)
		{
			this.m.Name = "Champion";
			this.m.Icon = "ui/traits/trait_icon_68.png";
		}
		else if (this.m.level == 6)
		{
			this.m.Name = "Legend";		
			this.m.Icon = "skills/status_effect_69.png";			
		}		
	}

});

