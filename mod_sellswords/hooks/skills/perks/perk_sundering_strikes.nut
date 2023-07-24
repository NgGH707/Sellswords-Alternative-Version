::mods_hookExactClass("skills/perks/perk_sundering_strikes", function ( o )
{
	local onUpdate = o.onUpdate;
	o.onUpdate = function ( _properties )
	{
	};
	o.onAnySkillUsed <- function ( _skill, _targetEntity, _properties )
	{
		local actor = this.getContainer().getActor();
		local weapon = actor.getMainhandItem();
		local bonus;
		//if (weapon != null && !_skill.isRanged() && weapon.isItemType(this.Const.Items.ItemType.TwoHanded))			
		if (weapon != null)			
		{
			if (weapon.isItemType(this.Const.Items.ItemType.TwoHanded))
			{
				bonus = _skill.b.ActionPointCost >= 6 ? 0.3 : 0.25;
			}
			else
			{
				bonus = _skill.b.ActionPointCost >= 6 ? 0.25 : 0.20;
			}				
			_properties.DamageArmorMult += bonus;
		}
	};
});