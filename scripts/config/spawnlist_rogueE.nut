local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.BanditRogueEnd <- {
	Name = "BanditRogueEnd",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_01",
	MinR = 900,
	MaxR = 2000,	
	Fixed = [
		{
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BanditWarlord,
			Cost = 40
		}
	],	
	crFixed = [
		{
			MinCount = 3,
			MaxCount = 3,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.LegendPeasantMonk,
			Cost = 10			
		}
	],		
	Troops = [
		{
			Weight = 35,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditVeteran,					
					Cost = 30
				}
			]
		},		
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSquireLow,
					Cost = 25,
				}
			]
		},
		{
			Weight = 7,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditLeader,
					Cost = 40,
				}
			]
		},
		{
			Weight = 6,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 50,
				}
			]
		},	
		{
			Weight = 6,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Swordmaster,
					Cost = 50,
				}
			]
		},			
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 20
				}
			]
		},	
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40,
				}
			]
		},		
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSlayer,
					Cost = 40,
					Roll = true
				}
			]
		},		
		{
			Weight = 10,
			MinR = 200,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crPeasantbutcher,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.crPeasantminstrel,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendPeasantWoodsman,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendPeasantMiner,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.crPeasantgravedigger,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.crPeasantherbalist,
					MinR = 300,						
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.crPeasantblacksmith,
					MinR = 350,					
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendPeasantPoacher,
					MinR = 300,					
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendPeasantWitchHunter,
					MinR = 400,					
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.crPeasantjuggler,
					MinR = 300,					
					Cost = 20
				},	
				{
					Type = this.Const.World.Spawn.Troops.crOutlander,
					MinR = 400,					
					Cost = 20
				},					
				{
					Type = this.Const.World.Spawn.Troops.crPeasantkiller,
					Cost = 20
				},					
				{
					Type = this.Const.World.Spawn.Troops.LegendPeasantFarmhand,
					Cost = 20
				}
			]
		}		
	]
};

gt.Const.World.Spawn.BarbarianRogueEnd <- {
	Name = "BarbarianRogueEnd",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_wildman_01",
	MinR = 900,
	MaxR = 2000,
	craFixed = [
		{
			MinCount = 3,
			MaxCount = 3,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianBeastmaster,
			Cost = 20
		}
	],	
	crbFixed = [
		{
			MinCount = 4,
			MaxCount = 4,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianUnholdFrost,
			Cost = 70
		}
	],	
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.crBarbarianKing,
			Cost = 40,
			MinGuards = 2,
			MaxGuards = 3,
			MaxGuardsWeight = 75,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianDrummer,
					Cost = 20,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],		
	crFixed = [
		{
			MinR = 1050,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianBeastmaster,
			Cost = 20,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianUnholdFrost,
					Cost = 70,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],	
	crrFixed = [
		{
			MinR = 1250,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianBeastmaster,
			Cost = 20,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianUnholdFrost,
					Cost = 70,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],
	Troops = [
		{
			Weight = 40,
			Types = [					
				{
					Type = this.Const.World.Spawn.Troops.BarbarianChampion,
					Cost = 35,
				}				
			]
		},
		{
			Weight = 25,		
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crImmortal,
					Cost = 40,					
				}
			]
		}		
		{
			Weight = 5,		
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crBarbarianChampionhigh,
					Cost = 70,
					Roll = true					
				}
			]
		}		
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crBarbblacksmith,
					Cost = 25,
				}
			]
		},			
		{
			Weight = 15,
			Types = [			
				{
					Type = this.Const.World.Spawn.Troops.BarbarianKuangzhanshi,
					Cost = 40
				}
			]
		},
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSlayer,
					Cost = 35,
				}
			]
		},	
		{
			Weight = 6,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Direwolf
					Cost = 15,
				}
			]
		},			
		{
			Weight = 3,
			Types = [
				{				
					Type = this.Const.World.Spawn.Troops.LegendBear,
					Cost = 35
				}				
			]
		}		
	]
};

gt.Const.World.Spawn.NomadRogueEnd <- {
	Name = "NomadRogueEnd",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_nomad_01",
	MinR = 900,	
	MaxR = 2000,	
	Troops = [
		{
			Weight = 35,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crNomadScavenger,					
					Cost = 27
				}				
			]
		},	
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.NomadLeader,					
					Cost = 40
				}				
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Executioner,					
					Cost = 50
				}				
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.DesertDevil,					
					Cost = 50
				}				
			]
		},		
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.NomadArcher,
					Cost = 18
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.DesertStalker,					
					Cost = 40,				
				}				
			]
		},		
	]
};

gt.Const.World.Spawn.ZombieRogueEnd <- {
	Name = "ZombieRogueEnd",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 2000,
	MinR = 900,	
	Fixed = [
		{
			MinCount = 3,
			MaxCount = 3,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Necromancer,
			Cost = 40			
		}
	],
	crFixed = [
		{
			MinCount = 3,
			MaxCount = 3,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
			Cost = 25			
		}
	],	
	Troops = [
		{		
			Weight = 55,		
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,				
					Cost = 30
				}
			]
		},
		{		
			Weight = 20,		
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crFallenbetrayer,				
					Cost = 45
				}
			]
		},	
		{		
			Weight = 10,		
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crZombieswordmaster,				
					Cost = 45
				}
			]
		},
		{		
			Weight = 5,		
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crDeathknight,				
					Cost = 45,
					Roll = true,
				}
			]
		},		
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20
				}
			]
		}	
	]
};

