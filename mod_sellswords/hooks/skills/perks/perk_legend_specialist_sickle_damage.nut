::mods_hookExactClass("skills/perks/perk_legend_specialist_sickle_damage", function ( o )
{
	o.onUpdate = function ( _properties )
	{
		local dc = this.World.getTime().Days;
		dc = this.Math.floor(dc/25);
		dc = 0.01 * this.Math.min(5 * dc + 35, 100);	
		local item = this.getContainer().getActor().getMainhandItem();
		if (item != null)
		{
			if (item.getID() == "weapon.sickle" || item.getID() == "weapon.legend_named_sickle")
			{
				_properties.DamageRegularMin += 6;
				_properties.DamageRegularMax += 16;
			}
			if (item.getID() == "weapon.goblin_notched_blade")
			{
				_properties.DamageRegularMin += 4 + 2 * dc;
				_properties.DamageRegularMax += 10 + 6 * dc;
			}			
			else if (item.isWeaponType(this.Const.Items.WeaponType.Sword))
			{
				_properties.DamageRegularMin += 6 * dc;
				_properties.DamageRegularMax += 16 * dc;
			}
		}
	}
});	