::mods_hookExactClass("events/events/dlc8/anatomist_helps_blighted_guy_2_event", function ( o )
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
				this.Characters.push(_event.m.MilitiaCaptain.getImagePath());
				//local bg = this.new("scripts/skills/backgrounds/militia_background");
				local bga = _event.m.MilitiaCaptain.getBackground();	
				
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
				if (bga.hasPerk(this.Const.Perks.PerkDefs.crScintillating))
				{
					sctors = true;
					bga.removePerk(this.Const.Perks.PerkDefs.crScintillating);
				}
				local addPerk = function ( _perk, _row = 0 )
				{
					local actor = _event.m.MilitiaCaptain;
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
				if (::Is_PTR_Exist && sctors)
				{				
					addPerk(this.Const.Perks.PerkDefs.PTRRisingStar, 6);
				}
				addPerk(this.Const.Perks.PerkDefs.LegendSpecialistMilitiaSkill, 0);				
				addPerk(this.Const.Perks.PerkDefs.LegendSpecialistMilitiaDamage, 2);				
				local oldPerkTree = bga.m.CustomPerkTree;				
				//bg.m.IsNew = false;
				//_event.m.MilitiaCaptain.getSkills().removeByID("background.vagabond");
				//_event.m.MilitiaCaptain.getSkills().add(bg);
				//bga = _event.m.MilitiaCaptain.getBackground();				
				//bga.rebuildPerkTree(oldPerkTree);	
				_event.m.MilitiaCaptain.resetPerks();
				bga.m.RawDescription = "You found %name% being buried alive for carrying some unknown blight. The anatomists took interest in him and rescued him, nursing him back to health. Now, he fights for you, putting to use the skills that made him captain of the guard in a previous life.";
				bga.buildDescription(true);
				//_event.m.MilitiaCaptain.getBackground().m.Icon = "ui/backgrounds/background_53.png";
				//_event.m.MilitiaCaptain.getBackground().m.Name = "Assassin";
				_event.m.MilitiaCaptain.getSkills().add(this.new("scripts/skills/traits/crfake_militiacaptain_trait"));	
				_event.m.MilitiaCaptain.getSkills().update();				
				_event.m.MilitiaCaptain.improveMood(1.0, "Recovered from the blight afflicting him");

				if (_event.m.MilitiaCaptain.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.MilitiaCaptain.getMoodState()],
						text = _event.m.MilitiaCaptain.getName() + this.Const.MoodStateEvent[_event.m.MilitiaCaptain.getMoodState()]
					});
				}
								
				_event.m.MilitiaCaptain.getBaseProperties().MeleeDefense += 4;
				_event.m.MilitiaCaptain.getBaseProperties().RangedDefense += 4;
				_event.m.MilitiaCaptain.getBaseProperties().MeleeSkill += 8;
				_event.m.MilitiaCaptain.getBaseProperties().RangedSkill += 7;
				_event.m.MilitiaCaptain.getBaseProperties().Stamina += 3;
				_event.m.MilitiaCaptain.getBaseProperties().Initiative += 6;
				_event.m.MilitiaCaptain.getBaseProperties().Bravery += 12;
				_event.m.MilitiaCaptain.getBaseProperties().Hitpoints += 5;
				_event.m.MilitiaCaptain.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_defense.png",
					text = _event.m.MilitiaCaptain.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+4[/color] Melee Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/ranged_defense.png",
					text = _event.m.MilitiaCaptain.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+4[/color] Ranged Defense"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/melee_skill.png",
					text = _event.m.MilitiaCaptain.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+8[/color] Melee Skill"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/ranged_skill.png",
					text = _event.m.MilitiaCaptain.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+7[/color] Ranged Skill"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/fatigue.png",
					text = _event.m.MilitiaCaptain.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+3[/color] Max Fatigue"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/initiative.png",
					text = _event.m.MilitiaCaptain.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+6[/color] Initiative"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/bravery.png",
					text = _event.m.MilitiaCaptain.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+12[/color] Resolve"
				});
				this.List.push({
					id = 16,
					icon = "ui/icons/health.png",
					text = _event.m.MilitiaCaptain.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+5[/color] Hitpoints"
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
			this.m.Score = 30;
		}
	}
});	