gt.Const.World.Spawn.UndeadRogueEnd <- {
	Name = "UndeadRogueEnd",
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_skeleton_01",
	MaxR = 2000,
	MinR = 900,	
	Fixed = [
		{
			MinCount = 2,
			MaxCount = 2,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.SkeletonPriest,
			Cost = 30			
		}
	],
	Troops = [
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavy,				
					Cost = 35
				}				
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton,
					Cost = 50
				}				
			]
		},	
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavyPolearm,
					Cost = 35
				}				
			]
		},		
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton_pol,
					Cost = 50
				}				
			]
		},	
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonGladiator,
					Cost = 35
				}				
			]
		},		
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					Cost = 30
				}				
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendVampireLord,
					Cost = 70,
					Roll =true,
				}				
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Vampire,
					Cost = 40
				}				
			]
		},		
	]
};

gt.Const.World.Spawn.OrcRogueEnd <-
{
	Name = "OrcRogueEnd",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	MaxR = 2000,
	MinR = 900,
	Fixed = [
		{
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.OrcWarlord,
			Cost = 60
		}
	],
	Troops = [
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 18
				}
			]
		},		
		{
			Weight = 15,		
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crOrcGrunt,
					Cost = 22
				}
			]
		},		
		{
			Weight = 35,
			Types = [		
				{			
					Type = this.Const.World.Spawn.Troops.OrcWarrior,				
					Cost = 35
				}
			]
		},		
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crOrcVanguard,
					Cost = 45
				}
			]
		},
		{
			Weight = 12,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crOrcPackleader,
					Cost = 60
				}
			]
		},
		{
			Weight = 8,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 60
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
					Cost = 60
				}
			]
		}		
	]
};

gt.Const.World.Spawn.GoblinRogueEnd <- {
	Name = "GoblinRogueEnd",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_goblin_04",
	MinR = 900,
	MaxR = 2000,
	Fixed = [
		{
			MinCount = 2,
			MaxCount = 2,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinShaman,
			Cost = 50
		}
	],
	crFixed = [
		{
			MinR = 1050,		
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.GoblinShaman,
			Cost = 50
		}
	],	
	Troops = [
		{
			Weight = 30,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisher,
					Cost = 25
				}
			]
		},
		{
			Weight = 20,
			Types = [			
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,				
					Cost = 30
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crGoblinwarrior,
					Cost = 30
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinOverseer,
					Cost = 50
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40
				}
			]
		},		
	]
};

gt.Const.World.Spawn.NobleRogueEnd <- {
	Name = "NobleRogueEnd",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_noble_01",
	MinR = 900,
	MaxR = 2000,
	Fixed = [
		{
			MinCount = 3,
			MaxCount = 3,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.StandardBearer,
			Cost = 30
		}
	],
	Troops = [
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Footman,
					Cost = 25
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crInfantry,
					Cost = 30
				}
			]
		},		
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Billman,
					Cost = 25
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendHalberdier,
					Cost = 35
				}
			]
		},		
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Arbalester,
					Cost = 30
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Greatsword,
					Cost = 30
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendFencer,
					Cost = 40
				}
			]
		},	
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Knight,
					Cost = 60,
					Roll = true
					MinGuards = 1,
					MaxGuards = 1,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.crSquire,
							Cost = 30,
							function Weight( scale )
							{
								local c = 100 - scale * 100;
								return this.Math.max(80, c);
							}

						},
						{
							Type = this.Const.World.Spawn.Troops.crSquireFencer,
							Cost = 30,
							function Weight( scale )
							{
								local c = 100 - (1.0 - scale) * 100;
								return this.Math.min(20, c);
							}

						}
					]
				}				
			]
		},	
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crHonoraryknight,
					Cost = 60,
					Roll = true,
					MinGuards = 1,
					MaxGuards = 1,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.crSquire,
							Cost = 30,
							function Weight( scale )
							{
								local c = 100 - scale * 100;
								return this.Math.max(50, c);
							}

						},
						{
							Type = this.Const.World.Spawn.Troops.crSquireFencer,
							Cost = 30,
							function Weight( scale )
							{
								local c = 100 - (1.0 - scale) * 100;
								return this.Math.min(50, c);
							}

						}						
					]
				}				
			]
		},				
	]
};

gt.Const.World.Spawn.CityRogueEnd <- {
	Name = "CityRogueEnd",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_southern_01",
	MinR = 900,
	MaxR = 2000,
	Troops = [
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Conscript,				
					Cost = 24
				}		
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crGuardsman, 			
					Cost = 30
				}				
			]
		},		
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ConscriptPolearm, 			
					Cost = 24
				}				
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crGuardsman_pol,
					Cost = 30
				}
			]
		},		
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Gunner,
					Cost = 35
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crConscript,
					Cost = 20
				}
			]
		},		
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Solemner,
					Cost = 35
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Officer,
					Cost = 40
				}
			]
		},	
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Assassin,
					Cost = 40
				}
			]
		}					
	]
};

