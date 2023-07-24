::mods_hookExactClass("skills/perks/perk_ptr_fresh_and_furious", function ( o )
{
	o.m.IsSpent = false;
	o.m.ValidChance <- 0;
	o.m.ChargeCount <- 0; 
	o.m.StartingTile <- null;
	o.m.oneap <- false;

	o.isHidden = function()
	{
		return this.skill.isHidden();
	}

	function isEnabled()
	{
		return true;
	}

	o.getTooltip = function()
	{
		local tooltip = this.skill.getTooltip();

		if (!this.m.IsSpent)
		{		
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "The next skill used has its Action Point cost [color=" + this.Const.UI.Color.PositiveValue + "]halved[/color] and Fatigue Cost reduced by [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]"
			});
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Will expire upon using a skill with non-zero Action Point or Fatigue cost[/color]"
			});
		}
		else
		{	
			tooltip.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]" + (3 - this.m.ChargeCount) + "[/color] more stacks needed to enable this skill."
			});		
		}		
		return tooltip;
	}

	o.onAfterUpdate = function( _properties )
	{
		if (!this.m.IsSpent)
		{	
			foreach (skill in this.getContainer().getAllSkillsOfType(::Const.SkillType.Active))
			{
				// ::Math.round to round up the subtraction because we want to emulate the behavior of _properties.IsSkillUseHalfCost
				// whereby it rounds down the cost (due to integer division) after halving it.
				this.m.oneap = skill.m.ActionPointCost == 1 ? true : false;
				skill.m.ActionPointCost -= ::Math.max(0, ::Math.min(skill.m.ActionPointCost - 1, ::Math.round(skill.m.ActionPointCost / 2.0)));
				skill.m.FatigueCostMult *= 0.75;
			}
			//this.m.IconMini = "ptr_fresh_and_furious_mini";
			this.m.Icon = "ui/perks/ptr_fresh_and_furious.png";			
		}		
		else
		{
			this.m.Icon = "ui/perks/pirouette_perk.png";			
		}		
	}

	o.onBeforeAnySkillExecuted = function( _skill, _targetTile, _targetEntity, _forFree )
	{
		this.m.IsUsingFreeSkill = _forFree || (_skill.getActionPointCost() == 0 && _skill.getFatigueCost() == 0) || this.m.oneap;
	}

	o.onTurnStart = function()
	{
		//this.m.ValidChance = 1;	
		if (this.m.IsSpent)
		{
			this.m.Icon = "ui/perks/pirouette_perk.png";
			this.m.ValidChance += 1;			
		}
		else
		{
			this.m.Icon = "ui/perks/ptr_fresh_and_furious.png";				
		}
		this.m.StartingTile = this.getContainer().getActor().getTile();			
	}
	
	o.onTurnEnd = function()
	{	
		local actor = this.getContainer().getActor();	
		local distanceMoved = this.m.StartingTile.getDistanceTo(actor.getTile());	
		if (this.m.ValidChance > 0)
		{
			local aptocharge = ::Math.round(this.getContainer().getActor().getActionPoints() / 2.0) + this.m.StartingTile.getDistanceTo(actor.getTile());	
			local fatiguelimit = ::Math.round(4 * (1 - this.getContainer().getActor().getFatigue() / this.getContainer().getActor().getFatigueMax()));
			this.m.ChargeCount += this.Math.min(3, this.Math.min(aptocharge, fatiguelimit));
		}
		if (this.m.ChargeCount >= 3 && this.m.IsSpent)
		{
			this.m.IsSpent = false;
			this.m.ChargeCount = 0;
			this.m.ValidChance = 0;				
		}
	}	

	o.onCombatStarted = function()
	{
		this.m.ValidChance = 0;	
		this.m.IsSpent = false;
		this.m.ChargeCount = 0;		
	}
	
	o.onCombatFinished = function()
	{
		this.skill.onCombatFinished();
		this.m.IsSpent = false;
		this.m.ValidChance = 0;	
		this.m.ChargeCount = 0;
	}
});	