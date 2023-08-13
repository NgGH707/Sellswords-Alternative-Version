::mods_hookExactClass("skills/perks/perk_legend_specialist_shortbow_skill", function ( o )
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
				_properties.RangedSkill += 12;
				_properties.DamageDirectMult *= 1.25;
			}
			else if (item.getID() == "weapon.goblin_bow")
			{
				_properties.RangedSkill += 8 * dc + 4;
				_properties.DamageDirectMult *= 1.16;
			}			
			else if (item.isWeaponType(this.Const.Items.WeaponType.Bow))
			{
				_properties.RangedSkill += 12 * dc;
				_properties.DamageDirectMult *= 1.08;
			}
		}
	}
});	