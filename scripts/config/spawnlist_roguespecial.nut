local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Spawn" in gt.Const.World))
{
	gt.Const.World.Spawn <- {};
}

gt.Const.World.Spawn.RogueSpecialIchi <- [
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.BanditRaiderWolf,
				Num = 10
			}
		]
	}
];

gt.Const.World.Spawn.RogueSpecialNi <- [
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.crSlaveowner,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.crWarden,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.crManhunter,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.crAbjectgladiator02,
				Num = 5
			},			
			{
				Type = this.Const.World.Spawn.Troops.crAbjectfighter,
				Num = 5
			}			
		]
	}
];

gt.Const.World.Spawn.RogueSpecialSann <- [
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.crBarbarianKing,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.BarbarianDrummer,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.BarbarianChampion,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.BarbarianKuangzhanshi02,
				Num = 2
			},			
			{
				Type = this.Const.World.Spawn.Troops.BarbarianMarauder,
				Num = 8
			},			
			{
				Type = this.Const.World.Spawn.Troops.BarbarianThrall,
				Num = 6
			}			
		]
	}
];

gt.Const.World.Spawn.RogueSpecialYonn <- [
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.Necromancer,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieYeomanBodyguard,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.Ghost,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.ZombieYeoman,
				Num = 4
			},			
			{
				Type = this.Const.World.Spawn.Troops.ZombieKnight,
				Num = 3
			},	
			{
				Type = this.Const.World.Spawn.Troops.crZombieFootman,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.crZombieBillman,
				Num = 5
			},
			{
				Type = this.Const.World.Spawn.Troops.crZombieArbalester,
				Num = 2
			},			
			{
				Type = this.Const.World.Spawn.Troops.crZombieZweihander,
				Num = 3
			}			
		]
	}
];

gt.Const.World.Spawn.RogueSpecialGo <- [
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.crOrcPackleader,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.LegendOrcBehemoth,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.GoblinOverseer,
				Num = 2
			},			
			{
				Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
				Num = 2
			},	
			{
				Type = this.Const.World.Spawn.Troops.OrcYoung,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcBerserker,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarriorLOW,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.OrcWarrior,
				Num = 2
			},			
			{
				Type = this.Const.World.Spawn.Troops.GoblinSkirmisher,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.GoblinAmbusher,
				Num = 2
			}			
		]
	}
];

gt.Const.World.Spawn.RogueSpecialRoku <- [      //800
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.crPeasantminstrel,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.LegendPeasantMonk,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.crDesperadohigh,
				Num = 1
			},			
			{
				Type = this.Const.World.Spawn.Troops.crDesperado,
				Num = 17
			}			
		]
	}
];

gt.Const.World.Spawn.RogueSpecialNana <- [         //925
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.LegendVampireLord,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Vampire,
				Num = 9
			},
			{
				Type = this.Const.World.Spawn.Troops.LegendDemonHound,
				Num = 4
			},			
			{
				Type = this.Const.World.Spawn.Troops.LegendMummyHeavy,
				Num = 6
			},	
			{
				Type = this.Const.World.Spawn.Troops.LegendMummyPriest,
				Num = 3
			}			
		]
	}
];

gt.Const.World.Spawn.RogueSpecialHachi <- [       //1050
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.crBaron02,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.StandardBearer,
				Num = 3
			},
			{
				Type = this.Const.World.Spawn.Troops.Sergeant,
				Num = 2
			},			
			{
				Type = this.Const.World.Spawn.Troops.crKnight,
				Num = 4
			},	
			{
				Type = this.Const.World.Spawn.Troops.crSquire,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.crHonoraryknight,
				Num = 2
			},	
			{
				Type = this.Const.World.Spawn.Troops.crSquireFencer,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.LegendHalberdier,
				Num = 5
			}				
		]
	}
];

gt.Const.World.Spawn.RogueSpecialKyuu <- [       //1175
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.GoblinWolfrider,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.crGoblinRider01,
				Num = 6
			},
			{
				Type = this.Const.World.Spawn.Troops.crGoblinRider02,
				Num = 6
			},			
			{
				Type = this.Const.World.Spawn.Troops.crGoblinRider03,
				Num = 4
			},	
			{
				Type = this.Const.World.Spawn.Troops.crGoblinRider04,
				Num = 6
			}				
		]
	}
];

gt.Const.World.Spawn.RogueSpecialJyuu <- [       //1300
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.crConqueror,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.SkeletonPriest,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.crSkeleton,
				Num = 12
			},			
			{
				Type = this.Const.World.Spawn.Troops.crSkeleton_pol,
				Num = 8
			},	
			{
				Type = this.Const.World.Spawn.Troops.SkeletonGladiator,
				Num = 4
			}				
		]
	}
];

gt.Const.World.Spawn.RogueSpecialXI <- [       //1425
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.LegendHexeLeader,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.Hexe,
				Num = 1
			},			
			{
				Type = this.Const.World.Spawn.Troops.Lindwurm,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.LegendRockUnhold,
				Num = 2
			},			
			{
				Type = this.Const.World.Spawn.Troops.Schrat,
				Num = 2
			},	
			{
				Type = this.Const.World.Spawn.Troops.LegendRedbackSpider,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.LegendWhiteDirewolf,
				Num = 2
			},	
			{
				Type = this.Const.World.Spawn.Troops.LegendSkinGhoulMED,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.LegendStollwurm,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.LegendGreenwoodSchrat,
				Num = 1
			}			
		]
	}
];

gt.Const.World.Spawn.RogueSpecialXII <- [       //1550
	{
		MovementSpeedMult = 1.0,
		VisibilityMult = 1.0,
		VisionMult = 1.0,
		Body = "figure_civilian_03",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.crSellswordstandardbearer,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.crSellswordsergeant,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.crSellswordelite,
				Num = 1
			},			
			{
				Type = this.Const.World.Spawn.Troops.crSellswordlieutenant,
				Num = 2
			},	
			{
				Type = this.Const.World.Spawn.Troops.crSellsword,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.crSellswordveteran,
				Num = 2
			},	
			{
				Type = this.Const.World.Spawn.Troops.crSellsword_pol,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.crSellswordveteran_pol,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.crSellsword_tank,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.crSellswordveteran_tank,
				Num = 1
			},
			{
				Type = this.Const.World.Spawn.Troops.crSellswordranger,
				Num = 2
			},
			{
				Type = this.Const.World.Spawn.Troops.crSellswordveteranranger,
				Num = 2
			}			
		]
	}
];

function onCostCompare( _t1, _t2 )
{
	if (_t1.Cost < _t2.Cost)
	{
		return -1;
	}
	else if (_t1.Cost > _t2.Cost)
	{
		return 1;
	}

	return 0;
}

function calculateCosts( _p )
{
	foreach( p in _p )
	{
		p.Cost <- 0;

		foreach( t in p.Troops )
		{
			p.Cost += t.Type.Cost * t.Num;
		}

		if (!("MovementSpeedMult" in p))
		{
			p.MovementSpeedMult <- 1.0;
		}
	}

	_p.sort(this.onCostCompare);
}

this.calculateCosts(this.Const.World.Spawn.RogueSpecialIchi);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialNi);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialSann);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialYonn);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialGo);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialRoku);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialNana);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialHachi);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialKyuu);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialJyuu);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialXI);
this.calculateCosts(this.Const.World.Spawn.RogueSpecialXII);