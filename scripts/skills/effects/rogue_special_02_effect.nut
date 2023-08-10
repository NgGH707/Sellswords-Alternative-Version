this.rogue_special_02_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.rogue_special_02";
		this.m.Name = "Injury Resistence";
		this.m.Description = "Injury Resistence";
		this.m.Icon = "ui/perks/perk_01.png";
		this.m.IconMini = "perk_01_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsHidden = true;		
	}
	
	function onUpdate( _properties )
	{
		_properties.ThresholdToReceiveInjuryMult *= 1.33;
	}	
		
});

