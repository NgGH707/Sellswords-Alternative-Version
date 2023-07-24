::mods_hookExactClass("events/events/dlc8/disowned_noble_welcomed_back_event", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		foreach (screen in this.m.Screens)
		{
			if (screen.ID != "C") continue;

			screen.start = function( _event )
			{
				this.Characters.push(_event.m.Disowned.getImagePath());
				//local background = this.new("scripts/skills/backgrounds/regent_in_absentia_background");
				
				local backgrounda = _event.m.Disowned.getBackground();	
				
				local getExclude = function( _treeList )
				{
					local exclude = [];
					foreach (tree in _treeList)
					{
						foreach (category in backgrounda.m.CustomPerkTreeMap)
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
								
				local getRandomTree = function( _treeList, _exclude )
				{
					local L = [];
					foreach (tree in _treeList)
					{
						if (_exclude.find(tree.ID) == null)
						{
							L.push(tree);
						}
					}

					return L.len() > 0 ? L[this.Math.rand(0, L.len()-1)] : null;
				}					

				local traitsExclude = getExclude(this.Const.Perks.TraitsTrees.Tree);			
				traitsExclude.push(this.Const.Perks.TalentedTree.ID);
				local traitTree = getRandomTree(this.Const.Perks.TraitsTrees.Tree, traitsExclude);
				if (traitTree != null)
				{
					backgrounda.addPerkGroup(traitTree.Tree);
				}	
				local sctors = false;
				if (_event.m.Disowned.getBackground().hasPerk(this.Const.Perks.PerkDefs.crScintillating))
				{
					sctors = true;
					_event.m.Disowned.getBackground().removePerk(this.Const.Perks.PerkDefs.crScintillating);
				}
				local addPerk = function ( _perk, _row = 0 )
				{
					local actor = _event.m.Disowned;
					local bg = backgrounda;	
					local hasRow = false;
					local direction = -1;
					local row = _row;
					while (row >= 0 && row <= 6)
					{
						if (bg.m.CustomPerkTree[row].len() < 13)
						{
							hasRow = true;
							break;
						}

						row += direction;

						if (row == -1)
						{
							row = _row;
							direction = 1;
						}
					}

					row = hasRow ? this.Math.max(0, this.Math.min(row, 6)) : _row;
					bg.addPerk(_perk, row);
				}				
				if (sctors)
				{				
					addPerk(this.Const.Perks.PerkDefs.PTRRisingStar, 6);
				}	
				addPerk(this.Const.Perks.PerkDefs.PTRExudeConfidence, 0);				
				addPerk(this.Const.Perks.PerkDefs.PTRFamilyPride, 2);					
				//local oldPerkTree = _event.m.Disowned.getBackground().m.CustomPerkTree;				
				//background.m.IsNew = false;
				//_event.m.Disowned.getSkills().removeByID("background.disowned_noble");
				//_event.m.Disowned.getSkills().add(background);
				//_event.m.Disowned.getBackground().rebuildPerkTree(oldPerkTree);	
				//local pT = this.Const.Perks.BuildCustomPerkTree(oldPerkTree);
				//_event.m.Disowned.getBackground().m.PerkTree = pT.Tree;
				//_event.m.Disowned.getBackground().m.PerkTreeMap = pT.Map;				
				_event.m.Disowned.resetPerks();								
				_event.m.Disowned.getSkills().add(this.new("scripts/skills/traits/crfake_absentregent_trait"));	
				_event.m.Disowned.getSkills().update();					
				//_event.m.Disowned.m.Background = background;
				_event.m.Disowned.getBackground().m.RawDescription = "%name% is now a Regent in Absentia.";
				_event.m.Disowned.getBackground().buildDescription(true);				

				local resolve_boost = this.Math.rand(10, 15);
				local initiative_boost = this.Math.rand(6, 10);
				local melee_defense_boost = this.Math.rand(2, 4);
				local ranged_defense_boost = this.Math.rand(3, 5);
				_event.m.Disowned.getBaseProperties().Bravery += resolve_boost;
				_event.m.Disowned.getBaseProperties().Initiative += initiative_boost;
				_event.m.Disowned.getBaseProperties().MeleeDefense += melee_defense_boost;
				_event.m.Disowned.getBaseProperties().RangedDefense += ranged_defense_boost;
				_event.m.Disowned.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/bravery.png",
					text = _event.m.Disowned.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + resolve_boost + "[/color] Resolve"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/initiative.png",
					text = _event.m.Disowned.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + initiative_boost + "[/color] Initiative"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.Disowned.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + melee_defense_boost + "[/color] Melee Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.Disowned.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + ranged_defense_boost + "[/color] Ranged Defense"
				});
			}
		}
	}

	local ws_onUpdateScore = o.onUpdateScore;
	o.onUpdateScore = function()
	{
		ws_onUpdateScore()

		if (this.m.Score != 0)
		{
			this.m.Score *= 1.5;
		}
	}
});	