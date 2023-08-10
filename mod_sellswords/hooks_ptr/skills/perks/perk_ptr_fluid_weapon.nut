::mods_hookExactClass("skills/perks/perk_ptr_fluid_weapon", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.IconMini = "ptr_fluid_weapon_mini";
	}

	local ws_getTooltip = o.getTooltip;
	o.getTooltip = function()
	{
		local ret = ws_getTooltip();

		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Fatigue to Initiative Rate is decreased by [color=" + this.Const.UI.Color.PositiveValue + "]-" + this.getInitiativeBonus() + "%[/color] "
		});	

		return ret;
	}

	o.onUpdate = function ( _properties )
	{
		if (!this.isEnabled())
		{
			return;
		}		

		_properties.Initiative += this.getInitiativeBonus();
		_properties.FatigueToInitiativeRate *= (1 - this.getInitiativeBonus() * 0.01);		
	}
});	