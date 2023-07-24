this.rogue_special_01_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.rogue_special_01";
		this.m.Name = "Bleeding Resistence";
		this.m.Description = "Bleeding Resistence";
		this.m.Icon = "ui/perks/perk_01.png";
		this.m.IconMini = "perk_01_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsHidden = true;		
	}
		
});

