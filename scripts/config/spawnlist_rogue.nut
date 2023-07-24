local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.BanditRogue <- {
	Name = "BanditRogue",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_bandit_01",
	MinR = 50,
	MaxR = 900,	
	Fixed = [
		{
			MinR = 175,		
			Type = this.Const.World.Spawn.Troops.crSquireLow,
			Weight = 100,
			Cost = 25
		}
	],
	craFixed = [
		{
			MinR = 225,		
			Type = this.Const.World.Spawn.Troops.crSquireLow,
			Weight = 100,
			Cost = 25
		}
	],	
	crFixed = [
		{
			MinR = 300,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BanditLeader,
			Cost = 40,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.LegendPeasantMonk,
					Cost = 20,
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
			MinR = 375,
			Type = this.Const.World.Spawn.Troops.BanditLeader,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 30,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.crSquireLow,
					Cost = 30,
					function Weight( scale )
					{
						return 100;
					}
				}
			]
		}
	],	
	creFixed = [
		{
			MinR = 400,		
			Type = this.Const.World.Spawn.Troops.LegendPeasantMonk,
			Weight = 100,
			Cost = 20
		}
	],	
	crrrFixed = [
		{
			Weight = 100,
			MinR = 450,
			Type = this.Const.World.Spawn.Troops.HedgeKnight,
			Cost = 50,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 30,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.crSquireLow,
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
			MinR = 500,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.MasterArcher,
			Cost = 60,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 30,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.BanditVeteran,
					Cost = 30,
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
			MinR = 600,
			Type = this.Const.World.Spawn.Troops.HedgeKnight,
			Cost = 60,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 30,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.BanditVeteran,
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
					Type = this.Const.World.Spawn.Troops.BanditThug,
					MaxR = 200,					
					Cost = 10
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaiderLOW,
					Cost = 16
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditRaider,
					MinR = 200,
					Cost = 20
				},
				{
					Type = this.Const.World.Spawn.Troops.BanditVeteran,
					MinR = 550,					
					Cost = 30
				}
			]
		},		
		{
			Weight = 10,
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
					Type = this.Const.World.Spawn.Troops.BanditMarksmanLOW,
					MaxR = 300,					
					Cost = 10
				},
				{
					MinR = 250,
					Type = this.Const.World.Spawn.Troops.BanditMarksman,
					Cost = 20
				},
				{
					MinR = 600,
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
			MinR = 500,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSlayer,
					Cost = 50,
					Roll = true
				}
			]
		},		
		{
			Weight = 15,
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

gt.Const.World.Spawn.BarbarianRogue <- {
	Name = "BarbarianRogue",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_wildman_01",
	MinR = 150,
	MaxR = 900,
	craFixed = [
		{
			MinCount = 2,
			MaxCount = 2,		
			MaxR = 500,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianMarauder,
			Cost = 25
		}
	],		
	Fixed = [
		{
			MinR = 300,
			MinCount = 1,
			MaxCount = 2,
			Weight = 70,
			Type = this.Const.World.Spawn.Troops.BarbarianDrummer,
			Cost = 20
		}
	],
	crFixed = [
		{
			MinR = 400,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianChampion,
			Cost = 30
		}
	],		
	crrFixed = [
		{
			MinR = 475,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.crBarbarianKing,
			Cost = 40,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianChampion,
					Cost = 30,
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
			MinR = 525,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianBeastmaster,
			Cost = 15,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianUnhold,
					Cost = 50,
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
			MinR = 600,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.BarbarianBeastmaster,
			Cost = 15,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianUnholdFrost,
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
			Weight = 50,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianThrall,
					MaxR = 400,					
					Cost = 15
				},
				{
					MinR = 225,
					Type = this.Const.World.Spawn.Troops.BarbarianMarauder,
					Cost = 25
				},				
				{
					MinR = 500,
					Type = this.Const.World.Spawn.Troops.BarbarianChampion,
					Cost = 40
				},
				{
					MinR = 675,
					Type = this.Const.World.Spawn.Troops.crImmortal,
					Cost = 45
				}				
			]
		},		
		{
			Weight = 5,
			MinR = 350,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crBarbblacksmith,
					Cost = 30,
					Roll = true
				}
			]
		},	
		{
			Weight = 15,
			Types = [
				{
					MinR = 300,
					Type = this.Const.World.Spawn.Troops.BarbarianKuangzhanshi02,
					Cost = 28
				},				
				{
					MinR = 600,
					Type = this.Const.World.Spawn.Troops.BarbarianKuangzhanshi,
					Cost = 40
				}
			]
		},
		{
			Weight = 1,
			MinR = 400,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crSlayer,
					Cost = 50,
					Roll = true
				}
			]
		},		
		{
			Weight = 7,
			Types = [
				{
					MaxR = 350,				
					Type = this.Const.World.Spawn.Troops.Warhound,
					Cost = 10
				},
				{
					MinR = 250,					
					Type = this.Const.World.Spawn.Troops.Direwolf,
					Cost = 20
				},
				{
					MinR = 600,					
					Type = this.Const.World.Spawn.Troops.LegendBear,
					Cost = 40
				}				
			]
		},
		{
			Weight = 10,
			MinR = 750,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.BarbarianBeastmaster,
					Cost = 15,
					MinGuards = 1,
					MaxGuards = 2,
					MaxGuardsWeight = 50,
					Guards = [
						{
							Type = this.Const.World.Spawn.Troops.BarbarianUnhold,
							Cost = 50,
							function Weight( scale )
							{
								local c = 100 - scale * 100;
								return this.Math.max(20, c);
							}

						},
						{
							Type = this.Const.World.Spawn.Troops.BarbarianUnholdFrost,
							Cost = 70,
							function Weight( scale )
							{
								local c = 100 - (1.0 - scale) * 100;
								return this.Math.min(80, c);
							}

						}
					]
				}
			]
		},
		{
			Weight = 5,
			MinR = 850,			
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crBarbarianChampionhigh,
					Cost = 60
				}
			]
		}		
	]
};

