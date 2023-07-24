this.cr_rogue_axe <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.cr_rogue_axe";
		this.m.Name = "Orc Warlord's Unhold Splitter";
		this.m.Description = "A huge and crudely built double headed battleaxe too heavy to be used effectively by the average human.";
		this.m.Categories = "Axe, Two-Handed";
		this.m.IconLarge = "weapons/melee/orc_axe_two_handed.png";
		this.m.Icon = "weapons/melee/orc_axe_two_handed_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAoE = true;
		this.m.IsAgainstShields = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_orc_weapon_01";
		this.m.Value = 3000;
		this.m.ShieldDamage = 42;
		this.m.Condition = 80.0;
		this.m.ConditionMax = 80.0;
		this.m.StaminaModifier = -34;
		this.m.RegularDamage = 115;
		this.m.RegularDamageMax = 135;
		this.m.ArmorDamageMult = 1.80;
		this.m.DirectDamageMult = 0.4;
		this.m.ChanceToHitHead = 0;
		this.m.FatigueOnSkillUse = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill;
		skill = this.new("scripts/skills/actives/split_man");
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/round_swing");
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/split_shield");
		skill.setApplyAxeMastery(true);
		skill.setFatigueCost(skill.getFatigueCostRaw() + 5);
		this.addSkill(skill);
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

