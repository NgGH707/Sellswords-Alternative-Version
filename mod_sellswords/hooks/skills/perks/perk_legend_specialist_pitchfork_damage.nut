::mods_hookExactClass("skills/perks/perk_legend_specialist_pitchfork_damage", function ( o )
{
	o.onUpdate = function ( _properties )
	{
		local dc = this.World.getTime().Days;
		dc = this.Math.floor(dc/25);
		dc = 0.01 * this.Math.min(5 * dc + 35, 100);	
		local item = this.getContainer().getActor().getMainhandItem();
		if (item != null)
		{
			if (item.getID() == "weapon.pitchfork" || item.getID() == "weapon.legend_wooden_pitchfork"  || item.getID() == "weapon.legend_hoe"  || item.getID() == "weapon.legend_scythe"  || item.getID() == "weapon.wooden_flail")
			{
				_properties.DamageRegularMin += 6;
				_properties.DamageRegularMax += 16;
			}
			else if (item.getRangeMax() == 2 && item.isItemType(this.Const.Items.ItemType.TwoHanded) && item.isItemType(this.Const.Items.ItemType.MeleeWeapon))			
			{
				_properties.DamageRegularMin += (6 * dc);
				_properties.DamageRegularMax += (16 * dc);
			}
		}
	}
});	