gt.Const.World.Spawn.NomadRogue <- {
	Name = "NomadRogue",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_nomad_01",
	MinR = 150,	
	MaxR = 900,	
	craFixed = [
		{
			MinCount = 2,
			MaxCount = 2,		
			MaxR = 350,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.NomadOutlaw,
			Cost = 22
		}
	],	
	Fixed = [
		{
			Weight = 100,
			MinR = 300,
			Type = this.Const.World.Spawn.Troops.NomadLeader,
			Cost = 40
		}
	],
	crFixed = [
		{
			Weight = 100,
			MinR = 350,
			Type = this.Const.World.Spawn.Troops.NomadLeader,
			Cost = 40
		}
	],
	crrFixed = [
		{
			Weight = 100,
			MinR = 425,
			Type = this.Const.World.Spawn.Troops.Executioner,
			Cost = 50
		}
	],	
	crrrFixed = [
		{
			Weight = 100,
			MinR = 500,
			Type = this.Const.World.Spawn.Troops.DesertDevil,
			Cost = 50
		}
	],
	crcFixed = [
		{
			Weight = 100,
			MinR = 575,
			Type = this.Const.World.Spawn.Troops.Executioner,
			Cost = 50
		}
	],
	crbFixed = [
		{
			Weight = 750,
			MinR = 625,
			Type = this.Const.World.Spawn.Troops.NomadLeader,
			Cost = 50
		}
	],	
	Troops = [
		{
			Weight = 45,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.NomadCutthroat,
					MaxR = 400,					
					Cost = 15
				},
				{
					Type = this.Const.World.Spawn.Troops.NomadOutlaw,				
					Cost = 22
				},
				{
					Type = this.Const.World.Spawn.Troops.crNomadScavenger,	
					MinR = 400,					
					Cost = 27
				}				
			]
		},	
		{
			Weight = 25,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.NomadOutlaw,				
					Cost = 22
				},
				{
					Type = this.Const.World.Spawn.Troops.crNomadScavenger,	
					MinR = 400,					
					Cost = 27
				}				
			]
		},		
		{
			Weight = 20,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.NomadSlinger,
					Cost = 12
				},
				{
					Type = this.Const.World.Spawn.Troops.NomadArcher,
					MinR = 225,
					Cost = 18
				},
				{
					Type = this.Const.World.Spawn.Troops.DesertStalker,
					MinR = 450,
					Cost = 45,
					Roll = true
				}
			]
		}
	]
};

