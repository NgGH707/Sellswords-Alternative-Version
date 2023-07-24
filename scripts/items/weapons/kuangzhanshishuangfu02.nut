this.kuangzhanshishuangfu02 <- this.inherit("scripts/items/weapons/weapon", {
	m = {
	LastSkillUse = 0
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.kuangzhanshishuangfu02";
		this.m.Name = "Screaming Reaper";
		this.m.Description = "Berserker's unique way of fighting, maybe holding axes with both hands is a good choice.";
		this.m.Categories = "Axe, Two-Handed";
		this.m.IconLarge = "weapons/melee/kuangzhanshishuangfu02.png";
		this.m.Icon = "weapons/melee/kuangzhanshishuangfu02_70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = true;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "yemanrenshuangfu2";
		this.m.Value = 1800;
		this.m.ShieldDamage = 28;
		this.m.Condition = 80.0;
		this.m.ConditionMax = 80.0;
		this.m.StaminaModifier = -24;
		this.m.RegularDamage = 55;
		this.m.RegularDamageMax = 75;
		this.m.ArmorDamageMult = 1.3;
		this.m.DirectDamageMult = 0.4;
		this.m.ChanceToHitHead = 0;
		this.m.FatigueOnSkillUse = 3;		
	}

	function onEquip()
	{
		this.weapon.onEquip();
		//this.addSkill(this.new("scripts/skills/actives/pseudohack"));
		this.addSkill(this.new("scripts/skills/actives/kuangzhanshishuangfu01_01"));		
		this.addSkill(this.new("scripts/skills/actives/kuangzhanshishuangfu01_02"));
		local skillToAdd = this.new("scripts/skills/actives/split_shield");
		skillToAdd.setApplyAxeMastery(true);
		skillToAdd.setFatigueCost(skillToAdd.getFatigueCostRaw() + 3);
		this.addSkill(skillToAdd);
	}
  
    function onDamageDealt( _target, _skill, _hitInfo )
	{
		local actor = this.getContainer().getActor();

		if (actor == null || actor.isNull() || this.m.LastSkillUse == this.Const.SkillCounter)
		{
			return;
		}

		if (actor.isPlayerControlled() && _skill.getDirectDamage() < 1.0 && !_skill.isRanged() && this.m.ConditionMax > 1)
		{
			this.m.LastSkillUse = this.Const.SkillCounter;

			if (_target.getArmorMax(_hitInfo.BodyPart) >= 50 && _hitInfo.DamageInflictedArmor >= 5 || this.m.ConditionMax == 2)
			{
				this.lowerCondition();
			}
		}
	}
  
});

