::mods_hookExactClass("skills/actives/ptr_swordmaster_versatile_swordsman_stance_meisterhau_skill", function ( o )
{
	o.getTooltip = function ()
	{
		local tooltip = this.ptr_swordmaster_versatile_swordsman_stance_abstract.getTooltip();
		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Currently Active: " + (this.m.IsOn ? "[color=" + this.Const.UI.Color.PositiveValue + "]Yes[/color]" : "[color=" + this.Const.UI.Color.NegativeValue + "]No[/color]")
		});
		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Hitting enemies will add \'Exploitable Opening\' effect on them"
		});
		this.addEnabledTooltip(tooltip);
		return tooltip;
	};
});