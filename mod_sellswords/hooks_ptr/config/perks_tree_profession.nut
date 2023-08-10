// assassin tree
::Const.Perks.AssassinProfessionTree.Tree[6].push(::Const.Perks.PerkDefs.LegendUntouchable);

local find = ::Const.Perks.AssassinProfessionTree.Tree[6].find(::Const.Perks.PerkDefs.LegendAssassinate);
if (find != null) ::Const.Perks.AssassinProfessionTree.Tree[6].remove(find);

// add new profession trees
::Const.Perks.KnightProfessionTree <- {
	ID = "KnightProfessionTree",
	Descriptions = [
		"fights bravely and displays military professionalism and courtesy",
		"has the values of gentility, nobility and treats others reasonably",
		"protects the weak and defenseless for honor"
	],
	Name = "Chivalric Knight",
	PerkGroupMultipliers = [
	],
	Tree = [
		[::Const.Perks.PerkDefs.Colossus],
		[],
		[::Const.Perks.PerkDefs.crHonorheritage],
		[],
		[],
		[::Const.Perks.PerkDefs.PTRPersonalArmor],
		[::Const.Perks.PerkDefs.PTRUnstoppable]
	]
};

::Const.Perks.ProfessionTrees.Tree.push(::Const.Perks.KnightProfessionTree);