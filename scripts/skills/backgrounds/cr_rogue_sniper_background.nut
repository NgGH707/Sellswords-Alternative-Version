this.cr_rogue_sniper_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.cr_rogue_sniper";
		this.m.Name = "Operator";
		this.m.Icon = "ui/backgrounds/background_rogue_06.png";
		this.m.BackgroundDescription = "Strong in all areas and can offer a diverse range of support.";
		this.m.GoodEnding = "He departed the %companyname% and ventured west, sailing across the oceans to unseen lands. There\'s no telling where he is these days, but you\'ve little doubt that he\'ll be coming back with stories to tell.";
		this.m.BadEnding = "After leaving the %companyname%, %name% retired from beast slaying altogether and last you heard he fathered an albino daughter. Unfortunately, rumors spread quickly about the girl having supernatural powers and her mother was executed by fire. The father and child were never caught nor seen again.";
		this.m.HiringCost = 400;
		this.m.DailyCost = 35;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_nobles",
			"trait.paranoid",
			"trait.clubfooted",
			"trait.irrational",
			"trait.gluttonous",
			"trait.dumb",			
			"trait.clumsy",
			"trait.tiny",
			"trait.insecure",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.hesitant",
			"trait.fragile",			
			"trait.double_tongued",
			"trait.slack",
			"trait.asthmatic",
			"trait.brute",
			"trait.fat",
			"trait.pessimist",
			"trait.frail"
		];
		this.m.ExcludedTalents = [];
		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.Level = 1;
		this.m.BackgroundType = this.Const.BackgroundType.Combat;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Good;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Chivalrous;
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];			
		this.m.CustomPerkTree = [
			[],
			[],
			[],
			[],
			[],
			[],
			[]
		];

		local trees = [			
			this.Const.Perks.LightArmorTree,
			this.Const.Perks.MediumArmorTree,
			this.Const.Perks.BowTree,
			this.Const.Perks.SlingTree,
			this.Const.Perks.ThrowingTree,
			this.Const.Perks.CrossbowTree,				
		]

		if (::Is_PTR_Exist)
		{
			trees.extend([
				this.Const.Perks.OneHandedTree,
				this.Const.Perks.RangedTree,
			])
		}

		::Mod_Sellswords.HookHelper.addPerkTreesToCustomPerkTree(this.m.CustomPerkTree, trees);		
		
		local crwptrees = [
			this.Const.Perks.AxeTree,
			this.Const.Perks.CleaverTree,
			this.Const.Perks.FlailTree,
			this.Const.Perks.MaceTree,
			this.Const.Perks.SpearTree,	
			this.Const.Perks.DaggerTree,
			this.Const.Perks.DaggerTree,	
			this.Const.Perks.HammerTree,
			this.Const.Perks.PolearmTree,			
		];
		for (local i = 0; i < 1; ++i)
		{
			::Mod_Sellswords.HookHelper.addPerkTreesToCustomPerkTree(this.m.CustomPerkTree, [crwptrees.remove(this.Math.rand(0, crwptrees.len()-1))]);			
		}
		
		local crtttrees = [	
			this.Const.Perks.AgileTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.SturdyTree,			
			this.Const.Perks.ViciousTree,
			this.Const.Perks.CalmTree,	
			this.Const.Perks.OrganisedTree,				
			this.Const.Perks.LargeTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.TrainedTree	
		];

		if (::Is_PTR_Exist)
		{
			crtttrees.push(this.Const.Perks.UnstoppableTree);
		}

		for (local i = 0; i < 3; ++i)
		{
			::Mod_Sellswords.HookHelper.addPerkTreesToCustomPerkTree(this.m.CustomPerkTree, [crtttrees.remove(this.Math.rand(0, crtttrees.len()-1))]);			
		}	

		if (("Flags" in this.World) && this.World.Flags != null && this.World.Flags.get("RogueSpecialSkills_1") == true)
		{
			::Mod_Sellswords.HookHelper.addPerksToCustomPerkTree(5, this.m.CustomPerkTree, [
					this.Const.Perks.PerkDefs.LegendWindReader,
				]
			);			
		}

		if (("Flags" in this.World) && this.World.Flags != null && this.World.Flags.get("RogueSpecialSkills_2") == true)
		{
			::Mod_Sellswords.HookHelper.addPerksToCustomPerkTree(1, this.m.CustomPerkTree, [
					this.Const.Perks.PerkDefs.Bullseye,
				]
			);			
		}		
	}
	
	function setGender( _gender = -1 )
	{
		local r = _gender;

		if (_gender == -1)
		{
			r = this.Math.rand(0, 1);
		}

		if (_gender != 1)
		{
			return;
		}

		this.m.Name = "Operator";
		this.m.Faces = this.Const.Faces.PrettyFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.addBackgroundType(this.Const.BackgroundType.Female);
	}	

	function onBuildDescription()
	{
		return "{Strong in all areas and can offer a diverse range of support.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				0
			],
			Bravery = [
				10,
				0
			],
			Stamina = [
				10,
				0
			],
			MeleeSkill = [
				13,
				3
			],
			RangedSkill = [
				28,
				18
			],
			MeleeDefense = [
				5,
				0
			],
			RangedDefense = [
				15,
				10
			],
			Initiative = [
				5,
				-5
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/weapons/militia_spear"));		
		items.equip(this.Const.World.Common.pickArmor([
			[1, "cr_rogue_armor"]
		]))
	}
	
	function getTooltip()
	{
		if (("Flags" in this.World) && this.World.Flags != null)
		{	
			local ret = this.character_background.getTooltip();
			if (this.World.Flags.get("RogueSpecialBuff_1") == true)
			{
				ret.push({
					id = 12,
					type = "text",
					icon = "ui/icons/special.png",	
					text = "has resistance to bleeding."
				});
			}
			if (this.World.Flags.get("RogueSpecialBuff_2") == true)
			{
				ret.push({
					id = 12,
					type = "text",
					icon = "ui/icons/special.png",	
					text = "has resistance to injury."
				});
			}
			if (this.World.Flags.get("RogueSpecialBuff_3") == true)
			{
				ret.push({
					id = 12,
					type = "text",
					icon = "ui/icons/special.png",	
					text = "has resistance to ranged attacks."
				});
			}
			if (this.World.Flags.get("RogueSpecialSkills_2") == true)
			{
				ret.push({
					id = 12,
					type = "text",
					icon = "ui/icons/special.png",	
					text = "has learned 'Bullseye'."
				});
			}			
			return ret;
		}		
	}	
});

