::mods_hookExactClass("entity/tactical/enemies/legend_vampire_lord", function(o) {
	local onInit = o.onInit;
	o.onInit = function()
	{
		onInit();
		this.m.BaseProperties.IsAffectedByInjuries = true;	
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crTrumpcard"));

		if (::Is_PTR_Exist)
		{
			this.m.Skills.add(this.new("scripts/skills/effects/ptr_undead_injury_receiver_effect"));
		}

		if (("Assets" in this.World) && this.World.Assets != null && this.World.Assets.getEconomicDifficulty() == this.Const.Difficulty.Legendary)
		{
			local dc = this.World.getTime().Days;
			local dca = this.Math.floor(dc/50) + this.Math.floor(dc/100) + this.Math.floor(dc/150) + this.Math.floor(dc/200);
			dca = this.Math.min(dca, 8 + this.Math.floor(dc/100));				
			this.m.BaseProperties.MeleeSkill += dca;
			this.m.BaseProperties.MeleeDefense += 0.5 * dca;
			this.m.BaseProperties.RangedSkill += dca;	
			this.m.BaseProperties.RangedDefense += 0.5 * dca;				
			this.m.BaseProperties.Bravery += dca;
			this.m.BaseProperties.Hitpoints += 2 * dca;	
		}
		local rcr = this.new("scripts/skills/racial/cr_rogue_champion_racial");	
		rcr.m.weak = true;
		this.m.Skills.add(rcr);			
	}
});