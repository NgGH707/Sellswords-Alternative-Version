this.cr_rogue_mark_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.cr_rogue_mark";
		this.m.Name = "Mark";
		this.m.Icon = "ui/traits/aggressive_trait.png";
		this.m.Description = "=Reorganization=";
		this.m.Type = this.Const.SkillType.Special | this.Const.SkillType.Trait;
		this.m.IsHidden = true;
	}
	
});

