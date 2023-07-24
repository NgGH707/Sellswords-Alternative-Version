::mods_hookExactClass("skills/perks/perk_ptr_eyes_up", function ( o )
{
	o.isEnabled = function()
	{
		if (this.m.IsForceEnabled)
		{
			return true;
		}

		local actor = this.getContainer().getActor();
		if (!actor.isArmedWithRangedWeapon())
		{
			return false;
		}
		return true;
	}

	local ws_onBeforeAnySkillExecuted = o.onBeforeAnySkillExecuted;
	o.onBeforeAnySkillExecuted = function( _skill, _targetTile, _targetEntity, _forFree )
	{
		local d = this.getContainer().getActor().getTile().getDistanceTo(_targetTile);			
		if (d <= 4)
		{
			return;
		}

		ws_onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree );
	}

	o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		this.applyEffect(_skill);
	}

	o.onTargetMissed = function( _skill, _targetEntity )
	{
		this.applyEffect(_skill);
	}

	o.applyEffect = function(_skill)
	{
		if (this.m.TargetEntity == null) return;

		if (this.m.TargetEntity.isAlive() && !this.m.TargetEntity.isDying()) this.m.TargetEntity.getSkills().add(this.new("scripts/skills/effects/ptr_eyes_up_effect"));		
		//if (!_skill.isAOE() || _skill.getID() == "actives.legend_piercing_bolt")
		//{
		for (local i = 0; i < 6; i++)
		{
			if (this.m.TargetTile.hasNextTile(i))
			{
				local nextTile = this.m.TargetTile.getNextTile(i);
				if (nextTile.IsOccupiedByActor)
				{
					if (nextTile.getEntity().isAlliedWith(this.getContainer().getActor())) continue;

					local effect = ::new("scripts/skills/effects/ptr_eyes_up_effect");
					local previouslyAppliedEffect = nextTile.getEntity().getSkills().getSkillByID("effects.ptr_eyes_up");
					if (previouslyAppliedEffect != null)
					{
						previouslyAppliedEffect.m.Stacks -= 0.5;
					}
					else
					{
						effect.m.Stacks -= 0.5;
					}
					nextTile.getEntity().getSkills().add(effect);
				}
			}
		}
		//}

		this.m.TargetEntity = null;
		this.m.TargetTile = null;
	}
});	