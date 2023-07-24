this.perk_crGrandslam <- this.inherit("scripts/skills/skill", {
	m = {
		Target = null,
		SplashNum = 3,
	},
	function create()
	{
		this.m.ID = "perk.crGrandslam";
		this.m.Name = "Grand Slam";
		this.m.Description = this.Const.Strings.PerkDescription.crGrandslam;
		this.m.Icon = "ui/perks/crGrandslam.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAfterUpdate( _properties )
	{
		local bodyHealth = this.getContainer().getActor().getHitpoints();
		bodyHealth = this.Math.min(150, bodyHealth);
		//_properties.MeleeSkill -= (0.08 * bodyHealth);
		//_properties.RangedSkill -= (0.08 * bodyHealth);		
		_properties.MeleeDefense -= (0.08 * bodyHealth);
		//_properties.RangedDefense -= (0.08 * bodyHealth);		
		_properties.Initiative -= (0.08 * bodyHealth);		
		_properties.TargetAttractionMult *= 1.5;		
		
		local skills = this.getContainer().getAllSkillsOfType(this.Const.SkillType.Active);
		local weapon = this.getContainer().getActor().getMainhandItem();
		local throwing = (weapon != null && weapon.isWeaponType(this.Const.Items.WeaponType.Throwing)) ? true: false;		
		foreach (s in skills)
		{
			if (s.isAttack() && (!s.isRanged() || throwing))
			{
				s.m.ActionPointCost += 2;
				s.m.FatigueCost += this.Math.ceil(0.04 * bodyHealth);
			}
			//if (!s.isAttack())
			//{
			//	s.m.ActionPointCost += 1;
			//	s.m.FatigueCost += this.Math.ceil(0.04 * bodyHealth);
			//}			
		}
	}

	function onTargetKilled( _targetEntity, _skill )
	{			
		if (this.m.Target != null || !_skill.isAttack() || _skill.isAOE() || this.getContainer().getActor().m.IsPerformingAttackOfOpportunity)
		{
			this.m.Target = null;
			return;
		}

		this.m.SplashNum -= 1;		
		if (this.m.SplashNum < 0)
		{
			return;		
		}
		
		this.m.Target = null;

		local targetTile = _targetEntity.getTile();

		local targets = [];

		for (local i = 0; i < 6; i++)
		{
			if (targetTile.hasNextTile(i))
			{
				local nextTile = targetTile.getNextTile(i);
				if (nextTile.IsOccupiedByActor)
				{
					local entity = nextTile.getEntity();
					if (!entity.isAlliedWith(this.getContainer().getActor())) targets.push(entity);
				}
			}
		}

		this.m.Target = ::MSU.Array.rand(targets);			
	}
	
	function onBeforeTargetHit( _skill, _targetEntity, _hitInfo )
	{
		this.m.Target = null;
	}	
	
	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		//this.logInfo("onTargetHit: " + this.m.Target);		
		if (this.m.Target != null && this.m.Target.isAlive())
		{
			_skill.onUse(this.getContainer().getActor(), this.m.Target.getTile());
			this.m.Target = null;
		}		
	}

	function onBeforeAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
	{
		this.m.SplashNum = 3;
	}	

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (this.m.Target != null)
		{
			_properties.DamageTotalMult *= (0.3 + 0.1 * this.m.SplashNum);
		}
	}

	function onCombatStarted()
	{
		this.m.Target = null;
	}

	function onCombatFinished()
	{
		this.m.Target = null;
	}	
	
});
