this.perk_crScintillating <- this.inherit("scripts/skills/skill", {
	m = {
		IsApplied = false,		
	},
	function create()
	{
		this.m.ID = "perk.crScintillating";
		this.m.Name = this.Const.Strings.PerkName.crScintillating;
		this.m.Description = this.Const.Strings.PerkDescription.crScintillating;
		this.m.Icon = "ui/perks/crScintillating.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}
	
	function onAdded()
	{
		if (this.m.IsApplied || !this.getContainer().getActor().isPlayerControlled())
		{
			return;
		}
		
		local actor = this.getContainer().getActor();
		local bg = actor.getBackground();	

		if (bg.m.CustomPerkTreeMap == null)
		{
			actor.m.PerkPoints += 1;
			local b = actor.getBaseProperties();
			local r;
			r = this.Math.rand(1, 4);			
			b.MeleeSkill -= r;
			r = this.Math.rand(1, 4);					
			b.MeleeDefense -= r;
			r = this.Math.rand(1, 5);					
			b.RangedSkill -= r;
			r = this.Math.rand(1, 5);					
			b.RangedDefense -= r;
			r = this.Math.rand(1, 5);					
			b.Hitpoints -= r;
			r = this.Math.rand(1, 5);					
			b.Stamina -= r;
			r = this.Math.rand(1, 6);					
			b.Initiative -= r;
			r = this.Math.rand(1, 5);					
			b.Bravery -= r;	
			bg.removePerk(this.Const.Perks.PerkDefs.crScintillating);	
			actor.resetPerks();				
			return;
		}
		
		local getExclude = function( _treeList )
		{
			local exclude = [];
			foreach (tree in _treeList)
			{
				foreach (category in bg.m.CustomPerkTreeMap)
				{
					foreach (treeInMap in category)
					{
						if (treeInMap.ID == tree.ID)
						{
							exclude.push(tree.ID);
						}
					}
				}
			}

			return exclude;
		}
		
		local modL = function( _a, _b)
		{
			while (_a >= _b)
			{
				_a -= _b;
			}
			return _a;
		}

		local random1 = 0;
		local random2 = 0;	
		//local random = this.getContainer().getSkillByID("perk.student");
		//if (random != null)
		//{
		//	random1 = random.m.Random1;
		//	random2 = random.m.Random2;			
		//}	
		local b = actor.getBaseProperties();
		random1 = b.MeleeSkill + 2 * b.MeleeDefense + 3 * b.Hitpoints;
		random2 = b.RangedSkill + 2 * b.RangedDefense + 3 * b.Stamina;
		
		local getRandomTree = function( _treeList, _exclude, _randomnumber)
		{
			local L = [];
			foreach (tree in _treeList)
			{
				if (_exclude.find(tree.ID) == null)
				{
					L.push(tree);
				}
			}
			//return L.len() > 0 ? L[this.Math.rand(0, L.len()-1)] : null;
			return L.len() > 0 ? L[modL(_randomnumber, L.len())] : null;			
		}					

		local traitsExclude = getExclude(this.Const.Perks.TraitsTrees.Tree);			
		traitsExclude.push(this.Const.Perks.TalentedTree.ID);
		local traitTree = getRandomTree(this.Const.Perks.TraitsTrees.Tree, traitsExclude, random1);
		if (traitTree != null)
		{
			bg.addPerkGroup(traitTree.Tree);
		}		

		local weaponExclude = getExclude(this.Const.Perks.WeaponTrees.Tree);	
		local weaponTree = getRandomTree(this.Const.Perks.WeaponTrees.Tree, weaponExclude, random2);
		if (weaponTree != null)
		{
			bg.addPerkGroup(weaponTree.Tree);
		}
		
		bg.removePerk(this.Const.Perks.PerkDefs.crScintillating);		
		this.m.IsApplied = true;			
		actor.resetPerks();			
	}
		
	function onSerialize(_out)
	{
		this.skill.onSerialize(_out);
	}
	
	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);
		this.m.IsApplied = true;		
	}
});

