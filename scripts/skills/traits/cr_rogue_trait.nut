this.cr_rogue_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.cr_rogue";
		this.m.Name = "Reorganization";
		this.m.Icon = "ui/traits/aggressive_trait.png";
		this.m.Description = "=Reorganization=";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.Trait;
		this.m.IsHidden = true;
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/money.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]Costs no upkeep[/color]"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.DailyWageMult *= 0;	
		_properties.XPGainMult *= (this.World.Flags.get("RogueXPincrease") ? 2.25 : 1.6667);
		if (this.World.Flags.get("RogueSpecialBuff_3") == true)
		{
			_properties.DamageReceivedRangedMult *= 0.8;				
		}				
	}

	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();

		if (actor != null && !actor.isNull() && actor.isAlive())
		{
			actor.setHitpoints(actor.getHitpointsMax());
		}
		local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local bodyAdded = body ? body.getArmorMax() - body.getArmor() : 0;
		if (bodyAdded > 0)
		{
			body.setArmor(body.getArmor() + bodyAdded);	
		}	
		local helm = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		local helmAdded = helm ? helm.getArmorMax() - helm.getArmor() : 0;
		if (helmAdded > 0)
		{
			helm.setArmor(helm.getArmor() + helmAdded);	
		}	
		local skills = actor.getSkills().getAllSkillsOfType(this.Const.SkillType.TemporaryInjury);
		foreach( s in skills )
		{
			s.removeSelf();
		}		
		actor.setDirty(true);		
	}	
	
	function onCombatStarted()
	{
		if (!this.getContainer().getActor().getSkills().hasSkill("trait.cr_rogue_mark"))
		{
			this.removeSelf();	
		}	
		else
		{
			this.getContainer().getActor().getSkills().removeByID("trait.cr_rogue_mark");
		}
		if (this.World.Flags.get("RogueSpecialBuff_1") == true)
		{
			this.getContainer().add(this.new("scripts/skills/effects/rogue_special_01_effect"));			
		}
		if (this.World.Flags.get("RogueSpecialBuff_2") == true)
		{
			this.getContainer().add(this.new("scripts/skills/effects/rogue_special_02_effect"));			
		}
		if (("Flags" in this.World) && this.World.Flags != null && this.World.Flags.get("RogueSpecialSkills_2") == true)
		{
			if (this.getContainer().getActor().getSkills().hasSkill("background.cr_rogue_defender"))
			{
				this.getContainer().add(this.new("scripts/skills/perks/perk_crresilient"));
			}
			else if (this.getContainer().getActor().getSkills().hasSkill("background.cr_rogue_vanguard"))
			{
				this.getContainer().add(this.new("scripts/skills/perks/perk_pathfinder"));
			}
			else if (this.getContainer().getActor().getSkills().hasSkill("background.cr_rogue_guard"))
			{
				this.getContainer().add(this.new("scripts/skills/perks/perk_colossus"));
			}	
			else if (this.getContainer().getActor().getSkills().hasSkill("background.cr_rogue_medic"))
			{
				this.getContainer().add(this.new("scripts/skills/perks/perk_rotation"));
			}
			else if (this.getContainer().getActor().getSkills().hasSkill("background.cr_rogue_sniper"))
			{
				this.getContainer().add(this.new("scripts/skills/perks/perk_bullseye"));
			}
			else if (this.getContainer().getActor().getSkills().hasSkill("background.cr_rogue_specialist"))
			{
				this.getContainer().add(this.new("scripts/skills/perks/perk_legend_alert"));
			}
			else if (this.getContainer().getActor().getSkills().hasSkill("background.cr_rogue_supporter"))
			{
				this.getContainer().add(this.new("scripts/skills/perks/perk_bags_and_belts"));
			}			
		}		
	}	

});

