::mods_hookExactClass("skills/traits/intensive_training_trait", function(o) {
	
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		this.m.Type = this.m.Type | this.Const.SkillType.Background;
	}

	local ws_getTooltip = o.getTooltip;
	o.getTooltip = function()
	{
		local tooltip = ws_getTooltip();

		if (this.m.HitpointsAdded > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.HitpointsAdded + "[/color] Hitpoints"
			});
		}
		if (this.m.StaminaAdded > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.StaminaAdded + "[/color] Fatigue"
			});
		}
		if (this.m.BraveAdded > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.BraveAdded + "[/color] Resolve"
			});
		}
		if (this.m.IniAdded > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.IniAdded + "[/color] Initiative"
			});
		}
		if (this.m.MatkAdded > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MatkAdded + "[/color] Melee Skill"
			});
		}
		if (this.m.RatkAdded > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.RatkAdded + "[/color] Ranged Skill"
			});
		}
		if (this.m.MdefAdded > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MdefAdded + "[/color] Melee Defense"
			});
		}	
		if (this.m.RdefAdded > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.RdefAdded + "[/color] Ranged Defense"
			});
		}		

		return tooltip;
	}

	o.addRandomSkills = function( _bro, _skillsNum )
	{
		for( local i = 0; i < _skillsNum; i++ )
		{
			if (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
			{
				if(this.m.HitpointsAdded < 2)
				{
					_bro.getBaseProperties().Hitpoints += 1;
					this.addHitpoint();
					break;					
				}
				else if (this.m.StaminaAdded < 2)
				{
					_bro.getBaseProperties().Stamina += 1;
					this.addStamina();
					break;					
				}				
				else if (this.m.BraveAdded < 2)
				{
					_bro.getBaseProperties().Bravery += 1;
					this.addBrave();
					break;					
				}				
				else if (this.m.IniAdded < 2)
				{
					_bro.getBaseProperties().Initiative += 1;
					this.addIni();
					break;					
				}				
				else if (this.m.RdefAdded < 2)
				{
					_bro.getBaseProperties().RangedDefense += 1;
					this.addRdef();
					break;					
				}				
				else if (this.m.MdefAdded < 2)
				{
					_bro.getBaseProperties().MeleeDefense += 1;
					this.addMdef();
					break;					
				}				
				else if (this.m.MatkAdded < 3 && (_bro.getBaseProperties().MeleeSkill > _bro.getBaseProperties().RangedSkill))
				{
					_bro.getBaseProperties().MeleeSkill += 1;
					this.addMatk();	
					break;						
				}				
				else if (this.m.RatkAdded < 3)	
				{
					_bro.getBaseProperties().RangedSkill += 1;
					this.addRatk();
					break;						
				}				
			}
			else
			{
				local attr = this.Math.rand(0, this.Const.Attributes.COUNT - 1);			
				switch(attr)
				{
					case 0:
						_bro.getBaseProperties().Hitpoints += 1;
						this.addHitpoint();
						break;

					case 1:
						_bro.getBaseProperties().Bravery += 1;
						this.addBrave();
						break;

					case 2:
						_bro.getBaseProperties().Stamina += 1;
						this.addStamina();
						break;

					case 3:
						_bro.getBaseProperties().Initiative += 1;
						this.addIni();
						break;

					case 4:
						if (_bro.getBaseProperties().MeleeSkill > _bro.getBaseProperties().RangedSkill)
						{
							_bro.getBaseProperties().MeleeSkill += 1;
							this.addMatk();
						}
						else
						{
							_bro.getBaseProperties().RangedSkill += 1;
							this.addRatk();
						}

						break;

					case 5:
						_bro.getBaseProperties().MeleeDefense += 1;
						this.addMdef();
						break;

					default:
						_bro.getBaseProperties().RangedDefense += 1;
						this.addRdef();
						break;
				}
			}
		}

		_bro.getSkills().update();
	}

})