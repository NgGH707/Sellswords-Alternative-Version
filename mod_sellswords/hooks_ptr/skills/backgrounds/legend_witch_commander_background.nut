::mods_hookExactClass("skills/backgrounds/legend_witch_commander_background", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create()

		::Mod_Chirutiru.HookHelper.addPerkTreesToCustomPerkTree(this.m.CustomPerkTree, [
			this.Const.Perks.TalentedTree,
			this.Const.Perks.StaffTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.DaggerTree,
			this.Const.Perks.TwoHandedTree
		]);
		::Mod_Chirutiru.HookHelper.clearCustomPerkTree(4, this.m.CustomPerkTree, [
			this.Const.Perks.PerkDefs.LegendFavouredEnemyAlps,
			this.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
			this.Const.Perks.PerkDefs.LegendFavouredEnemyVampire
		]);
		::Mod_Chirutiru.HookHelper.clearCustomPerkTree(7, this.m.CustomPerkTree, [
			this.Const.Perks.PerkDefs.PTRRisingStar
		]);
	}
	
});