gt.Const.World.Spawn.ZombieRogue <- {
	Name = "ZombieRogue",
	IsDynamic = true,
	MovementSpeedMult = 0.8,
	VisibilityMult = 1.0,
	VisionMult = 0.8,
	Body = "figure_zombie_01",
	MaxR = 900,
	MinR = 250,
	craFixed = [
		{
			MinCount = 2,
			MaxCount = 2,
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.ZombieKnight,
			Cost = 30
		}
	],	
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.Necromancer,
			Cost = 40,
			MinGuards = 1,
			MaxGuards = 2,
			MaxGuardsWeight = 25,
			Weight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
					MinR = 100,
					Cost = 15,
					function Weight( scale )
					{
						local c = 100 - scale * 100;
						return this.Math.max(0, c);
					}
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
					MinR = 300,
					Cost = 30,
					function Weight( scale )
					{
						local c = 100 - (1.0 - scale) * 100;
						return this.Math.min(100, c);
					}
				}
			]
		}
	],
	crFixed = [
		{
			MinR = 425,			
			MinCount = 2,
			MaxCount = 2,
			Weight = 100,		
			Type = this.Const.World.Spawn.Troops.ZombieKnight,
			Cost = 35
		}
	],		
	crrFixed = [
		{
			MinR = 500,
			Weight = 100,			
			Type = this.Const.World.Spawn.Troops.Necromancer,
			Cost = 40,
			MinGuards = 1,
			MaxGuards = 2,
			MaxGuardsWeight = 25,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
					MinR = 100,
					Cost = 15,
					function Weight( scale )
					{
						local c = 100 - scale * 100;
						return this.Math.max(0, c);
					}
				},
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnightBodyguard,
					MinR = 300,
					Cost = 30,
					function Weight( scale )
					{
						local c = 100 - (1.0 - scale) * 100;
						return this.Math.min(100, c);
					}
				}
			]
		}
	],	
	crrrFixed = [
		{
			MinR = 550,
			Weight = 100,			
			Type = this.Const.World.Spawn.Troops.crFallenbetrayer,
			Cost = 50,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					MinR = 300,
					Cost = 30,
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
			MinR = 625,
			Weight = 100,			
			Type = this.Const.World.Spawn.Troops.crFallenbetrayer,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.crZombieswordmaster,
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
			Weight = 75,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieYeoman,
					MaxR = 650,
					Cost = 15
				}
			]
		},
		{		
			Weight = 15,
			MinR = 350,			
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.ZombieKnight,
					MinR = 400,					
					Cost = 35
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

gt.Const.World.Spawn.UndeadRogue <- {
	Name = "UndeadRogue",
	IsDynamic = true,
	MovementSpeedMult = 0.9,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_skeleton_01",
	MaxR = 900,
	MinR = 250,
	craFixed = [
		{
			Weight = 100,
			MaxR = 400,			
			MinCount = 2,
			MaxCount = 2,		
			Type = this.Const.World.Spawn.Troops.SkeletonMedium,
			Cost = 25
		}
	],		
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.SkeletonPriest,
			Cost = 30,
			MinGuards = 1,
			MaxGuards = 2,
			MaxGuardsWeight = 33,
			MinR = 400,
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
			Type = this.Const.World.Spawn.Troops.SkeletonHeavy,
			Cost = 35,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			MinR = 400,
			Weight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavyPolearm,
					Cost = 35,
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
			MinCount = 2,
			MaxCount = 2,
			Weight = 100,
			MinR = 450,			
			Type = this.Const.World.Spawn.Troops.VampireLOW,
			Cost = 40
		}
	],	
	crrrFixed = [
		{
			MinCount = 2,
			MaxCount = 2,
			Weight = 100,
			MinR = 525,			
			Type = this.Const.World.Spawn.Troops.LegendDemonHound,
			Cost = 30
		}
	],
	craFixed = [
		{
			MinCount = 2,
			MaxCount = 2,
			Weight = 100,
			MinR = 575,			
			Type = this.Const.World.Spawn.Troops.SkeletonGladiator,
			Cost = 35
		}
	],	
	craFixed = [
		{
			MinCount = 1,
			MaxCount = 1,
			Weight = 100,
			MinR = 625,			
			Type = this.Const.World.Spawn.Troops.Vampire,
			Cost = 40
		}
	],		
	Troops = [
		{
			Weight = 50,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonLight,
					MaxR = 400,					
					Cost = 13
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMedium,
					MinR = 350,					
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavy,
					MinR = 475,
					Cost = 35
				},
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton,
					MinR = 650,
					Cost = 50
				}				
			]
		},
		{
			Weight = 35,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.SkeletonMediumPolearm,
					Cost = 25
				},
				{
					Type = this.Const.World.Spawn.Troops.SkeletonHeavyPolearm,
					MinR = 500,
					Cost = 40
				},
				{
					Type = this.Const.World.Spawn.Troops.crSkeleton_pol,
					MinR = 650,
					Cost = 50
				}				
			]
		}
	]
};

