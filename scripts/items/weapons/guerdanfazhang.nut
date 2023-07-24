this.guerdanfazhang <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.guerdanfazhang";
		this.m.Name = "Bone stick";
		this.m.Description = "A strange bone stick.";
		//this.m.IconLarge = "weapons/melee/guerdanfazhuang.png";
		//this.m.Icon = "weapons/melee/guerdanfazhuang_70.png";
		this.m.IconLarge = "weapons/melee/legend_staff_02.png";
		this.m.Icon = "weapons/melee/legend_staff_02_70x70.png";		
		this.m.WeaponType = this.Const.Items.WeaponType.Staff;		
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;		
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = true;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "guerdanfazhang";
		this.m.Value = 3200;
		this.m.ShieldDamage = 80;
		this.m.Condition = 60.0;
		this.m.ConditionMax = 60.0;
		this.m.StaminaModifier = -16;
		this.m.RangeMin = 1;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;		
		this.m.RegularDamage = 45;
		this.m.RegularDamageMax = 60;
		this.m.ArmorDamageMult = 0.6;
		this.m.DirectDamageMult = 0.95;	
		this.m.IsDroppedAsLoot = false;		
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/legend_staff_bash"));
		this.addSkill(this.new("scripts/skills/actives/legend_staff_knock_out"));
		local skill = this.new("scripts/skills/actives/split_shield");
		skill.setFatigueCost(skill.getFatigueCostRaw() + 5);
		this.addSkill(skill);		
	}
});

