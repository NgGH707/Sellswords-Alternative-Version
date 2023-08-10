::mods_hookExactClass("skills/actives/legend_bandage", function(o) {
	o.m.Cost <- 0;
	o.m.Meds <- 0;

	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		this.m.Description = "Save yourself or another character from bleeding to death by applying pressure and provisional bandaging to any such wound. Does not heal hitpoints unless you have the perk Field Triage. Neither the character using this skill nor the patient may be engaged in melee, unless the character using this skill has Bandage Mastery.";
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 10;
	}

	local ws_getTooltip = o.getTooltip;
	o.getTooltip = function()
	{
		local ret = ws_getTooltip();

		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/asset_medicine.png",
			text = "You have [color=" + ::Const.UI.Color.PositiveValue + "]" + ::World.Assets.getMedicine() + "[/color] medicine."
		})

		return ret;
	}

	o.onUse = function( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		this.spawnIcon("perk_55", _targetTile);
		
		// remove bleeding
		target.getSkills().removeAllByID("effects.bleeding");		
					
		local skill = target.getSkills().getSkillByID("injury.cut_artery");

		if (skill != null && skill.isFresh())
		{
			target.getSkills().remove(skill);
		}

		skill = target.getSkills().getSkillByID("injury.cut_throat");

		if (skill != null && skill.isFresh())
		{
			target.getSkills().remove(skill);
		}

		skill = target.getSkills().getSkillByID("injury.grazed_neck");

		if (skill != null && skill.isFresh())
		{
			target.getSkills().remove(skill);
		}

		if (this.m.Item != null && !this.m.Item.isNull())
		{
			this.m.Item.removeSelf();
		}
		
		if (_user.getSkills().hasSkill("perk.legend_field_triage"))
		{
			local meds = this.World.Assets.getMedicine();
			local target = _targetTile.getEntity();
			local maxHeal = 40;

			if (meds < 10)
			{
				maxHeal = meds * 2;
			}

			local neededHeal = target.getHitpointsMax() - target.getHitpoints();
			local finalHeal = maxHeal;

			if (neededHeal < maxHeal)
			{
				local finalHeal = neededHeal;
			}

			local finalMeds = finalHeal / 2;
			local cost = this.Math.min(meds, finalMeds);
			this.World.Assets.addMedicine(cost * -1);
			target.setHitpoints(this.Math.min(target.getHitpointsMax(), target.getHitpoints() + finalHeal));
		}
		return true;
	}

})