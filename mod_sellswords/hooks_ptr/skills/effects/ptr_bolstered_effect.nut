::mods_hookExactClass("skills/effects/ptr_bolstered_effect", function(o) {
	o.m.crBonus <- 0;
	o.m.crFactor <- 0.08;

	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		this.m.AllyMeleeSkillFactor = 0.05;
		this.m.Name = "Supported";
		this.m.Description = "This character is feeling stronger thanks to an adjacent ally\'s support.";
	}
	
	o.getTooltip = function()
	{
		local tooltip = this.skill.getTooltip();

		local Bonus = this.m.Bonus;
		local crBonus = this.m.crBonus;
			
		if (Bonus > 0)
		{			
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + Bonus + "[/color] Melee Skill"
			});
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + Bonus + "[/color] Ranged Skill"
			});	
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + Bonus + "[/color] Melee Defense"
			});
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + Bonus + "[/color] Ranged Defense"
			});	
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + Bonus + "[/color] Resolve"
			});				
		}
		
		if (crBonus > 0)
		{			
			tooltip.push({
				id = 11,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + crBonus + "[/color] Initiative"
			});
			tooltip.push({
				id = 11,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + crBonus + "[/color] Melee Defense"
			});
			tooltip.push({
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + crBonus + "[/color] Ranged Defense"
			});			
		}


		return tooltip;
	}

	o.isHidden <- function()
	{
		return this.m.Bonus + this.m.crBonus == 0 || this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Ignore || this.getContainer().getActor().getMoraleState() == this.Const.MoraleState.Fleeing;
	}

	o.onUpdate = function( _properties )
	{
	}

	o.onAfterUpdate <- function( _properties )
	{
		this.m.Bonus = 0;
		this.m.crBonus = 0;		

		if (this.m.IsCombatStarted == false)
		{
			return;
		}

		local actor = this.getContainer().getActor();

		if (!actor.isPlacedOnMap() || actor.getMoraleState() == this.Const.MoraleState.Ignore || actor.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return;
		}

		local allyMeleeSkill = 0;
		local allyMeleeDefense = 0;				
		if (::Tactical.isActive())
		{

			local adjacentAllies = ::Tactical.Entities.getFactionActors(actor.getFaction(), actor.getTile(), 1);
			foreach (ally in adjacentAllies)
			{
				if (!ally.hasZoneOfControl() || ally.getID() == actor.getID())
				{
					continue;
				}

				local allyPerk = ally.getSkills().getSkillByID("perk.ptr_bolster");			
				//if (allyPerk != null && allyPerk.isInEffect())
				if (allyPerk != null)				
				{
					allyMeleeSkill = this.Math.max(allyMeleeSkill, ally.getLevel());
				}
				local crallyPerk = ally.getSkills().getSkillByID("perk.crGuardian");
				if (crallyPerk != null && crallyPerk.isInEffect())
				{
					allyMeleeDefense = this.Math.max(0, ally.getCurrentProperties().getMeleeDefense());
					allyMeleeDefense += this.Math.max(0, ally.getCurrentProperties().getRangedDefense());
				}			
			}
		}		
		if (allyMeleeSkill > 0)
		{
			this.m.Bonus = this.Math.min(allyMeleeSkill * 0.25, 4);
			_properties.MeleeSkill += this.m.Bonus;
			_properties.RangedSkill += this.m.Bonus;
			_properties.MeleeDefense += this.m.Bonus;
			_properties.RangedDefense += this.m.Bonus;	
			_properties.Bravery += this.m.Bonus;				
		}
		if (allyMeleeDefense > 0)
		{
			this.m.crBonus = this.Math.floor(allyMeleeDefense * this.m.crFactor);
			_properties.Initiative += this.m.crBonus;
			_properties.MeleeDefense += this.m.crBonus;
			_properties.RangedDefense += this.m.crBonus;			
		}		
	}
	
	o.onAdded = function()
	{
		this.m.TurnsLeft = 10;
	}
})