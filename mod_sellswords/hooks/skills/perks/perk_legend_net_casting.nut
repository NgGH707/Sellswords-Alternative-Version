::mods_hookExactClass("skills/perks/perk_legend_net_casting", function ( o )
{
	o.onAdded <- function ()
	{
		this.m.Container.add(this.new("scripts/skills/actives/throw_net_free"));
	};
	o.onRemoved <- function ()
	{
		this.m.Container.removeByID("actives.throw_net_free");
	};
});	