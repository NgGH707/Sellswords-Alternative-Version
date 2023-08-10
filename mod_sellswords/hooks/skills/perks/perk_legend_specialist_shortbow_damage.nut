::mods_hookExactClass("skills/perks/perk_legend_specialist_shortbow_damage", function ( o )
{
	o.onUpdate = function ( _properties )
	{
		local dc = this.World.getTime().Days;
		dc = this.Math.floor(dc/7);
		dc = 0.01 * this.Math.min(5 * dc + 35, 100);	
		local item = this.getContainer().getActor().getMainhandItem();
		if (item != null)
		{
			if (item.getID() == "weapon.short_bow" || item.getID() == "weapon.wonky_bow")
			{
				_properties.DamageRegularMin += 6;
				_properties.DamageRegularMax += 16;
			}
			else if (item.getID() == "weapon.goblin_bow")
			{
				_properties.DamageRegularMin += 3 + 3 * dc;
				_properties.DamageRegularMax += 8 + 8 * dc;
			}			
			else if (item.isWeaponType(this.Const.Items.WeaponType.Bow))
			{
				_properties.DamageRegularMin += 6 * dc;
				_properties.DamageRegularMax += 16 * dc;
			}
		}
	}
});	