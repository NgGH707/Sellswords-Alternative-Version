this.perk_crmeleeskill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.crmeleeskill";
		this.m.Name = this.Const.Strings.PerkName.crmeleeskill;
		this.m.Description = this.Const.Strings.PerkDescription.crmeleeskill;
		this.m.Icon = "ui/perks/crmeleeskill.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

