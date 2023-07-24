::mods_hookExactClass("skills/actives/ptr_swordmaster_versatile_swordsman_stance_reverse_grip_skill", function(o) {
	
	o.toggleOn = function()
	{
		this.ptr_swordmaster_versatile_swordsman_stance_abstract.toggleOn();
		local weapon = this.getContainer().getActor().getMainhandItem();
		local skills = weapon.getSkills();
		foreach (skill in skills)
		{
			if (!skill.getID().find("ptr_swordmaster_versatile") )		
			{
				this.m.RemovedSkills.push(skill);
				weapon.removeSkill(skill);
			}
		}

		if (weapon.isItemType(::Const.Items.ItemType.TwoHanded))
		{
			weapon.addSkill(this.new("scripts/skills/actives/cudgel_skill"));
			weapon.addSkill(this.new("scripts/skills/actives/strike_down_skill"));
		}
		else
		{
			weapon.addSkill(this.new("scripts/skills/actives/bash"));
			weapon.addSkill(this.new("scripts/skills/actives/knock_out"));
		}
	}

})