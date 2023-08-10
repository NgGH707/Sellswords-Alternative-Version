this.rogue_stollwurm_scales_upgrade <- this.inherit("scripts/items/legend_armor/legend_armor_cloak", {
	m = {
		TurnsLeft = 5	
	},
	function create()
	{
		this.legend_armor_cloak.create();
		this.m.ID = "legend_armor.body.rogue_stollwurm_scales";
		this.m.Type = this.Const.Items.ArmorUpgrades.Cloak;
		this.m.Name = "Stollwurm Scale Cloak";
		this.m.Description = "A cloak made out of the scales of a Stollwurm. Not only is it a rare and impressive trophy, it also offers additional protection";
		this.m.ArmorDescription = "A cloak made out of Stollwurm scales is worn over this armor for additional protection.";
		this.m.Icon = "armor_upgrades/upgrade_stollwurm.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor_upgrades/icon_upgrade_stollwurm.png";
		this.m.OverlayIconLarge = "armor_upgrades/inventory_upgrade_stollwurm.png";
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_stollwurm_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_stollwurm_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_stollwurm_back_dead";
		this.m.Value = 6000;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.ConditionModifier = 40;
		this.m.StaminaModifier = -2;
	}

	function getTooltip()
	{
		local result = this.legend_armor_upgrade.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Immune to daze and acid"
		});
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Immunity from Knockback and Grab for the first five turns of combat"
		});		
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Immune to daze and acid"
		});
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Immunity from Knockback and Grab for the first five turns of combat"
		});			
	}

	function onUpdateProperties( _properties )
	{
		this.legend_armor_upgrade.onUpdateProperties(_properties);
		_properties.IsImmuneToDaze = true;	
		if (this.m.TurnsLeft > 0)
		{
			_properties.IsImmuneToKnockBackAndGrab = true;
		}		
		//_properties.IsImmuneToStun = true;
		//_properties.IsImmuneToKnockBackAndGrab = true;
	}

	function onEquip()
	{
		this.legend_armor_upgrade.onEquip();
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getFlags().add("body_immune_to_acid");
		}
	}

	function onUnequip()
	{
		local c = this.m.Armor.getContainer();

		if (c != null && c.getActor() != null && !c.getActor().isNull())
		{
			c.getActor().getFlags().remove("body_immune_to_acid");
		}

		this.legend_armor_upgrade.onUnequip();
	}

	function onTurnEnd()
	{
		this.m.TurnsLeft -= 1;
	}

	function onCombatStarted()
	{
		this.m.TurnsLeft = 5;
	}	

});

