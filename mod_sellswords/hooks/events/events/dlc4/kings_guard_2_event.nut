::mods_hookExactClass("events/events/dlc4/kings_guard_2_event", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		foreach (screen in this.m.Screens)
		{
			if (screen.ID != "A") continue;

			screen.start = function( _event )
			{
				this.Characters.push(_event.m.Dude.getImagePath());
				//local bg = this.new("scripts/skills/backgrounds/kings_guard_background");
				local bga = _event.m.Dude.getBackground();	
				
				local getExclude = function( _treeList )
				{
					local exclude = [];
					foreach (tree in _treeList)
					{
						foreach (category in bga.m.CustomPerkTreeMap)
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
					bga.addPerkGroup(traitTree.Tree);
				}	
				local sctors = false;
				if (_event.m.Dude.getBackground().hasPerk(this.Const.Perks.PerkDefs.crScintillating))
				{
					sctors = true;
					_event.m.Dude.getBackground().removePerk(this.Const.Perks.PerkDefs.crScintillating);
				}
				local addPerk = function ( _perk, _row = 0 )
				{
					local actor = _event.m.Dude;
					local bg = bga;	
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
				addPerk(this.Const.Perks.PerkDefs.PTRPatternRecognition, 0);				
				addPerk(this.Const.Perks.PerkDefs.PTRProfessional, 3);					
				//local oldPerkTree = _event.m.Dude.getBackground().m.CustomPerkTree;				
				//bg.m.IsNew = false;
				//_event.m.Dude.getSkills().removeByID("background.cripple");
				//_event.m.Dude.getSkills().add(bg);
				//_event.m.Dude.getBackground().rebuildPerkTree(oldPerkTree);	
				//local pT = this.Const.Perks.BuildCustomPerkTree(oldPerkTree);
				//_event.m.Dude.getBackground().m.PerkTree = pT.Tree;
				//_event.m.Dude.getBackground().m.PerkTreeMap = pT.Map;				
				_event.m.Dude.resetPerks();	
				_event.m.Dude.getSkills().add(this.new("scripts/skills/traits/crfake_kingsguard_trait"));	
				_event.m.Dude.getSkills().update();					
				_event.m.Dude.getBackground().m.RawDescription = "You found %name% frozen half to death in the north. With your help, the former King\'s Guard regained strength and now fights for you.";
				_event.m.Dude.getBackground().buildDescription(true);
				_event.m.Dude.improveMood(1.0, "Is his former self again");

				if (_event.m.Dude.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Dude.getMoodState()],
						text = _event.m.Dude.getName() + this.Const.MoodStateEvent[_event.m.Dude.getMoodState()]
					});
				}

				_event.m.Dude.getBaseProperties().MeleeSkill += 12;
				_event.m.Dude.getBaseProperties().MeleeDefense += 7;
				_event.m.Dude.getBaseProperties().RangedDefense += 7;
				_event.m.Dude.getBaseProperties().Hitpoints += 15;
				_event.m.Dude.getBaseProperties().Stamina += 10;
				_event.m.Dude.getBaseProperties().Initiative += 10;
				_event.m.Dude.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+7[/color] Melee Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+7[/color] Ranged Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_skill.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+12[/color] Melee Skill"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/fatigue.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Max Fatigue"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/initiative.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+10[/color] Initiative"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/health.png",
					text = _event.m.Dude.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+15[/color] Hitpoints"
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
			this.m.Score = 20;
		}
	}
});	