::mods_hookExactClass("skills/perks/perk_legend_muscularity", function ( o )
{
	o.onAnySkillUsed <- function ( _skill, _targetEntity, _properties )
	{
		local item = _skill.getItem();

		if (item != null && item.isItemType(this.Const.Items.ItemType.Defensive) && !item.isItemType(this.Const.Items.ItemType.Weapon))
		{
			return;
		}

		if (!_skill.isRanged() || (item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Throwing)))			
		{
			local hp = this.getContainer().getActor().getHitpoints();

			if (this.getContainer().hasSkill("perk.crGrandslam"))
			{
				hp = hp * 3;
			}

			if (_skill.m.MaxRange > 1)
			{
				hp = hp * 0.6;
			}

			if (_skill.m.ActionPointCost <= 3 && item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Sword, true))
			{
				hp = hp * 0.8;
			}

			if (_skill.m.ActionPointCost <= 3 && item != null && item.isItemType(this.Const.Items.ItemType.Weapon) && item.isWeaponType(this.Const.Items.WeaponType.Sword))
			{
				if (!this.getContainer().hasSkill("perk.ptr_two_for_one"))
				{
					hp = hp * 0.8;
				}

				if (this.getContainer().hasSkill("perk.ptr_two_for_one") && _skill.m.ActionPointCost <= 2)
				{
					hp = hp * 0.8;
				}

				if (item.isWeaponType(this.Const.Items.WeaponType.Dagger))
				{
					hp = hp * 0.8;
				}
			}

			local bonus = _skill.m.ActionPointCost <= 5 ? this.Math.min(40, this.Math.floor(_skill.m.ActionPointCost * hp * 0.015)) : this.Math.min(60, this.Math.floor(_skill.m.ActionPointCost * hp * 0.02));
			local crmax = 50;
			local crmin = 40;
			local actor = this.getContainer().getActor();
			local mhand = actor.getMainhandItem();

			if (mhand != null)
			{
				crmax = mhand.m.RegularDamageMax;
				crmin = mhand.m.RegularDamage;
			}

			_properties.DamageRegularMin += this.Math.min(bonus, crmin);
			_properties.DamageRegularMax += this.Math.min(bonus, crmax);
		}
	};
});