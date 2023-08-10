local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.BanditRogueHard <- {
	Name = "BanditRogueHard",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_01",
	MinR = 500,
	MaxR = 1400,	
	Fixed = [
		{
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BanditLeader,
			Cost = 40,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 50,
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
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BanditLeader,
			Cost = 40,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40,
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
			MinR = 675,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Swordmaster,
			Cost = 50
		}
	],	
	crrrFixed = [
		{
			Weight = 100,
			MinR = 750,
			Type = this.Const.World.Spawn.Troops.BanditLeader,
			Cost = 40,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],	
	craFixed = [
		{
			Weight = 100,
			MinR = 825,
			Type = this.Const.World.Spawn.Troops.BanditWarlord,
			Cost = 70,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 30,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.crSlayer,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],
	crbFixed = [
		{
			Weight = 100,
			MinR = 900,
			Type = this.Const.World.Spawn.Troops.BanditLeader,
			Cost = 40,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Swordmaster,
					Cost = 50,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],		
	crcFixed = [
		{
			Weight = 100,
			MinR = 975,
			Type = this.Const.World.Spawn.Troops.MasterArcher,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 50,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.HedgeKnight,
					Cost = 30,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],
	crdFixed = [
		{
			MaxR = 750,
			MinCount = 4,
			MaxCount = 4,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BanditRaider,
			Cost = 20			
		}
	],	
	creFixed = [
		{
			MinCount = 2,
			MaxCount = 2,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.LegendPeasantMonk,
			Cost = 15			
		}
	],	
	Troops = [
		{
			Weight = 45,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditVeteran,
					MinR = 550,					
					Cost = 30
				}
			]
		},		
		{
			Weight = 15,
			MinR = 300,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSquireLow,
					Cost = 25,
					Roll = true
				}
			]
		},			
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 20
				}
			]
		},	
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.MasterArcher,
					Cost = 40,
					Roll = true
				}
			]
		},		
		{
			Weight = 3,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Wardog,
					Cost = 5
				}
			]
		},
		{
			Weight = 1,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSlayer,
					Cost = 50,
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

gt.Const.World.Spawn.BarbarianRogueHard <- {
	Name = "BarbarianRogueHard",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_wildman_01",
	MinR = 500,
	MaxR = 1400,
	craFixed = [
		{
			MinCount = 2,
			MaxCount = 2,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianBeastmaster,
			Cost = 20
		}
	],	
	crbFixed = [
		{
			MinCount = 2,
			MaxCount = 2,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianUnholdFrost,
			Cost = 70
		}
	],	
	Fixed = [
		{
			Weight = 100,		
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
			MinR = 700,
			MinCount = 2,
			MaxCount = 3,		
			Weight = 33,
			Type = this.Const.World.Spawn.Troops.crImmortal,
			Cost = 50			
		}
	],	
	crrFixed = [
		{
			MinR = 750,
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
	crrrFixed = [
		{
			MinR = 950,
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
	crcFixed = [
		{
			MaxR = 750,
			MinCount = 2,
			MaxCount = 2,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianMarauder,
			Cost = 25			
		}
	],	
	crdFixed = [
		{
			MaxR = 800,
			MinCount = 2,
			MaxCount = 2,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianMarauder,
			Cost = 25			
		}
	],	
	Troops = [
		{
			Weight = 50,
			Types = [					
				{
					Type = this.Const.World.Spawn.Troops.BarbarianChampion,
					Cost = 35
				},
				{
					MinR = 675,
					Type = this.Const.World.Spawn.Troops.crImmortal,
					Cost = 40
				}				
			]
		},		
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crBarbblacksmith,
					Cost = 25,
					Roll = true
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
					Cost = 40,
				}
			]
		},	
		{
			Weight = 6,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Direwolf
					Cost = 18,
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
		},
		{
			Weight = 5,
			MinR = 850,			
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crBarbarianChampionhigh,
					Cost = 70,
					Roll = true					
				}
			]
		}		
	]
};

