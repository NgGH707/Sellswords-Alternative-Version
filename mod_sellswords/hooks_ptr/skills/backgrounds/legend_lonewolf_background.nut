::mods_hookExactClass("skills/backgrounds/legend_lonewolf_background", function ( o )
{
	o.m.CustomPerkTree = ::Mod_Chirutiru.HookHelper.clearCustomPerkTree(o.m.CustomPerkTree);
	::Mod_Chirutiru.HookHelper.addPerkTreesToCustomPerkTree(o.m.CustomPerkTree, [
		this.Const.Perks.LargeTree,
		this.Const.Perks.ResilientTree,
		this.Const.Perks.SturdyTree,
		this.Const.Perks.UnstoppableTree,
		this.Const.Perks.ViciousTree,
		this.Const.Perks.HeavyArmorTree
	]);
	local trees = [
		this.Const.Perks.AxeTree,
		this.Const.Perks.CleaverTree,
		this.Const.Perks.FlailTree,
		this.Const.Perks.HammerTree,
		this.Const.Perks.MaceTree,
		this.Const.Perks.SpearTree,
		this.Const.Perks.SwordTree
	];

	for( local i = 0; i < 3; i = ++i )
	{
		::Mod_Chirutiru.HookHelper.addPerkTreesToCustomPerkTree(o.m.CustomPerkTree, [
			trees.remove(this.Math.rand(0, trees.len() - 1))
		]);
	}

	::Mod_Chirutiru.HookHelper.clearCustomPerkTree(1, o.m.CustomPerkTree, [
		this.Const.Perks.PerkDefs.Student,
		this.Const.Perks.PerkDefs.PTRProfessional,
		this.Const.Perks.PerkDefs.PTRMenacing,
		this.Const.Perks.PerkDefs.PTRPersonalArmor,			
	]);
	::Mod_Chirutiru.HookHelper.clearCustomPerkTree(2, o.m.CustomPerkTree, [
		this.Const.Perks.PerkDefs.FortifiedMind,
		this.Const.Perks.PerkDefs.PTRExudeConfidence,
		this.Const.Perks.PerkDefs.Rotation,
		this.Const.Perks.PerkDefs.STRCoverAlly,
		this.Const.Perks.PerkDefs.Gifted
	]);
	::Mod_Chirutiru.HookHelper.clearCustomPerkTree(3, o.m.CustomPerkTree, [
		this.Const.Perks.PerkDefs.PTRBully,
		this.Const.Perks.PerkDefs.PTRPatternRecognition,
		this.Const.Perks.PerkDefs.PTRFormidableApproach,
		this.Const.Perks.PerkDefs.crSignaturemove
	]);
	::Mod_Chirutiru.HookHelper.clearCustomPerkTree(4, o.m.CustomPerkTree, [
		this.Const.Perks.PerkDefs.Underdog,
		this.Const.Perks.PerkDefs.PTRWearsItWell,
		this.Const.Perks.PerkDefs.STRLineBreaker,
		this.Const.Perks.PerkDefs.crReachadvantage,
		this.Const.Perks.PerkDefs.PTRWeaponMaster			
	]);
	::Mod_Chirutiru.HookHelper.clearCustomPerkTree(5, o.m.CustomPerkTree, [
		this.Const.Perks.PerkDefs.DoubleStrike,
		this.Const.Perks.PerkDefs.crClarity			
	]);
	::Mod_Chirutiru.HookHelper.clearCustomPerkTree(6, o.m.CustomPerkTree, [
		this.Const.Perks.PerkDefs.PTRVigorousAssault,
		this.Const.Perks.PerkDefs.LegendMindOverBody,
		this.Const.Perks.PerkDefs.PTRSweepingStrikes
	]);
	::Mod_Chirutiru.HookHelper.clearCustomPerkTree(7, o.m.CustomPerkTree, [
		this.Const.Perks.PerkDefs.Rebound,
		this.Const.Perks.PerkDefs.PerfectFocus,
		this.Const.Perks.PerkDefs.PTRManOfSteel			
	]);
	local ptad = [
		this.Const.Perks.PerkDefs.crinitiative,
		this.Const.Perks.PerkDefs.crhitpoints,
		this.Const.Perks.PerkDefs.crstamina,
		this.Const.Perks.PerkDefs.crmeleedefense,
		this.Const.Perks.PerkDefs.crmeleeskill,
		this.Const.Perks.PerkDefs.crScintillating
	];
	ptad = ptad[this.Math.rand(0, ptad.len() - 1)];
	::Mod_Chirutiru.HookHelper.clearCustomPerkTree(7, o.m.CustomPerkTree, [
		ptad
	]);
});