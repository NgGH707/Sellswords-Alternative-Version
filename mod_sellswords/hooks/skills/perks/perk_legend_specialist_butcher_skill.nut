::mods_hookExactClass("skills/perks/perk_legend_specialist_butcher_skill", function ( o )
{
	o.onUpdate = function( _properties )
	{
		local dc = this.World.getTime().Days;
		dc = this.Math.floor(dc/25);
		dc = 0.01 * this.Math.min(5 * dc + 35, 100);	
		local item = this.getContainer().getActor().getMainhandItem();
		if (item != null)
		{
			if (item.getID() == "weapon.butchers_cleaver" || item.getID() == "weapon.legend_named_butchers_cleaver")
			{
				_properties.MeleeSkill += 12;
			}
			else if (item.isWeaponType(this.Const.Items.WeaponType.Cleaver))
			{
				_properties.MeleeSkill += (12 * dc);
			}
		}
	}
});	