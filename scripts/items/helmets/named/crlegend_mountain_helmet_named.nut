this.crlegend_mountain_helmet_named <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.crlegend_mountain_helmet_named";
		local NameList = [
			"Mountain\'s Head",
			"Mountain Peak",
			"Peak\'s Dome",
			"Crest\'s Ward",
			"Boulder Helmet",
			"Mountain Mask"
		];
		//this.m.Name = "Helmet of the Mountain";		
		this.m.Name = NameList[this.Math.rand(0, NameList.len() - 1)]		
		this.m.Description = "A helmet crafted from the skin and skull of a mighty rock unhold, the beast may be dead, but it continues to mend itself even after death";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.HideCharacterHead = true;
		this.m.HideCorpseHead = true;
		this.m.IsIndestructible = false;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 15000;
		this.m.Condition = 300.0;
		this.m.ConditionMax = 300.0;
		this.m.StaminaModifier = -24;
		this.m.Vision = -3;		
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Legendary;
		this.randomizeValues();
		this.blockUpgrades();
		this.m.Blocked[this.Const.Items.HelmetUpgrades.ExtraVanity] = false;
		this.m.Blocked[this.Const.Items.HelmetUpgrades.Rune] = false;		
	}
	
	function updateVariant()
	{
		this.m.Sprite = "bust_helmet_513";
		this.m.SpriteDamaged = "bust_helmet_513_damaged";
		this.m.SpriteCorpse = "bust_helmet_513_dead";
		//this.m.IconLarge = "helmets/icon_bust_helmet_513.png";
		this.m.Icon = "helmets/inventory_helmet_513.png";
		this.m.IconLarge = this.m.Icon;		
	}	

	function getTooltip()
	{
		local result = this.helmet.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "Repairs [color=" + this.Const.UI.Color.PositiveValue + "]15%[/color] of its armor each turn"
		});
		return result;
	}
	
	function onArmorTooltip( _result )
	{
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/health.png",
			text = "Repairs [color=" + this.Const.UI.Color.PositiveValue + "]15%[/color] of its armor each turn"
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
		local helm = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		local helmMissing = helm.getArmorMax() - helm.getArmor();
		local helmAdded = this.Math.min(helmMissing, this.Math.floor(helm.getArmorMax() * 0.15));

		if (helmAdded <= 0)
		{
			return;
		}

		helm.setArmor(helm.getArmor() + helmAdded);
		actor.setDirty(true);

		if (!actor.isHiddenToPlayer())
		{
			this.Tactical.spawnIconEffect("status_effect_79", actor.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
			this.Sound.play("sounds/enemies/unhold_regenerate_02.wav", this.Const.Sound.Volume.RacialEffect * 1.25, actor.getPos());
			this.Tactical.EventLog.log(this.Const.UI.getColorized(this.m.Name, "#1e468f") + " heals for " + helmAdded + " points");
		}
	}
	
	function randomizeValues()
	{
		this.m.StaminaModifier = this.Math.rand(28, 31) * -1;
		this.m.Condition = this.Math.rand(480, 550);
		this.m.ConditionMax = this.m.Condition;
	}

	function onDeserialize( _in )
	{
		if (::Legends.Mod.Serialization.isSavedVersionAtLeast("16.0.3", _in.getMetaData()))
		{
			this.legend_helmet.onDeserialize(_in);
		}
		else
		{
			this.helmet.onDeserialize(_in);
		}
	}	

});

