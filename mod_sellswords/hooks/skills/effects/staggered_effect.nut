::mods_hookExactClass("skills/effects/staggered_effect", function ( o )
{
	o.onAdded = function ()
	{
		local actor = this.getContainer().getActor();
		local statusResisted = actor.getCurrentProperties().IsResistantToAnyStatuses ? this.Math.rand(1, 100) <= 50 : false;
		statusResisted = statusResisted || actor.getCurrentProperties().IsResistantToPhysicalStatuses ? this.Math.rand(1, 100) <= 33 : false;
		local crrd = this.getContainer().hasSkill("perk.crrangeddefense") ? this.Math.rand(1, 100) <= actor.getBaseProperties().RangedDefense : false;
		local crini = this.getContainer().hasSkill("perk.crinitiative");

		if (statusResisted || crrd || crini)
		{
			if (!actor.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " shook off being staggered thanks to his unnatural physiology");
			}

			this.removeSelf();
		}
		else
		{
			this.m.TurnsLeft = this.Math.max(1, 2 + actor.getCurrentProperties().NegativeStatusEffectDuration);
			this.Tactical.TurnSequenceBar.pushEntityBack(actor.getID());
		}
	};
	o.onUpdate = function ( _properties )
	{
		if (this.getContainer().hasSkill("perk.crresilient"))
		{
			_properties.InitiativeMult *= 0.63;
		}
		else
		{
			_properties.InitiativeMult *= 0.5;
		}		
	}		
});