gt.Const.World.Spawn.NomadRogueHard <- {
	Name = "NomadRogueHard",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_nomad_01",
	MinR = 500,	
	MaxR = 1400,	
	Fixed = [
		{
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.DesertStalker,
			Cost = 40,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Executioner,
					Cost = 50,
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
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.DesertDevil,
			Cost = 50,
			MinGuards = 3,
			MaxGuards = 3,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.NomadLeader,
					Cost = 40,
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
			Weight = 100,
			MinR = 675,
			Type = this.Const.World.Spawn.Troops.NomadLeader,
			Cost = 40,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.DesertStalker,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],
	crrrFixed = [
		{
			Weight = 100,
			MinR = 750,			
			Type = this.Const.World.Spawn.Troops.DesertDevil,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.NomadLeader,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}	
	],	
	craFixed = [
		{
			Weight = 100,
			MinR = 825,
			Type = this.Const.World.Spawn.Troops.Executioner,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.DesertStalker,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],
	crbFixed = [
		{
			Weight = 100,
			MinR = 900,			
			Type = this.Const.World.Spawn.Troops.DesertDevil,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.NomadLeader,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],
	crcFixed = [
		{
			Weight = 100,
			MinR = 975,			
			Type = this.Const.World.Spawn.Troops.Executioner,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.DesertStalker,
					Cost = 40,
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
			Weight = 75,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crNomadScavenger,					
					Cost = 27
				}				
			]
		},		
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.NomadArcher,
					MinR = 225,
					Cost = 18
				}
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.DesertStalker,					
					Cost = 45,
					Roll = true					
				}				
			]
		},		
	]
};

gt.Const.World.Spawn.ZombieRogueHard <- {
	Name = "ZombieRogueHard",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 1400,
	MinR = 500,	
	Fixed = [
		{
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.Necromancer,
			Cost = 40,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
					Cost = 25,
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
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.Necromancer,
			Cost = 40,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.crFallenbetrayer,
					Cost = 50,
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
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.crZombieswordmaster,
			Cost = 50
		}
	],			
	crrrFixed = [
		{
			MinR = 750,
			Weight = 100,			
			Type = this.Const.World.Spawn.Troops.crFallenbetrayer,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],
	craFixed = [
		{
			MinR = 750,		
			Weight = 100,			
			Type = this.Const.World.Spawn.Troops.Necromancer,
			Cost = 40,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
					Cost = 25,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],	
	crbFixed = [
		{
			MinR = 800,		
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.crZombieswordmaster,
			Cost = 50
		}
	],
	crcFixed = [
		{
			MinR = 850,		
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.crDeathknight,
			Cost = 70
		}
	],	
	crdFixed = [
		{
			MinR = 900,
			Weight = 100,			
			Type = this.Const.World.Spawn.Troops.crZombieswordmaster,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Ghost,
					Cost = 20,
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
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					Cost = 15
				}
			]
		},
		{		
			Weight = 60,		
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,				
					Cost = 30
				}
			]
		},
		{		
			Weight = 10,		
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crFallenbetrayer,
					MinR = 750,					
					Cost = 45
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

gt.Const.World.Spawn.UndeadRogueHard <- {
	Name = "UndeadRogueHard",
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_skeleton_01",
	MaxR = 1400,
	MinR = 500,	
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.SkeletonPriest,
			Cost = 30,
			MinGuards = 3,
			MaxGuards = 3,
			MaxGuardsWeight = 33,
			Weight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavyBodyguard,
					Cost = 30,
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
			MaxR = 895,
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.VampireLOW,
			Cost = 40,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					Cost = 30,
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
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.Vampire,
			Cost = 40,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonGladiator,
					Cost = 35,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],		
	crrrFixed = [
		{
			Weight = 100,
			MinR = 675,			
			Type = this.Const.World.Spawn.Troops.Vampire,
			Cost = 40
		}
	],	
	craFixed = [
		{
			Weight = 100,
			MinR = 750,
			Type = this.Const.World.Spawn.Troops.LegendVampireLord,
			Cost = 70,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonGladiator,
					Cost = 35,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],
	crbFixed = [
		{
			Weight = 100,
			MinR = 800,
			Type = this.Const.World.Spawn.Troops.Vampire,
			Cost = 40,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					Cost = 30,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],	
	crcFixed = [
		{
			Weight = 100,
			MinR = 850,
			Type = this.Const.World.Spawn.Troops.SkeletonGladiator,
			Cost = 35,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					Cost = 30,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],
	crdFixed = [
		{
			MinR = 900,
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.LegendVampireLord,
			Cost = 70,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendDemonHound,
					Cost = 30,
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
			Weight = 45,
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
					MinR = 650,
					Cost = 50
				}				
			]
		},	
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton,
					MinR = 725,
					Cost = 50
				}				
			]
		},	
		{
			Weight = 8,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton,
					MinR = 800,
					Cost = 50
				}				
			]
		},	
		{
			Weight = 7,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton,
					MinR = 875,
					Cost = 50
				}				
			]
		},		
		{
			Weight = 30,
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
					MinR = 650,
					Cost = 50
				}				
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton_pol,
					MinR = 725,
					Cost = 50
				}				
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton_pol,
					MinR = 800,
					Cost = 50
				}				
			]
		},
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton_pol,
					MinR = 875,
					Cost = 50
				}				
			]
		}		
	]
};

