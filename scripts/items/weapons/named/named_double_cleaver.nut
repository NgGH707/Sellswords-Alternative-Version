this.named_double_cleaver <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function create()
	{
		this.named_weapon.create();
		this.updateVariant();
		this.m.ID = "weapon.named_double_cleaver";
		this.m.Name = "Fury";
		this.m.Description = "Berserker's unique way of fighting, maybe holding cleavers with both hands is a good choice.";
		this.m.Categories = "Cleaver, Two-Handed";
		this.m.IconLarge = "weapons/melee/crdouboecleaver_01.png";
		this.m.Icon = "weapons/melee/crdouboecleaver_01_70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "crdoublecleaver_01";
		this.m.Value = 1600;
		this.m.ShieldDamage = 0;
		this.m.Condition = 92.0;
		this.m.ConditionMax = 92.0;
		this.m.StaminaModifier = -18;
		this.m.RegularDamage = 60;
		this.m.RegularDamageMax = 80;
		this.m.ArmorDamageMult = 1.1;
		this.m.DirectDamageAdd = 0.1;
		this.m.DirectDamageMult = 0.25;
		this.m.FatigueOnSkillUse = 3;			
		this.randomizeValues();
	}

	
	function onEquip()
	{
		this.named_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/kuangzhanshishuangkandao01_01"));		
		this.addSkill(this.new("scripts/skills/actives/kuangzhanshishuangkandao01_02"));
		//this.addSkill(this.new("scripts/skills/actives/pseudomince"));			
	}

});

