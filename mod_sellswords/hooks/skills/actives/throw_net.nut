::mods_hookExactClass("skills/actives/throw_net", function(o) {
	
	o.onAfterUpdate = function( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInNets ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;

		if (_properties.IsSpecializedInNets)
		{
			this.m.MaxRange = 4;
		}
		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_net_repair"))
		{
			this.m.ActionPointCost = 3;		
		}
	}

	o.onUse = function( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		local targetEntity = _targetTile.getEntity();
		local r = this.Math.rand(1, 100);
		local crrd = target.getSkills().hasSkill("perk.crrangeddefense") ? this.Math.rand(1, 100) <= target.getBaseProperties().RangedDefense : false;		

		if (_user.getSkills().hasSkill("perk.legend_net_casting"))
		{
			r *= 0.5;
		}

		if (_user.getSkills().hasSkill("perk.legend_net_repair"))
		{
			r *= 0.75;
		}

		if (r > this.getHitchance(_targetTile.getEntity()))
		{
			target.onMissed(this.getContainer().getActor(), this);
			return false;
		}
		else if (!targetEntity.getCurrentProperties().IsImmuneToRoot && !crrd)
		{
			if (this.m.SoundOnHit.len() != 0)
			{
				this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, targetEntity.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " throws a net and hits " + this.Const.UI.getColorizedEntityName(targetEntity));
			_user.getItems().unequip(_user.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand));
			local neteffect = this.new("scripts/skills/effects/net_effect");
			if (this.m.IsReinforced)
			{			
				neteffect.setdebuff(54);
			}
			targetEntity.getSkills().add(neteffect);
			local breakFree = this.new("scripts/skills/actives/break_free_skill");
			breakFree.m.Icon = "skills/active_74.png";
			breakFree.m.IconDisabled = "skills/active_74_sw.png";
			breakFree.m.Overlay = "active_74";
			breakFree.m.SoundOnUse = this.m.SoundOnHitHitpoints;

			if (this.m.IsReinforced)
			{
				breakFree.setDecal("net_destroyed_02");
				breakFree.setChanceBonus(-15);
				local r = this.Math.rand(1, 2);

				if (r > 1)
				{
					this.World.Assets.getStash().add(this.new("scripts/items/tools/legend_broken_throwing_net"));
				}
				else
				{
					this.World.Assets.getStash().add(this.new("scripts/items/tools/reinforced_throwing_net"));
				}
			}
			else
			{
				breakFree.setDecal("net_destroyed");
				breakFree.setChanceBonus(0);
				local chance = this.Math.rand(1, 100);

				if (chance > 25)
				{
					this.World.Assets.getStash().add(this.new("scripts/items/tools/legend_broken_throwing_net"));
				}
			}

			targetEntity.getSkills().add(breakFree);
			local effect = this.Tactical.spawnSpriteEffect(this.m.IsReinforced ? "bust_net_02" : "bust_net", this.createColor("#ffffff"), _targetTile, 0, 10, 1.0, targetEntity.getSprite("status_rooted").Scale, 100, 100, 0);
			local flip = !targetEntity.isAlliedWithPlayer();
			effect.setHorizontalFlipping(flip);
			this.Time.scheduleEvent(this.TimeUnit.Real, 200, this.onNetSpawn.bindenv(this), {
				TargetEntity = targetEntity,
				IsReinforced = this.m.IsReinforced
			});
		}
		else
		{
			if (this.m.SoundOnMiss.len() != 0)
			{
				this.Sound.play(this.m.SoundOnMiss[this.Math.rand(0, this.m.SoundOnMiss.len() - 1)], this.Const.Sound.Volume.Skill, targetEntity.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " throws a net at an immune " + this.Const.UI.getColorizedEntityName(targetEntity) + ", the net falls to the ground ");
			_user.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand).drop();
			return false;
		}
	}

})