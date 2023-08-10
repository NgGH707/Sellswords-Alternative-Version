::mods_hookExactClass("skills/perks/perk_legend_unarmed_training", function ( o )
{
	o.onAnySkillUsed = function ( _skill, _targetEntity, _properties )
	{
		local actor = this.getContainer().getActor();

		if (_skill.getID() == "actives.hand_to_hand" || _skill.getID() == "actives.legend_unarmed_lunge")
		{
			if (!_properties.IsSpecializedInFists)
			{
				_properties.DamageArmorMult *= 0.8;
			}	
			if (this.getContainer().hasSkill("perk.sundering_strikes"))
			{
				_properties.DamageArmorMult *= 1.5;					
			} 
			
			//local damage = this.Math.max(40, actor.getInitiative() + actor.getHitpoints() - 20) / 4;
			local damage = actor.getInitiative() / 3 + actor.getHitpoints() / 4;
			
			if (actor.getOffhandItem() != null)
			{
				damage = damage * 0.5;
			}
			
			if (actor.getMainhandItem() != null)
			{
				damage = damage * 0.2;
			}				

			if (this.getContainer().hasSkill("perk.crGrandslam"))
			{
				damage = damage * 1.5;
				_properties.DamageDirectMult = 1.5;					
			}

			_properties.DamageRegularMin += damage - 10 - (_skill.getID() == "actives.hand_to_hand" ? 5 : 10);
			_properties.DamageRegularMax += damage + 10 - (_skill.getID() == "actives.hand_to_hand" ? 10 : 20);
		}

		if (_skill.getID() == "actives.legend_choke")
		{
			_properties.DamageTotalMult *= 1.25;
			_properties.MeleeSkill += 10;
		}
	};
	o.onAfterUpdate = function ( _properties )
	{
		local handToHand = this.getContainer().getSkillByID("actives.hand_to_hand");

		if (handToHand != null && handToHand.m.ActionPointCost >= 1)
		{
			handToHand.m.ActionPointCost -= 1;
		}		
	
		local lunge = this.getContainer().getSkillByID("actives.legend_unarmed_lunge");

		if (lunge != null)
		{
			lunge.m.FatigueCostMult *= 0.5;
		}
	}		
});