gt.Const.World.Spawn.OrcRogue <-
{
	Name = "OrcRogue",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_orc_01",
	MaxR = 900,
	MinR = 350,
	Fixed = [
		{
			Weight = 100
			Type = this.Const.World.Spawn.Troops.crOrcPackleader,
			Cost = 80,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 35,
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
			MinCount = 2,
			MaxCount = 2,		
			MaxR = 525,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
			Cost = 35
		}
	],		
	crFixed = [
		{
			Weight = 100,
			MinR = 475,
			Type = this.Const.World.Spawn.Troops.crOrcPackleader,
			Cost = 60,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 50,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 35,
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
			MinR = 550,
			Type = this.Const.World.Spawn.Troops.LegendOrcElite,
			Cost = 60,
			MinGuards = 2,
			MaxGuards = 2,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarrior,
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
			MinR = 600,			
			Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
			Cost = 60
		}
	],	
	crbFixed = [
		{
			Weight = 100,
			MinR = 650,
			Type = this.Const.World.Spawn.Troops.crOrcPackleader,
			Cost = 50,
			MinGuards = 1,
			MaxGuards = 1,
			MaxGuardsWeight = 100,
			Guards = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 35,
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
			Weight = 30,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcYoung,
					Cost = 20
				}
			]
		},		
		{
			Weight = 30,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,					
					Cost = 35
				},			
				{			
					Type = this.Const.World.Spawn.Troops.OrcWarrior,
					MinR = 500,						
					Cost = 35
				}
			]
		},		
		{
			Weight = 5,
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.OrcBerserker,
					Cost = 35
				}
			]
		},
		{
			Weight = 15,
			MinR = 500,			
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crOrcGrunt,
					Cost = 22
				}
			]
		},
		{
			Weight = 10,
			MinR = 650,			
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.crOrcVanguard,
					Cost = 45
				}
			]
		},
		{
			Weight = 5,
			MinR = 800,				
			Types = [
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
					Cost = 60,
				},
				{
					Type = this.Const.World.Spawn.Troops.LegendOrcElite,
					Cost = 60,
				}				
			]
		},		
	]
};

gt.Const.World.Spawn.GoblinRogue <- {
	Name = "GoblinRogue",
	IsDynamic = true,
	MovementSpeedMult = 1.0,
	VisibilityMult = 1.0,
	VisionMult = 1.0,
	Body = "figure_goblin_04",
	MinR = 350,
	MaxR = 900,
	Fixed = [
		{
			Type = this.Const.World.Spawn.Troops.GoblinOverseer,
			Weight = 100,
			Cost = 50
		}
	],
	crFixed = [
		{
			MinR = 500,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinShaman,
			Cost = 50
		}
	],
	crrFixed = [
		{
			MinR = 550,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinOverseer,
			Cost = 50,
			MinGuards = 2,
			MaxGuards = 2,
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
			MinR = 625,
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
			MinR = 750,
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
	crbFixed = [
		{
			MinR = 825,
			Weight = 100,
			Type = this.Const.World.Spawn.Troops.GoblinOverseer,
			Cost = 50
			MinGuards = 2,
			MaxGuards = 2,
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
					Type = this.Const.World.Spawn.Troops.GoblinAmbusherLOW,
					Cost = 20
				},			
				{
					Type = this.Const.World.Spawn.Troops.GoblinAmbusher,
					MinR = 500,					
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