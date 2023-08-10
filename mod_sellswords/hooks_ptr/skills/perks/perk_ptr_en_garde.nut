::mods_hookExactClass("skills/perks/perk_ptr_en_garde", function ( o )
{
	o.onTurnEnd = function()
	{
		if (!this.m.IsOn)
		{
			return;
		}

		local actor = this.getContainer().getActor();
		if (!actor.isPlacedOnMap() || !actor.hasZoneOfControl() || ::Tactical.State.isAutoRetreat())
		{
			return;
		}

		if (this.getContainer().getSkillByID("effects.riposte"))
		{
			this.getContainer().add(this.new("scripts/skills/effects/return_favor_effect"))
			if (actor.getTile().IsVisibleForPlayer)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, actor.getPos());
			}		
		}
	}

	o.onTurnStart = function() {}

	o.onUpdate = function (_properties) {}
});	