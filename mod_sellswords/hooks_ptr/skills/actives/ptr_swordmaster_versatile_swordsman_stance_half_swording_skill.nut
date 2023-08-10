::mods_hookExactClass("skills/actives/ptr_swordmaster_versatile_swordsman_stance_half_swording_skill", function(o) {
	
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

		weapon.addSkill(this.new("scripts/skills/actives/puncture"));
	}

})