gt.Const.World.Spawn.OrcRogueHard <-
{
	Name = "OrcRogueHard",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	MaxR = 1400,
	MinR = 500,
	Fixed = [
		{
			Weight = 100
			Type = this.Const.World.Spawn.Troops.crOrcPackleader,
			Cost = 60,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
					Cost = 60,
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
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.crOrcPackleader,
			Cost = 60,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 60,
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
			Weight = 100,
			MinR = 675,			
			Type = this.Const.World.Spawn.Troops.crOrcPackleader,
			Cost = 60
		}
	],	
	crrrFixed = [
		{
			Weight = 100,
			MinR = 725,			
			Type = this.Const.World.Spawn.Troops.LegendOrcElite,
			Cost = 60
		}
	],	
	craFixed = [
		{
			Weight = 100,
			MinR = 800,			
			Type = this.Const.World.Spawn.Troops.OrcWarlord,
			Cost = 60
		}
	],	
	crbFixed = [
		{
			Weight = 100,
			MinR = 875,			
			Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
			Cost = 60
		}
	],	
	crcFixed = [
		{
			Weight = 100,
			MinR = 950,				
			Type = this.Const.World.Spawn.Troops.crOrcPackleader,
			Cost = 60,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 60,
					function Weight( scale )
					{
						return 100;
					}
				}				
			]			
		}
	],	
	crdFixed = [
		{
			MinCount = 3,
			MaxCount = 3,		
			MaxR = 800,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.OrcBerserker,
			Cost = 35
		}
	],				
	Troops = [
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 18
				}
			]
		},	
		{
			Weight = 15,
			MaxR = 750,
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
			Weight = 30,
			Types = [		
				{			
					Type = this.Const.World.Spawn.Troops.OrcWarrior,				
					Cost = 35
				}
			]
		},		
		{
			Weight = 15,
			MinR = 800,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crOrcVanguard,
					Cost = 40
				}
			]
		}		
	]
};

