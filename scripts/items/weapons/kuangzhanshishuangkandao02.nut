this.kuangzhanshishuangkandao02 <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.kuangzhanshishuangkandao02";
		this.m.Name = "Double Blunt Cleavers";
		this.m.Description = "Berserker's unique way of fighting, maybe holding cleavers with both hands is a good choice.";
		this.m.Categories = "Cleaver, Two-Handed";
		this.m.IconLarge = "weapons/melee/kuangzhanshishuangkandao02.png";
		this.m.Icon = "weapons/melee/kuangzhanshishuangkandao02_70.png";		
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "yemanrenshuangkandao02";
		this.m.Value = 1200;
		this.m.ShieldDamage = 0;
		this.m.Condition = 80.0;
		this.m.ConditionMax = 80.0;
		this.m.StaminaModifier = -16;
		this.m.RegularDamage = 45;
		this.m.RegularDamageMax = 60;
		this.m.ArmorDamageMult = 0.9;
		this.m.DirectDamageMult = 0.25;
		this.m.DirectDamageAdd = 0.1;		
		this.m.ChanceToHitHead = 0;
		this.m.FatigueOnSkillUse = 3;			
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/kuangzhanshishuangkandao01_01"));
		this.addSkill(this.new("scripts/skills/actives/kuangzhanshishuangkandao01_02"));
		//this.addSkill(this.new("scripts/skills/actives/pseudomince"));		
	}


});

