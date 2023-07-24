this.cr_rogue_staff <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		StunChance = 30
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.cr_rogue_staff";
		this.m.Name = "Gnarly Staff";
		this.m.Description = "A gnarly staff carved from old and hard wood, adorned with bones and feathers. May be of interest to collectors.";
		this.m.Categories = "Staff, One-Handed";
		this.m.IconLarge = "weapons/melee/goblin_weapon_06.png";
		this.m.Icon = "weapons/melee/goblin_weapon_06_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_goblin_weapon_06";
		this.m.Value = 3000;
		this.m.Condition = 56.0;
		this.m.ConditionMax = 56.0;
		this.m.StaminaModifier = -4;
		this.m.RangeMin = 1;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;
		this.m.RegularDamage = 20;
		this.m.RegularDamageMax = 25;
		this.m.ArmorDamageMult = 0.3;
		this.m.DirectDamageMult = 0.95;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local s = this.new("scripts/skills/actives/legend_staff_bash");
		s.m.Icon = "skills/staff_bash_mystic.png";
		s.m.IconDisabled = "skills/staff_bash_mystic_bw.png";
		this.addSkill(s);
		local t = this.new("scripts/skills/actives/legend_staff_knock_out");
		t.m.Icon = "skills/staff_knock_out_mystic.png";
		t.m.IconDisabled = "skills/staff_knock_out_mystic_bw.png";
		this.addSkill(t);
		this.addSkill(this.new("scripts/skills/actives/legend_root_skill"));		
	}

});

