::mods_hookExactClass("skills/actives/perfect_focus", function(o) {
	o.getTooltip = function()
	{
		local tooltip = this.skill.getDefaultUtilityTooltip();
		local currentAP = this.getContainer().getActor().getActionPoints();

		tooltip.extend([
			{
				id = 10,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "Action Points will be doubled for the remainder of this round, capped at [color=" + this.Const.UI.Color.PositiveValue + "]18[/color]"
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
				icon = "ui/icons/special.png",
				text = "Become immune to being knocked back, grabbed or swallowed"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You will [color=" + this.Const.UI.Color.NegativeValue + "]not be able to move[/color] from your position"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "You will be [color=" + this.Const.UI.Color.NegativeValue + "]exhausted[/color] on your next turn"
			}
		]);

		if (this.getContainer().hasSkill("effects.ptr_exhausted"))
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "Not usable when Exhausted"
			});
		}

		if (this.getContainer().getActor().isArmedWithRangedWeapon())
		{
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "Not usable when armed with a ranged weapon"
			});
		}			

		return tooltip;
	}
});