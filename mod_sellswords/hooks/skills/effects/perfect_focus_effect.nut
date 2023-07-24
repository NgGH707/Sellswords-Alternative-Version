::mods_hookExactClass("skills/effects/perfect_focus_effect", function(o) {
	o.getTooltip <- function()
	{
		local tooltip = this.skill.getTooltip();
		local currentAP = this.getContainer().getActor().getActionPoints();			
		if (this.m.SkillsUsedCount > 0)
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]+" + this.getMalus() + "%[/color] Fatigue built"
			});
		}

		if (this.m.IsSpent)
		{
			tooltip.extend([
				{
					id = 10,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character has lost focus due to switching to a ranged weapon[/color]"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Action Point and Fatigue costs of movement are greatly increased"
				}
			]);
		}
		else
		{
			tooltip.extend([
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Cannot move from this position"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Immune to being knocked back, grabbed, or swallowed"
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/hitchance.png",
					text = "Has additional [color=" + this.Const.UI.Color.PositiveValue + "]+" + currentAP + "%[/color] chance to hit"
				},					
				{
					id = 10,
					type = "text",
					icon = "ui/icons/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]Will be lost upon switching to a ranged weapon[/color]"
				}
			]);
		}

		return tooltip;
	}
	local onUpdate = o.onUpdate;
	o.onUpdate = function (_properties)
	{
		onUpdate(_properties);
		local malus = this.getMalus() * 0.01;
		_properties.FatigueEffectMult *= 1.0 + malus;
		local currentAP = this.getContainer().getActor().getActionPoints();
		_properties.MeleeSkill += currentAP;							
	}		
});	