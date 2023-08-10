::mods_hookExactClass("skills/perks/perk_overwhelm", function ( o )
{
	o.onAdded <- function ()
	{
		if (!this.m.Container.hasSkill("actives.zcroverwhelming") && this.getContainer().getActor().isPlayerControlled())
		{
			this.m.Container.add(this.new("scripts/skills/actives/zcroverwhelming"));
		}
	};
	o.onRemoved <- function ()
	{
		this.m.Container.removeByID("actives.zcroverwhelming");
	};
});