::mods_hookExactClass("skills/actives/hand_to_hand", function ( o )
{
	o.getTooltip = function ()
	{
		local ret = this.getDefaultTooltip();
		local actor = this.getContainer().getActor();

		if (actor.getOffhandItem() != null)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Damage halved due to holding something in your off hand"
			});
		}

		//if (this.m.Backgrounds.find(actor.getBackground()) != null)
		foreach( bg in this.m.Backgrounds )
		{
			if (actor.getSkills().hasSkill(bg))
			{
				ret.push({
					id = 7,
					type = "text",
					icon = "ui/icons/regular_damage.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+15%[/color] Damage (from background)"
				});
				break;
			}
		}			
		return ret;
	}	
	o.onAnySkillUsed = function ( _skill, _targetEntity, _properties )
	{
		if (_skill != this)
		{
			return;
		}

		local actor = this.getContainer().getActor();
		_properties.DamageRegularMin += 5;
		_properties.DamageRegularMax += 10;
		_properties.DamageArmorMult = 0.5;

		if (this.m.Container.hasSkill("effects.disarmed"))
		{
			local mhand = actor.getMainhandItem();

			if (mhand != null)
			{
				_properties.DamageRegularMin -= mhand.m.RegularDamage;
				_properties.DamageRegularMax -= mhand.m.RegularDamageMax;
			}
		}

		foreach( bg in this.m.Backgrounds )
		{
			if (actor.getSkills().hasSkill(bg))
			{
				_properties.DamageTotalMult *= 1.15;
				break;
			}
		}			
	}		
});	