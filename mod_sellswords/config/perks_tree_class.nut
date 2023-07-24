::Const.Perks.VeteranClassTree <- {
	ID = "VeteranClassTree",
	Descriptions = [
		"warfare",
		"battle fights",
		"dealing unreasonable demands"
	],
	Name = "Veteran",
	SelfWeightMultiplier = 0.33,
	Tree = [
		[],
		[::Const.Perks.PerkDefs.crAnchor],
		[],
		[],
		[::Const.Perks.PerkDefs.crBlocknormal],
		[],
		[]
	]
};

::Const.Perks.ClassTrees.Tree.push(::Const.Perks.VeteranClassTree);
	