gt.Const.World.Spawn.GoblinRogueHard <- {
	Name = "GoblinRogueHard",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_goblin_04",
	MinR = 500,
	MaxR = 1400,
	Fixed = [
		{
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinOverseer,
			Cost = 50,
			MinGuards = 3,
			MaxGuards = 3,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40,
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
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinOverseer,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinShaman,
					Cost = 50,
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
			MinR = 700,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinShaman,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],
	crrrFixed = [
		{
			MinR = 775,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinOverseer,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],	
	craFixed = [
		{
			MinR = 850,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinOverseer,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],	
	craFixed = [
		{
			MinR = 925,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinOverseer,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinShaman,
					Cost = 50,
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
			Weight = 55,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.GoblinSkirmisher,
					Cost = 25
				}
			]
		},
		{
			Weight = 25,
			Types = [			
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,				
					Cost = 30
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crGoblinwarrior,
					Cost = 30
				}
			]
		}		
	]
};

gt.Const.World.Spawn.NobleRogueHard <- {
	Name = "NobleRogueHard",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_noble_01",
	MinR = 500,
	MaxR = 1400,
	Fixed = [
		{
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.crSquire,
			Cost = 30
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Sergeant,
					Cost = 40,
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
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Knight,
			Cost = 50,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.StandardBearer,
					Cost = 30,
					function Weight( scale )
					{
						return 100;
					}
				},
			]			
		}
	],
	crrFixed = [
		{
			MinR = 675,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.LegendFencer,
			Cost = 40,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendHalberdier,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],
	crrrFixed = [
		{
			MinR = 725,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Knight,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
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
	],
	craFixed = [
		{
			Weight = 100,
			MinR = 775,			
			MinCount = 2,
			MaxCount = 2,		
			Type = this.Const.World.Spawn.Troops.LegendHalberdier,
			Cost = 40
		}
	],	
	crbFixed = [
		{
			MinR = 825,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.StandardBearer,
			Cost = 30
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Sergeant,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],		
	crcFixed = [
		{
			MinR = 875,			
			Weight = 100,		
			MinCount = 3,
			MaxCount = 3,		
			Type = this.Const.World.Spawn.Troops.crInfantry,
			Cost = 30
		}
	],	
	crdFixed = [
		{
			MinR = 925,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.crHonoraryknight,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
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
	],	
	Troops = [
		{
			Weight = 45,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Footman,
					Cost = 25
				}
			]
		},
		{
			Weight = 25,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Billman,
					Cost = 25
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
					Type = this.Const.World.Spawn.Troops.ArmoredWardog,
					Cost = 5
				}
			]
		},		
	]
};

gt.Const.World.Spawn.CityRogueHard <- {
	Name = "CityRogueHard",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_southern_01",
	MinR = 500,
	MaxR = 1400,
	Fixed = [
		{
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Officer,
			Cost = 40
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Gunner,
					Cost = 40,
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
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Officer,
			Cost = 40
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Assassin,
					Cost = 40,
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
			MinR = 675,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Officer,
			Cost = 40			
		}
	],	
	crrrFixed = [
		{
			MinR = 725,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Officer,
			Cost = 40
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Gunner,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],
	craFixed = [
		{
			Weight = 100,
			MinR = 775,			
			MinCount = 2,
			MaxCount = 2,		
			Type = this.Const.World.Spawn.Troops.crGuardsman_pol,
			Cost = 35
		}
	],		
	crbFixed = [
		{
			MinR = 825,		
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Officer,
			Cost = 40
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Assassin,
					Cost = 40,
					function Weight( scale )
					{
						return 100;
					}
				}
			]			
		}
	],
	crcFixed = [
		{
			Weight = 100,
			MinR = 875,			
			MinCount = 3,
			MaxCount = 3,		
			Type = this.Const.World.Spawn.Troops.crGuardsman,
			Cost = 35
		}
	],
	crdFixed = [
		{
			MinR = 925,			
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.Officer,
			Cost = 40
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.Gunner,
					Cost = 40,
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
			Weight = 50,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Conscript,
					Cost = 24
				}
			]
		},
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ConscriptPolearm,
					Cost = 27
				}
			]
		},
		{
			Weight = 10,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crConscript,
					Cost = 21
				}
			]
		},
		{
			Weight = 15,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.Solemner,
					Cost = 33
				}
			]
		},		
	]
};

