this.cr_rogue_arena_contract <- this.inherit("scripts/contracts/contract", {
	m = {},
	function create()
	{
		this.contract.create();
		this.m.DifficultyMult = 1.0;
		this.m.Type = "contract.cr_rogue_arena";
		this.m.Name = "The Arena";
		this.m.TimeOut = this.Time.getVirtualTimeF() + this.World.getTime().SecondsPerDay * 1.0;
	}

	function onImportIntro()
	{
		this.importSettlementIntro();
	}
	
	function start()
	{
		this.setup();
		local r = 1;				
		r += 2 * this.Math.min(4, this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") / 5);
		r = this.Math.rand(1 , r);		
		if (r == 1)
		{
			this.m.Flags.set("IsBandits", true);					
		}
		else if (r == 2)
		{
			this.m.Flags.set("IsOrientalBandits", true);						
		}
		else if (r == 3)
		{
			this.m.Flags.set("IsBarbarians", true);						
		}
		else if (r == 4)
		{
			this.m.Flags.set("IsZombies", true);					
		}
		else if (r == 5)
		{	
			this.m.Flags.set("IsUndead", true);					
		}
		else if (r == 6)
		{
			this.m.Flags.set("IsOrcs", true);				
		}
		else if (r == 7)
		{
			this.m.Flags.set("IsGoblins", true);					
		}
		else if (r == 8)
		{
			this.m.Flags.set("IsNoble", true);					
		}
		else if (r == 9)
		{
			this.m.Flags.set("IsCity", true);					
		}		
		this.contract.start();
	}

	function setup()
	{
		this.m.Payment.Pool = 1500 + 250 * this.Math.min(34, this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon")) + 100 * this.Math.max(0, this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") - 34);
		this.m.Payment.Completion = 1.0;
	}

	function createStates()
	{
		this.m.States.push({                 //offer  ->  task   ->  sp  ->  spStart
			ID = "Offer",                    //offer  ->  task   -> overview ->  Start   ->  Success || Failure1 || Failure2
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"Enter the arena again to start the fight",
					"The fight will be to the death and you won\'t be able to retreat or loot afterwards",
					"",	
					"This is " + (this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") + 1) + "th match"
				];
				this.Contract.m.BulletpointsPayment = [
					"Get " + this.Contract.m.Payment.getOnCompletion() + " crowns for your victory"
				];
				if (this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") > 0 && this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") % 5 == 0)
				{
					this.Contract.m.BulletpointsPayment.push("Special Tournament will give you unique rewards");
				}
				this.Contract.setScreen("Task");				
			}

			function end()
			{
				this.Flags.set("Day", this.World.getTime().Days);
				this.Contract.setScreen("Start");
				this.World.Contracts.setActiveContract(this.Contract);
			}

		});
		this.m.States.push({
			ID = "Running",
			function start()
			{
				this.Contract.m.Home.getSprite("selection").Visible = true;
			}
			function update()
			{
				if (this.Flags.get("IsVictory"))
				{
					this.Contract.setScreen("Success");
					this.World.Contracts.showActiveContract();
				}
				else if (this.Flags.get("IsFailure"))
				{
					this.Contract.setScreen("Failure1");
					this.World.Contracts.showActiveContract();
				}
				else if (this.World.getTime().Days > this.Flags.get("Day"))
				{
					this.Contract.setScreen("Failure2");
					this.World.Contracts.showActiveContract();
				}
			}
			function onCombatVictory( _combatID )
			{
				if (_combatID == "Arena")
				{
					this.Flags.set("IsVictory", true);
				}
			}
			function onRetreatedFromCombat( _combatID )
			{
				if (_combatID == "Arena")
				{
					this.Flags.set("IsFailure", true);
				}
			}
		});
	}

	function createScreens()
	{
		this.m.Screens.push({
			ID = "Task",
			Title = "At the Arena",
			Text = "",
			Image = "",
			List = [],
			ShowDifficulty = true,
			Options = [
				{
					Text = "{We shall turn the sand red with blood! | I want to hear the crowd chant our names! | We\'ll slaughter them like lambs!}",
					function getResult()
					{
						if (this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") > 0 && this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") <= 60 && this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") % 5 == 0)
						{
							return "OverviewSP";
						}
						else
						{
							this.Contract.setState("Running");
							return "Overview";
						}					
					}
				}				
			]
			function start()
			{
				this.Text = "[img]gfx/ui/pics/pic_rogue_10.png[/img]Dozens of men mingle about the arena\'s entrance. Some stand stoically, not wishing to give any hint of their capabilities. Others, however, boast and brag with aplomb, either sincerely confident in their martial skills or hoping their bravado masks any holes in their game.\n\n";
				this.Text += "A grizzled man, the master of the arena, holds up a scroll and taps it with a hook for a hand.";
				this.Text += "He points to some strange looking collars and continues.%SPEECH_ON%When you\'re ready, put these on the three men who\'ll be doing the fighting. This lets us know who to take into the pits. Anyone not wearing these will not be allowed in, not you, not the Vizier, dare I say even the Gilder may be turned down.%SPEECH_OFF%";
				if (this.Flags.get("IsBandits"))
				{
					this.Contract.m.BulletpointsObjectives[1] = "Fight against bandits";	
				}
				else if (this.Flags.get("IsBarbarians"))
				{
					this.Contract.m.BulletpointsObjectives[1] = "Fight against barbarians";	
				}	
				else if (this.Flags.get("IsOrientalBandits"))
				{
					this.Contract.m.BulletpointsObjectives[1] = "Fight against nomands";	
				}
				else if (this.Flags.get("IsOrcs"))
				{
					this.Contract.m.BulletpointsObjectives[1] = "Fight against orcs";	
				}	
				else if (this.Flags.get("IsGoblins"))
				{
					this.Contract.m.BulletpointsObjectives[1] = "Fight against goblins";	
				}
				else if (this.Flags.get("IsUndead"))
				{
					this.Contract.m.BulletpointsObjectives[1] = "Fight against the undead";	
				}				
				else if (this.Flags.get("IsZombies"))	
				{
					this.Contract.m.BulletpointsObjectives[1] = "Fight against zombies";	
				}
				else if (this.Flags.get("IsNoble"))	
				{
					this.Contract.m.BulletpointsObjectives[1] = "Fight against noble army";	
				}	
				else if (this.Flags.get("IsCity"))	
				{
					this.Contract.m.BulletpointsObjectives[1] = "Fight against city army";	
				}
				local matchnumber = this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon");				
				if (matchnumber == 5)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against Disguised Wolf Bandits";
				}
				else if (matchnumber == 10)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against Slave Owners";
				}
				else if (matchnumber == 15)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against a Barbarian King";
				}
				else if (matchnumber == 20)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against plagued Noble Army";
				}
				else if (matchnumber == 25)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against Greenskins";
				}
				else if (matchnumber == 30)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against Desperados";
				}
				else if (matchnumber == 35)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against Vampires";
				}
				else if (matchnumber == 40)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against a Baron";
				}	
				else if (matchnumber == 45)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against Goblin Riders";
				}
				else if (matchnumber == 50)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against a Legion";
				}	
				else if (matchnumber == 55)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against Hexes";
				}
				else if (matchnumber == 60)
				{
					this.Contract.m.BulletpointsObjectives[2] = "Or point for a special tournament and prepare to fight against Sellswords";
				}				
			}				
		});	
		this.m.Screens.push({
			ID = "Overview",
			Title = "Overview",
			Text = "This arena fight works as follows. Do you agree to the terms?",
			Image = "",
			List = [],
			Options = [
				{
					Text = "I accept.",
					function getResult()
					{
						this.Contract.setState("Running");
						return 0;
					}
				},				
				{
					Text = "I\'ll have to think it over.",
					function getResult()
					{
						return 0;
					}
				}
			],
			ShowObjectives = true,
			ShowPayment = true,
			function start()
			{
				this.Contract.m.IsNegotiated = true;
			}
		});	
		this.m.Screens.push({
			ID = "OverviewSP",
			Title = "Overview",
			Text = "This arena fight works as follows. Do you agree to the terms?",
			Image = "",
			List = [],
			Options = [
				{
					Text = "I accept.",
					function getResult()
					{
						this.Contract.setState("Running");
						return 0;
					}
				},	
				{
					Text = "Point for a special tournament",
					function getResult()
					{
						this.Flags.set("roguespecial", true);
						this.Contract.setState("Running");
						return 0;
					}
				},				
				{
					Text = "I\'ll have to think it over.",
					function getResult()
					{
						return 0;
					}
				}
			],
			ShowObjectives = true,
			ShowPayment = true,
			function start()
			{
				this.Contract.m.IsNegotiated = true;
			}
		});			
		this.m.Screens.push({
			ID = "Start",
			Title = "At the Arena",
			Text = "[img]gfx/ui/pics/pic_rogue_03.png[/img]{As you wait your turn, the crowd\'s bloodlust crawls through the dark, sheets of dust falling from above, the stomps of feet thunderous. They murmur in anticipation, and roar at killings. The quiet between battles is mere moments, and this silence is snatched away as the rusted gate lurches upward, chains rankling, the crowd abuzz once more. You step out into the light and so thunderous is the noise against your heart it could surely yet spur a dead man forth... | The arena\'s crowd is shoulder to shoulder, most blathering drunk. They scream and shout, their languages a mix of local and foreign, though the appeal to their bloodlust needs little articulation beyond their maddened faces and pumping fists. Now, the %companyname%\'s men will satiate these mad fools... | Cleaners hurry about the arena. They drag away the bodies, collect what\'s worth collecting, and occasionally throw a trophy into the crowds, eliciting a moblike rendition of the arena\'s battles in the stands themselves. The %companyname% is now a part of this affair. | The arena awaits, the crowd alight, and the %companyname%\'s turn to gain glory is at hand! | The crowd booms as the %companyname%\'s men stride into its bloody pit. Despite the mindless bloodlust of the peoples, you can\'t help but feel a beat of pride in your chest, knowing that it is your company ready to put on a show. | The gate rises. Nothing is heard save the rattle of chains, the creak of pulleys, the grunts of slaves at work. When the men of the %companyname% step out of the arena\'s bowels they can hear the crunch of sand underfoot until they come to stand in the center of the pit. A strange voice screams from the tops of the stadium, some lost language beyond your knowing, but the words echo just once before the crowd erupts with cheers and roaring. Now is the time your men shall prove themselves before the watchful eye of the commoner. | The %companyname%\'s business is rarely done before the eyes of those who would prefer themselves distantly separated from such violence. But in the arena, the commoner greedily awaits death and suffering, and it growls with bloodlust as your men enter the pits, and roars as the sellswords draw their weapons and ready for battle. | The arena is shaped like the pit of some sore, its ceiling torn away by the gods, revealing the vanity, bloodlust, and savagery of man. And it is man there, yelling and screaming, and if the blood sprays hit them, they wash their faces in the gore and grin at one another as though it were a joke. They fight one another for trophies and relish in the pain of others. And it is before these peoples that the %companyname% will fight, and for them they shall entertain and entertain well. | The arena\'s crowd is a mash of classes, rich and poor, for only the Viziers separate themselves out into stations above all. Briefly unified, the peoples of %townname% have graciously come together to watch men and monsters murder one another. With pleasure, the %companyname% seeks to do its part. | Boys sitting on the shoulders of fathers, young girls throwing flowers to the gladiators, women fanning themselves, men wondering if they could do it. These are the peoples of the arena - and the rest are all drunk out of their gourd and screaming nonsense. You hope the %companyname% can contribute to at least an hour or two to entertaining this mad lot. | The crowd roars as the %companyname%\'s men step into the pit. One would be dumb to confuse excitement for desire, for as soon as the applause ends there is a smattering of empty beer mugs and rotten tomatoes and the general giggling delight of those watching the matter. You wonder if the %companyname%\'s men are really best spent here, but then think hard on the gold and glory to be won, and that at the end of the day these mongrels in the stands will go home to their shit lives, and you\'ll go home to your shit life as well, but at least your pockets will be a bit deeper.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Let\'s give the crowd something to cheer for!",
					function getResult()
					{
						this.World.Flags.increment("RogueCount", 1);					
						local p = this.Const.Tactical.CombatInfo.getClone();
						p.CombatID = "Arena";						
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.TerrainTemplate = "tactical.tournament";
						p.LocationTemplate.Template[0] = "tactical.legend_tournament_floor";
						p.Music = this.Const.Music.ArenaTracks;
						p.Ambience[0] = this.Const.SoundAmbience.ArenaBack;
						p.Ambience[1] = this.Const.SoundAmbience.ArenaFront;
						p.AmbienceMinDelay[0] = 0;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsUsingSetPlayers = false;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = true;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = true;
						p.IsAutoAssigningBases = false;						
						p.Entities = [];
						
						local baseDifficulty = 50;
						local matchnumber = this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon");
						if (matchnumber > 0)
						{
							//baseDifficulty = baseDifficulty + 25 * this.Math.min(20, matchnumber) + 20 * this.Math.max(0, matchnumber - 20);
							baseDifficulty = baseDifficulty + 25 * matchnumber;							
						}
						baseDifficulty *= ::Legends.Mod.ModSettings.getSetting("RogueDifficulty").getValue() / 100;
						if (matchnumber <= 25)
						{
							if (this.Flags.get("IsBandits"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BanditRogue, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.BanditTracks;							
							}
							else if (this.Flags.get("IsBarbarians"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BarbarianRogue, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.BarbarianTracks;	
							}	
							else if (this.Flags.get("IsOrientalBandits"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.NomadRogue, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.OrientalBanditTracks;								
							}
							else if (this.Flags.get("IsUndead"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.UndeadRogue, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.UndeadTracks;
							}				
							else if (this.Flags.get("IsZombies"))	
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.ZombieRogue, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.UndeadTracks;
							}						
							else if (this.Flags.get("IsOrcs"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.OrcRogue, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.OrcsTracks;								
							}	
							else if (this.Flags.get("IsGoblins"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.GoblinRogue, baseDifficulty, this.Const.Faction.Enemy);
								p.Music = this.Const.Music.GoblinsTracks;							
							}
							else if (this.Flags.get("IsNoble"))	
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.NobleRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.NobleTracks;
							}	
							else if (this.Flags.get("IsCity"))	
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.CityRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.OrientalCityStateTracks;	
							}	
						}
						else if (matchnumber <= 40)
						{
							if (this.Flags.get("IsBandits"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BanditRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.BanditTracks;							
							}
							else if (this.Flags.get("IsBarbarians"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BarbarianRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.BarbarianTracks;	
							}	
							else if (this.Flags.get("IsOrientalBandits"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.NomadRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.OrientalBanditTracks;								
							}
							else if (this.Flags.get("IsUndead"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.UndeadRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.UndeadTracks;
							}				
							else if (this.Flags.get("IsZombies"))	
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.ZombieRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.UndeadTracks;
							}						
							else if (this.Flags.get("IsOrcs"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.OrcRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.OrcsTracks;								
							}	
							else if (this.Flags.get("IsGoblins"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.GoblinRogueHard, baseDifficulty, this.Const.Faction.Enemy);
								p.Music = this.Const.Music.GoblinsTracks;							
							}
							else if (this.Flags.get("IsNoble"))	
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.NobleRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.NobleTracks;
							}	
							else if (this.Flags.get("IsCity"))	
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.CityRogueHard, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.OrientalCityStateTracks;	
							}	
						}	
						else
						{
							if (this.Flags.get("IsBandits"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BanditRogueEnd, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.BanditTracks;							
							}
							else if (this.Flags.get("IsBarbarians"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BarbarianRogueEnd, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.BarbarianTracks;	
							}	
							else if (this.Flags.get("IsOrientalBandits"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.NomadRogueEnd, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.OrientalBanditTracks;								
							}
							else if (this.Flags.get("IsUndead"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.UndeadRogueEnd, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.UndeadTracks;
							}				
							else if (this.Flags.get("IsZombies"))	
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.ZombieRogueEnd, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.UndeadTracks;
							}						
							else if (this.Flags.get("IsOrcs"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.OrcRogueEnd, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.OrcsTracks;								
							}	
							else if (this.Flags.get("IsGoblins"))
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.GoblinRogueEnd, baseDifficulty, this.Const.Faction.Enemy);
								p.Music = this.Const.Music.GoblinsTracks;							
							}
							else if (this.Flags.get("IsNoble"))	
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.NobleRogueEnd, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.NobleTracks;
							}	
							else if (this.Flags.get("IsCity"))	
							{
								this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.CityRogueEnd, baseDifficulty, this.Const.Faction.Enemy);	
								p.Music = this.Const.Music.OrientalCityStateTracks;	
							}	
						}						
						this.World.Contracts.startScriptedCombat(p, false, false, false);						
						return 0;
					}
				}
			]
		});
		this.m.Screens.push({
			ID = "ST",
			Title = "At the Arena",
			Text = "[img]gfx/ui/pics/pic_rogue_03.png[/img]{As you wait your turn, the crowd\'s bloodlust crawls through the dark, sheets of dust falling from above, the stomps of feet thunderous. They murmur in anticipation, and roar at killings. The quiet between battles is mere moments, and this silence is snatched away as the rusted gate lurches upward, chains rankling, the crowd abuzz once more. You step out into the light and so thunderous is the noise against your heart it could surely yet spur a dead man forth... | The arena\'s crowd is shoulder to shoulder, most blathering drunk. They scream and shout, their languages a mix of local and foreign, though the appeal to their bloodlust needs little articulation beyond their maddened faces and pumping fists. Now, the %companyname%\'s men will satiate these mad fools... | Cleaners hurry about the arena. They drag away the bodies, collect what\'s worth collecting, and occasionally throw a trophy into the crowds, eliciting a moblike rendition of the arena\'s battles in the stands themselves. The %companyname% is now a part of this affair. | The arena awaits, the crowd alight, and the %companyname%\'s turn to gain glory is at hand! | The crowd booms as the %companyname%\'s men stride into its bloody pit. Despite the mindless bloodlust of the peoples, you can\'t help but feel a beat of pride in your chest, knowing that it is your company ready to put on a show. | The gate rises. Nothing is heard save the rattle of chains, the creak of pulleys, the grunts of slaves at work. When the men of the %companyname% step out of the arena\'s bowels they can hear the crunch of sand underfoot until they come to stand in the center of the pit. A strange voice screams from the tops of the stadium, some lost language beyond your knowing, but the words echo just once before the crowd erupts with cheers and roaring. Now is the time your men shall prove themselves before the watchful eye of the commoner. | The %companyname%\'s business is rarely done before the eyes of those who would prefer themselves distantly separated from such violence. But in the arena, the commoner greedily awaits death and suffering, and it growls with bloodlust as your men enter the pits, and roars as the sellswords draw their weapons and ready for battle. | The arena is shaped like the pit of some sore, its ceiling torn away by the gods, revealing the vanity, bloodlust, and savagery of man. And it is man there, yelling and screaming, and if the blood sprays hit them, they wash their faces in the gore and grin at one another as though it were a joke. They fight one another for trophies and relish in the pain of others. And it is before these peoples that the %companyname% will fight, and for them they shall entertain and entertain well. | The arena\'s crowd is a mash of classes, rich and poor, for only the Viziers separate themselves out into stations above all. Briefly unified, the peoples of %townname% have graciously come together to watch men and monsters murder one another. With pleasure, the %companyname% seeks to do its part. | Boys sitting on the shoulders of fathers, young girls throwing flowers to the gladiators, women fanning themselves, men wondering if they could do it. These are the peoples of the arena - and the rest are all drunk out of their gourd and screaming nonsense. You hope the %companyname% can contribute to at least an hour or two to entertaining this mad lot. | The crowd roars as the %companyname%\'s men step into the pit. One would be dumb to confuse excitement for desire, for as soon as the applause ends there is a smattering of empty beer mugs and rotten tomatoes and the general giggling delight of those watching the matter. You wonder if the %companyname%\'s men are really best spent here, but then think hard on the gold and glory to be won, and that at the end of the day these mongrels in the stands will go home to their shit lives, and you\'ll go home to your shit life as well, but at least your pockets will be a bit deeper.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Let\'s give the crowd something to cheer for!",
					function getResult()
					{
						this.World.Flags.increment("RogueCount", 1);
						local p = this.Const.Tactical.CombatInfo.getClone();
						p.CombatID = "Arena";						
						p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
						p.TerrainTemplate = "tactical.tournament";
						p.LocationTemplate.Template[0] = "tactical.legend_tournament_floor";
						p.Music = this.Const.Music.ArenaTracks;
						p.Ambience[0] = this.Const.SoundAmbience.ArenaBack;
						p.Ambience[1] = this.Const.SoundAmbience.ArenaFront;
						p.AmbienceMinDelay[0] = 0;
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
						p.IsUsingSetPlayers = false;
						p.IsFleeingProhibited = true;
						p.IsLootingProhibited = true;
						p.IsWithoutAmbience = true;
						p.IsFogOfWarVisible = false;
						p.IsArenaMode = true;
						p.IsAutoAssigningBases = false;						
						p.Entities = [];
						
						local baseDifficulty = 50;
						local matchnumber = this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon");
						if (this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") > 0)
						{
							baseDifficulty = baseDifficulty + 25 * this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon");
						}
						
						if (matchnumber == 5)
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialIchi, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;							
						}
						else if (matchnumber == 10)
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialNi, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;	
						}	
						else if (matchnumber == 15)
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialSann, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;								
						}
						else if (matchnumber == 20)
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialYonn, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;
						}				
						else if (matchnumber == 25)	
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialGo, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;
						}						
						else if (matchnumber == 30)
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialRoku, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;								
						}		
						else if (matchnumber == 35)	
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialNana, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;	
						}
						else if (matchnumber == 40)	
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialHachi, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;	
						}
						else if (matchnumber == 45)	
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialKyuu, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;	
						}
						else if (matchnumber == 50)	
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialJyuu, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;	
						}
						else if (matchnumber == 55)	
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialXI, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;	
						}
						else if (matchnumber == 60)	
						{
							this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.RogueSpecialXII, baseDifficulty, this.Const.Faction.Enemy);	
							p.Music = this.Const.Music.ArenaTracks;	
						}												
						this.World.Contracts.startScriptedCombat(p, false, false, false);
						return 0;
					}
				}
			]
		});		
		this.m.Screens.push({
			ID = "Success",
			Title = "At the Arena",
			Text = "[img]gfx/ui/pics/pic_rogue_12.png[/img]{The arena master talks as if he doesn\'t even remember your face, then again he probably doesn\'t.%SPEECH_ON%Here\'s your pay, please come again.%SPEECH_OFF%The arena will be closed for the day, but you could return as early as tomorrow. | Without even raising his head from a rag of papyrus, the arena master throws you a purse of coin.%SPEECH_ON%I heard the crowds, and so here are your crowns. May you come visit the pits again.%SPEECH_OFF%The arena will be closed for the day, but you could return as early as tomorrow. | The arena master is waiting for you.%SPEECH_ON%That was a mighty fine show, Crownling. Would not mind it in the slightest if you come back again.%SPEECH_OFF%The arena will be closed for the day, but you could return as early as tomorrow.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "{Victory! | Are you not entertained?! | Killed it. | A bloody spectacle.}",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						if (this.World.getPlayerRoster().getSize() < this.World.Assets.getBrothersMax())
						{
							return "Dude";
						}
						else
						{
							this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
							this.World.Statistics.getFlags().increment("ArenaFightsWon", 1);
							this.World.Statistics.getFlags().increment("ArenaRegularFightsWon", 1);
							this.World.Contracts.finishActiveContract();							
							return 0;
						}
					}

				}
			],
			function start()
			{
				local roster = this.World.getPlayerRoster().getAll();									
				foreach( bro in roster )
				{
					local skill;
					bro.getFlags().increment("ArenaFightsWon", 1);
					bro.getFlags().increment("ArenaFights", 1);
					bro.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));

					if (bro.getFlags().getAsInt("ArenaFightsWon") == 1)
					{
						skill = this.new("scripts/skills/traits/arena_pit_fighter_trait");
						bro.getSkills().add(skill);
						this.List.push({
							id = 10,
							icon = skill.getIcon(),
							text = bro.getName() + " is now " + this.Const.Strings.getArticle(skill.getName()) + skill.getName()
						});
					}
					else if (bro.getFlags().getAsInt("ArenaFightsWon") == 5)
					{
						bro.getSkills().removeByID("trait.pit_fighter");
						skill = this.new("scripts/skills/traits/arena_fighter_trait");
						bro.getSkills().add(skill);
						this.List.push({
							id = 10,
							icon = skill.getIcon(),
							text = bro.getName() + " is now " + this.Const.Strings.getArticle(skill.getName()) + skill.getName()
						});
					}
					else if (bro.getFlags().getAsInt("ArenaFightsWon") == 12)
					{
						bro.getSkills().removeByID("trait.arena_fighter");
						skill = this.new("scripts/skills/traits/arena_veteran_trait");
						bro.getSkills().add(skill);
						this.List.push({
							id = 10,
							icon = skill.getIcon(),
							text = bro.getName() + " is now " + this.Const.Strings.getArticle(skill.getName()) + skill.getName()
						});
					}
					else if (bro.getFlags().getAsInt("ArenaFightsWon") > 25 && bro.getSkills().hasSkill("trait.arena_veteran"))
					{
						bro.getSkills().removeByID("trait.arena_veteran");

						if (bro.getFlags().getAsInt("ArenaFightsWon") < 50)
						{
							skill = this.new("scripts/skills/traits/arena_champion_trait");
						}
						else
						{
							skill = this.new("scripts/skills/traits/arena_invictus_trait");
						}

						bro.getSkills().add(skill);
						this.List.push({
							id = 10,
							icon = skill.getIcon(),
							text = bro.getName() + " is now " + this.Const.Strings.getArticle(skill.getName()) + skill.getName()
						});
					}
					else if (bro.getFlags().getAsInt("ArenaFightsWon") == 25)
					{
						bro.getSkills().removeByID("trait.arena_veteran");
						skill = this.new("scripts/skills/traits/arena_champion_trait");
						bro.getSkills().add(skill);
						this.List.push({
							id = 10,
							icon = skill.getIcon(),
							text = bro.getName() + " is now " + this.Const.Strings.getArticle(skill.getName()) + skill.getName()
						});
					}
					else if (bro.getFlags().getAsInt("ArenaFightsWon") == 50)
					{
						bro.getSkills().removeByID("trait.arena_champion");
						skill = this.new("scripts/skills/traits/arena_invictus_trait");
						bro.getSkills().add(skill);
						this.List.push({
							id = 10,
							icon = skill.getIcon(),
							text = bro.getName() + " is now " + this.Const.Strings.getArticle(skill.getName()) + skill.getName()
						});
					}					
				}
				
				local rewarditem;
				this.World.Assets.getStash().makeEmptySlots(2); 				
				rewarditem = this.new("scripts/items/tools/throwing_net");
				this.World.Assets.getStash().add(rewarditem);
				if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") % 2 == 0)
				{
					this.World.Assets.getStash().add(rewarditem);	
				}
				//-----------------------------------------------------------------------------------									
				if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 5)
				{
					this.World.Assets.getStash().makeEmptySlots(2); 				
					rewarditem = this.new("scripts/items/accessory/sergeant_badge_item");
					this.World.Assets.getStash().add(rewarditem);
					rewarditem = this.new("scripts/items/tools/player_banner");
					rewarditem.setVariant(this.World.Assets.getBannerID());
					this.World.Assets.getStash().add(rewarditem);
				}
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 10) 
				{
					this.World.Assets.getStash().makeEmptySlots(6); 				
					rewarditem = this.new("scripts/items/accessory/ghoul_trophy_item");						
					for (local i = 0; i < 4; ++i)
					{
						this.World.Assets.getStash().add(rewarditem);			
					}
					rewarditem = this.Const.World.Common.pickArmor([
						[
							1,
							"adorned_mail_shirt_armor"
						]
					]);						
					this.World.Assets.getStash().add(rewarditem);
					rewarditem = this.Const.World.Common.pickArmor([
						[
							1,
							"adorned_warriors_armor_armor"
						]
					]);						
					this.World.Assets.getStash().add(rewarditem);					
				}
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 15)
				{
					this.World.Assets.getStash().makeEmptySlots(2); 				
					rewarditem = this.new("scripts/items/special/fountain_of_youth_item");						
					for (local i = 0; i < 2; ++i)
					{
						this.World.Assets.getStash().add(rewarditem);			
					}
				}
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 20)
				{
					this.World.Assets.getStash().makeEmptySlots(2); 				
					rewarditem = this.new("scripts/items/tents/tent_craft");
					this.World.Assets.getStash().add(rewarditem);
					rewarditem = this.new("scripts/items/tents/tent_hunter");
					this.World.Assets.getStash().add(rewarditem);
					this.List.push({
						id = 10,
						icon = "ui/icons/special.png",							
						text = "Training Dummies are available."
					});					
				}					
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 25)
				{
					this.World.Assets.getStash().makeEmptySlots(3); 				
					rewarditem = this.new("scripts/items/accessory/orc_trophy_item");						
					for (local i = 0; i < 2; ++i)
					{
						this.World.Assets.getStash().add(rewarditem);			
					}	
					rewarditem = this.new("scripts/items/tents/tent_train");
					this.World.Assets.getStash().add(rewarditem);						
				}
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 30)
				{
					this.World.Assets.getStash().makeEmptySlots(4); 				
					rewarditem = this.Const.World.Common.pickArmor([
						[
							1,
							"adorned_heavy_mail_hauberk_armor"
						]
					]);						
					this.World.Assets.getStash().add(rewarditem);
					rewarditem = this.Const.World.Common.pickHelmet([
						[
							1,
							"adorned_full_helm_helmet"
						]
					]);
					this.World.Assets.getStash().add(rewarditem);
					rewarditem = this.new("scripts/items/misc/potion_of_oblivion_item");						
					for (local i = 0; i < 2; ++i)
					{
						this.World.Assets.getStash().add(rewarditem);			
					}
					this.World.Flags.set("RogueSpecialSkills_1", true);	
					this.List.push({
						id = 10,
						icon = "ui/icons/special.png",							
						text = "Some skills are available for new operators."
					});						
				}
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 35)
				{
					this.World.Assets.getStash().makeEmptySlots(2); 				
					rewarditem = this.new("scripts/items/shields/legendary/gilders_embrace_shield");					
					this.World.Assets.getStash().add(rewarditem);	
					rewarditem = this.new("scripts/items/weapons/legendary/lightbringer_sword");
					this.World.Assets.getStash().add(rewarditem);					
				}	
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 40)
				{
					this.World.Flags.set("RogueSpecialSkills_2", true);	
					this.List.push({
						id = 10,
						icon = "ui/icons/special.png",							
						text = "Operators have learned new skills based on their professions."
					});						
				}
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 45)
				{
					this.World.Flags.set("RogueSpecialBuff_3", true);	
					this.List.push({
						id = 10,
						icon = "ui/icons/ranged_defense.png",							
						text = "The company has gained resistance to ranged attacks."
					});						
				}
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 50)
				{
					this.World.Assets.getStash().makeEmptySlots(2); 				
					rewarditem = this.Const.World.Common.pickArmor([
						[
							1,
							"cremperors_armor"
						]
					]);						
					this.World.Assets.getStash().add(rewarditem);
					rewarditem = this.Const.World.Common.pickHelmet([
						[
							1,
							"cremperors_helmet"
						]
					]);
					this.World.Assets.getStash().add(rewarditem);					
				}
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 55)
				{
					this.World.Assets.getStash().makeEmptySlots(2); 				
					rewarditem = this.Const.World.Common.pickArmor([
						[
							1,
							"crmountain_armor"
						]
					]);						
					this.World.Assets.getStash().add(rewarditem);
					rewarditem = this.Const.World.Common.pickHelmet([
						[
							1,
							"crmountain_helmet"
						]
					]);
					this.World.Assets.getStash().add(rewarditem);					
				}
				else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 60)
				{
					this.World.Flags.set("RogueXPincrease", true);	
					this.List.push({
						id = 10,
						icon = "ui/icons/talent_3.png",							
						text = "The company has gained resistance to ranged attacks."
					});							
				}				
				else if (this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") > 0 && this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") % 5 == 0)
				{
					rewarditem = this.new("scripts/items/accessory/potion_of_knowledge_item");
					this.World.Assets.getStash().add(rewarditem);	
				}				

				//Tournament reward	--------------------------------------------------------------------------								
				if (this.Flags.get("roguespecial"))
				{
					//this.logInfo("match number: " + this.World.Statistics.getFlags().getAsInt("ArenaFightsWon"));					
					if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 5)
					{
						rewarditem = this.new("scripts/items/legend_armor/armor_upgrades/legend_direwolf_pelt_upgrade");						
						this.World.Assets.getStash().makeEmptySlots(10);
						for (local i = 0; i < 10; ++i)
						{
							this.World.Assets.getStash().add(rewarditem);			
						} 
					}
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 10)
					{
						this.World.Assets.getStash().makeEmptySlots(4); 				
						rewarditem = this.new("scripts/items/accessory/legend_demonalp_trophy_item");						
						for (local i = 0; i < 3; ++i)
						{
							this.World.Assets.getStash().add(rewarditem);			
						}					
						rewarditem = this.new("scripts/items/weapons/special/cr_rogue_cleaver");
						this.World.Assets.getStash().add(rewarditem);						
					}					
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 15)
					{
						this.World.Assets.getStash().makeEmptySlots(3);					
						rewarditem = this.Const.World.Common.pickArmor([
							[
								1,
								"crijirok_armor"  
							]
						]);						
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.Const.World.Common.pickHelmet([
							[
								1,
								"crijirok_helmet"   
							]
						]);
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/weapons/special/cr_rogue_hammer");						
						this.World.Assets.getStash().add(rewarditem);						
					}
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 20)
					{				
						this.World.Assets.getStash().makeEmptySlots(1); 				
						rewarditem = this.new("scripts/items/misc/anatomist/lorekeeper_potion_item");
						this.World.Assets.getStash().add(rewarditem);							
					}
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 25)
					{
						this.World.Flags.set("RogueSpecialBuff_1", true);	
						this.List.push({
							id = 10,
							icon = "ui/icons/special.png",							
							text = "The company has gained resistance to bleeding."
						});	
						//this.List.push({
						//	id = 10,
						//	icon = "ui/icons/damage_received.png",							
						//	text = "Bleeding now applies damage at the start of the turn instead of the end of the turn."
						//});							
						this.World.Assets.getStash().makeEmptySlots(1); 						
						rewarditem = this.new("scripts/items/weapons/special/cr_rogue_axe");						
						this.World.Assets.getStash().add(rewarditem);						
					}
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 30)
					{
						this.World.Flags.set("RogueSpecialBuff_2", true);	
						this.List.push({
							id = 10,
							icon = "ui/icons/special.png",							
							text = "The company has gained resistance to injury."
						});						
					}
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 35)
					{				
						this.World.Assets.getStash().makeEmptySlots(3); 				
						rewarditem = this.new("scripts/items/misc/anatomist/necrosavant_potion_item");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/accessory/legend_demon_banshee_trophy_item");						
						for (local i = 0; i < 2; ++i)
						{
							this.World.Assets.getStash().add(rewarditem);			
						}						
					}					
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 40)
					{
						this.World.Assets.getStash().makeEmptySlots(7); 				
						rewarditem = this.new("scripts/items/weapons/special/named_sword_abt_durandal");
						this.World.Assets.getStash().add(rewarditem);	
						rewarditem = this.new("scripts/items/weapons/special/named_sword_abt_excalibur");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/weapons/special/named_sword_abt_guinevere");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/weapons/special/named_sword_abt_herbstnebel");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/weapons/special/named_sword_abt_mikazuki");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/weapons/special/named_sword_abt_mystletainn");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/weapons/special/named_sword_abt_zhanlu");
						this.World.Assets.getStash().add(rewarditem);						
					}	
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 45)
					{
						this.World.Assets.getStash().makeEmptySlots(2); 				
						rewarditem = this.new("scripts/items/weapons/special/cr_rogue_staff");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/misc/anatomist/goblin_overseer_potion_item");
						this.World.Assets.getStash().add(rewarditem);						
					}
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 50)
					{				
						this.World.Assets.getStash().makeEmptySlots(3); 				
						rewarditem = this.new("scripts/items/misc/anatomist/crconqueror_potion_item");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/accessory/legend_demon_banshee_trophy_item");						
						for (local i = 0; i < 2; ++i)
						{
							this.World.Assets.getStash().add(rewarditem);			
						}						
					}
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 55)
					{				
						this.World.Assets.getStash().makeEmptySlots(5); 				
						rewarditem = this.new("scripts/items/legend_armor/legend_armor_upgrade/rogue_white_wolf_pelt_upgrade");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/legend_armor/plate/cr_skin_armor");
						this.World.Assets.getStash().add(rewarditem);
						rewarditem = this.new("scripts/items/legend_helmets/cloak/rogue_stollwurm_scales_upgrade");
						this.World.Assets.getStash().add(rewarditem);	
						rewarditem = this.new("scripts/items/legend_helmets/vanity/legend_helmet_redback_helm");
						this.World.Assets.getStash().add(rewarditem);	
						rewarditem = this.new("scripts/items/shields/special/legend_craftable_greenwood_schrat_shield");
						this.World.Assets.getStash().add(rewarditem);						
					}					
					else if (this.World.Statistics.getFlags().getAsInt("ArenaFightsWon") == 60)
					{				
						this.World.Assets.getStash().makeEmptySlots(1); 				
						rewarditem = this.new("scripts/items/tools/player_banner");
						rewarditem.setVariant(this.World.Assets.getBannerID());
						this.World.Assets.getStash().add(rewarditem);						
					}										
					else if (this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") > 0 && this.World.Statistics.getFlags().getAsInt("ArenaRegularFightsWon") % 5 == 0)
					{
						rewarditem = this.new("scripts/items/supplies/cured_rations_item");
						this.World.Assets.getStash().add(rewarditem);	
					}
				}				
			}

		});
		this.m.Screens.push({
			ID = "Failure1",
			Title = "At the Arena",
			Text = "[img]gfx/ui/pics/pic_rogue_12.png[/img]{The %companyname%\'s men have been defeated, either dead or, perhaps worse, badly mangled. At least the crowds are happy. In the pits, any showing, even that which ends in demise, is a good showing.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Disaster!",
					function getResult()
					{
						local roster = this.World.getPlayerRoster().getAll();
						foreach( bro in roster )
						{
							bro.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));						
							bro.getFlags().increment("ArenaFights", 1);
						}

						if (this.World.getPlayerRoster().getSize() < this.World.Assets.getBrothersMax())
						{
							return "Dude";
						}
						else
						{
							this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
							this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractFail);
							this.World.Contracts.finishActiveContract(true);						
							return 0;
						}
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Failure2",
			Title = "At the Arena",
			Text = "{[img]gfx/ui/pics/pic_rogue_13.png[/img]The time for your arena match has come and passed, but you didn\'t show up there. Perhaps something more important came up, or perhaps you\'ve just been hiding like cowards. Either way, your reputation will suffer because of this.",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "But...",
					function getResult()
					{
						this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractFail);
						this.World.Contracts.finishActiveContract(true);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Dude",
			Title = "At the Arena",
			Text = "{[img]gfx/ui/pics/pic_rogue_11.png[/img]After the battle, you can choose one operator to join the squad.\n\nVanguards are good at taking the initiative and often use light weapons.\nGuards are good at close combat and can wield heavy weapons flexibly.\nSpecialists are good at responding to different situations and can use long-handled weapons.\nDefenders are good at taking damage and can rely on shields.\n\nSnipers are good at long-range attacks and are proficient in using ranged weapons.\nSupporter are good at creating various environments or opportunities suitable for the team to fight.\nMedics are good at treating the wounded and inspiring others.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Vanguard",
					function getResult()
					{
						local temproster = this.World.getTemporaryRoster();
						local Dude = temproster.create("scripts/entity/tactical/player");
						Dude.setStartValuesEx(["cr_rogue_vanguard_background"]);
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_trait"));	
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));
																	
						this.World.getPlayerRoster().add(Dude);
						this.World.getTemporaryRoster().clear();				
						Dude.onHired();	
						
						this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
						this.World.Statistics.getFlags().increment("ArenaFightsWon", 1);
						this.World.Statistics.getFlags().increment("ArenaRegularFightsWon", 1);
						this.World.Contracts.finishActiveContract();						
						return 0;
					}
				},			
				{
					Text = "Guard",
					function getResult()
					{
						local temproster = this.World.getTemporaryRoster();
						local Dude = temproster.create("scripts/entity/tactical/player");
						Dude.setStartValuesEx(["cr_rogue_guard_background"]);
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_trait"));	
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));
																	
						this.World.getPlayerRoster().add(Dude);
						this.World.getTemporaryRoster().clear();				
						Dude.onHired();	
						
						this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
						this.World.Statistics.getFlags().increment("ArenaFightsWon", 1);
						this.World.Statistics.getFlags().increment("ArenaRegularFightsWon", 1);
						this.World.Contracts.finishActiveContract();						
						return 0;
					}
				},
				{
					Text = "Specialist",
					function getResult()
					{
						local temproster = this.World.getTemporaryRoster();
						local Dude = temproster.create("scripts/entity/tactical/player");
						Dude.setStartValuesEx(["cr_rogue_specialist_background"]);
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_trait"));	
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));
																	
						this.World.getPlayerRoster().add(Dude);
						this.World.getTemporaryRoster().clear();				
						Dude.onHired();	
						
						this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
						this.World.Statistics.getFlags().increment("ArenaFightsWon", 1);
						this.World.Statistics.getFlags().increment("ArenaRegularFightsWon", 1);
						this.World.Contracts.finishActiveContract();						
						return 0;
					}
				},				
				{
					Text = "Defender",
					function getResult()
					{
						local temproster = this.World.getTemporaryRoster();
						local Dude = temproster.create("scripts/entity/tactical/player");
						Dude.setStartValuesEx(["cr_rogue_defender_background"]);
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_trait"));	
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));

						this.World.getPlayerRoster().add(Dude);
						this.World.getTemporaryRoster().clear();				
						Dude.onHired();	
						
						this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
						this.World.Statistics.getFlags().increment("ArenaFightsWon", 1);
						this.World.Statistics.getFlags().increment("ArenaRegularFightsWon", 1);
						this.World.Contracts.finishActiveContract();						
						return 0;
					}
				},
				{
					Text = "Sniper",
					function getResult()
					{
						local temproster = this.World.getTemporaryRoster();
						local Dude = temproster.create("scripts/entity/tactical/player");
						Dude.setStartValuesEx(["cr_rogue_sniper_background"]);
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_trait"));	
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));
						
						this.World.getPlayerRoster().add(Dude);
						this.World.getTemporaryRoster().clear();				
						Dude.onHired();	
						
						this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
						this.World.Statistics.getFlags().increment("ArenaFightsWon", 1);
						this.World.Statistics.getFlags().increment("ArenaRegularFightsWon", 1);
						this.World.Contracts.finishActiveContract();						
						return 0;
					}
				},
				{
					Text = "Next Page",
					function getResult()
					{						
						return "DudeNext";
					}
				},				
			]			
		});
		this.m.Screens.push({
			ID = "DudeNext",
			Title = "At the Arena",
			Text = "{[img]gfx/ui/pics/pic_rogue_11.png[/img]After the battle, you can choose one operator to join the squad.\n\nVanguards are good at taking the initiative and often use light weapons.\nGuards are good at close combat and can wield heavy weapons flexibly.\nSpecialists are good at responding to different situations and can use long-handled weapons.\nDefenders are good at taking damage and can rely on shields.\n\nSnipers are good at long-range attacks and are proficient in using ranged weapons.\nSupporter are good at creating various environments or opportunities suitable for the team to fight.\nMedics are good at treating the wounded and inspiring others.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Supporter",
					function getResult()
					{
						local temproster = this.World.getTemporaryRoster();
						local Dude = temproster.create("scripts/entity/tactical/player");
						Dude.setStartValuesEx(["cr_rogue_supporter_background"]);
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_trait"));	
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));
												
						this.World.getPlayerRoster().add(Dude);
						this.World.getTemporaryRoster().clear();				
						Dude.onHired();	
						
						this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
						this.World.Statistics.getFlags().increment("ArenaFightsWon", 1);
						this.World.Statistics.getFlags().increment("ArenaRegularFightsWon", 1);
						this.World.Contracts.finishActiveContract();						
						return 0;
					}
				},
				{
					Text = "Medic",
					function getResult()
					{
						local temproster = this.World.getTemporaryRoster();
						local Dude = temproster.create("scripts/entity/tactical/player");
						Dude.setStartValuesEx(["cr_rogue_medic_background"]);
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_trait"));	
						Dude.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));
												
						this.World.getPlayerRoster().add(Dude);
						this.World.getTemporaryRoster().clear();				
						Dude.onHired();	
						
						this.Contract.getHome().getBuilding("building.arena").refreshCooldown();
						this.World.Statistics.getFlags().increment("ArenaFightsWon", 1);
						this.World.Statistics.getFlags().increment("ArenaRegularFightsWon", 1);
						this.World.Contracts.finishActiveContract();						
						return 0;
					}
				},
				{
					Text = "Previous Page",
					function getResult()
					{						
						return "Dude";
					}
				},				
			]			
		});		
	}

	function setScreenForArena()
	{
		if (!this.m.IsActive)
		{
			return;
		}
		if (this.World.getTime().Days > this.m.Flags.get("Day"))
		{
			this.setScreen("Failure2");
		}
		if (this.m.Flags.get("roguespecial"))
		{
			this.setScreen("ST");
		}		
		else
		{
			this.setScreen("Start");
		}
	}

	function prepareBroVariables( _maxNumBros, _vars )
	{
	}

	function onPrepareVariables( _vars )
	{
	}
	
    function addPerk (_Dude, _perk, _row = 0)
	{
		local bg =  _Dude.getBackground();;	
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

	function addPerkTreesToCustomPerkTree (_customPerkTree, _treesToAdd)
	{
		foreach (tree in _treesToAdd)
		{
			for (local i = 0; i < tree.Tree.len(); i++)
			{
				foreach (perk in tree.Tree[i])
				{
					_customPerkTree[i].push(perk);
				}
			}
		}
	}
		
	function onClear()
	{
		if (this.m.IsActive)
		{
			this.m.Home.getSprite("selection").Visible = false;
			this.m.Home.getBuilding("building.arena").refreshCooldown();
		}
	}

	function onSerialize( _out )
	{
		this.contract.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.contract.onDeserialize(_in);
	}

});

