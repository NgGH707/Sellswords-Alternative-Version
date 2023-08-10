::mods_hookExactClass("skills/perks/perk_legend_specialist_shovel_skill", function ( o )
{
	o.onUpdate = function ( _properties )
	{
		local dc = this.World.getTime().Days;
		dc = this.Math.floor(dc/7);
		dc = 0.01 * this.Math.min(5 * dc + 35, 100);	
		local item = this.getContainer().getActor().getMainhandItem();
		if (item != null)
		{
			if (item.getID() == "weapon.legend_shovel" || item.getID() == "weapon.legend_named_shovel")
			{
				_properties.MeleeSkill += 12;
			}
			else if (item.isWeaponType(this.Const.Items.WeaponType.Mace) && item.isItemType(this.Const.Items.ItemType.TwoHanded))
			{
				_properties.MeleeSkill += 12 * dc;
			}
		}
	}
});	