this.crlegend_armor_mountain_named <- this.inherit("scripts/items/legend_armor/legend_named_armor", {
	m = {},
	function create()
	{
		this.legend_named_armor.create();
		this.m.ID = "armor.body.crlegend_mountain_armor_named";
		local NameList = [
			"Titan Coat",
			"Mountain Hide",
			"Giant\'s Coat",
			"Earthquake Harness",
			"Landslide Coat",
			"Boulder Plates",
			"Coat of the Mountain"
		];
		this.m.Name = NameList[this.Math.rand(0, NameList.len() - 1)]		
		this.m.Description = "Armor crafted from the skin and bones of a mighty rock unhold, the beast may be dead, but it continues to mend itself even after death.";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.IsIndestructible = true;
		this.m.Variant = 516;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 15000;
		this.m.Condition = 320;
		this.m.ConditionMax = 320;
		this.m.StaminaModifier = -42;
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Legendary;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.legend_named_armor.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "Repairs [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of its armor each turn"
		});
		return result;
	}
	
	function onArmorTooltip( _result )
	{
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "Repairs [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] of its armor each turn"
		});
	}	

	function onCombatFinished()
	{
		this.m.Condition = this.m.ConditionMax;
		this.updateAppearance();
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		local body = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local bodyMissing = body.getArmorMax() - body.getArmor();
		local bodyAdded = this.Math.min(bodyMissing, this.Math.floor(body.getArmorMax() * 0.1));

		if (bodyAdded <= 0)
		{
			return;
		}

		body.setArmor(body.getArmor() + bodyAdded);
		actor.setDirty(true);

		if (!actor.isHiddenToPlayer())
		{
			this.Tactical.spawnIconEffect("status_effect_79", actor.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
			this.Sound.play("sounds/enemies/unhold_regenerate_01.wav", this.Const.Sound.Volume.RacialEffect * 1.25, actor.getPos());
			this.Tactical.EventLog.log(this.Const.UI.getColorized(this.m.Name, "#1e468f") + " heals for " + bodyAdded + " points");
		}
	}
	
	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(42, 44) * -1;
		this.m.Condition = this.Math.rand(345, 365);
		this.m.ConditionMax = this.m.Condition;
	}	

});

