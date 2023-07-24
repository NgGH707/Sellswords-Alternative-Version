::mods_hookExactClass("skills/perks/perk_legend_specialist_hammer_skill", function ( o )
{
	o.onUpdate = function ( _properties )
	{
		local dc = this.World.getTime().Days;
		dc = this.Math.floor(dc/25);
		dc = 0.01 * this.Math.min(5 * dc + 35, 100);	
		local item = this.getContainer().getActor().getMainhandItem();
		if (item != null)
		{
			if (item.getID() == "weapon.legend_hammer" || item.getID() == "weapon.legend_named_blacksmith_hammer")
			{
				_properties.MeleeSkill += 12;
				_properties.DamageArmorMult += 0.4;
			}
			else if (item.isItemType(this.Const.Items.ItemType.OneHanded) && item.isWeaponType(this.Const.Items.WeaponType.Hammer))
			{
				_properties.MeleeSkill += (12 * dc);
				_properties.DamageArmorMult += 0.1;
			}
		}
	}
});	