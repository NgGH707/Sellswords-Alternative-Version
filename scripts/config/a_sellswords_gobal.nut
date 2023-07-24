local function addEntityType(_id, _name, _namePlural, _icon)
{
	if (!("EntityTypeMax" in ::Const))
	{
		local max = 0;
		foreach(key, value in ::Const.EntityType)
		{
			if (typeof value == "integer" && value > max) max = value; 
		}
		::Const.EntityTypeMax <- max;
	}
	::Const.EntityType[_id] <- ++::Const.EntityTypeMax;
	::Const.Strings.EntityName.push(_name);
	::Const.Strings.EntityNamePlural.push(_namePlural);
	::Const.EntityIcon.push(_icon);
}

addEntityType("crSellswordranger", "Sellsword Ranger", "Sellsword Rangers", "ss08");		//165					original pack
addEntityType("crSellsword", "Sellsword", "Sellswords", "ss06");
addEntityType("crSellswordelite", "Sellsword Elite", "Sellsword Elites", "ss07");
addEntityType("crSellswordveteran", "Sellsword Veteran", "Sellsword Veterans", "ss09");
addEntityType("crSquire", "Squire", "Squires", "ss10");															    //folk pack
addEntityType("crSquireLow", "Squire", "Squires", "ss10");
addEntityType("crBarbblacksmith", "Barbarian Blacksmith", "Barbarian Blacksmiths", "ss01");		//171
addEntityType("crConscript", "Conscript", "Conscripts", "conscript_orientation");
addEntityType("crFallenbetrayer", "Fallen Betrayer", "Fallen Betrayers", "zombie_betrayer_orientation");
addEntityType("crBaron", "Baron", "Barons", "ss02");
addEntityType("crManhunter", "Manhunter", "Manhunters", "nomad_02_orientation");
addEntityType("crSlaveowner", "Slave Owner", "Slave Owners", "nomad_05_orientation");		
addEntityType("crAbjectfighter", "Slave Fighter", "Slave Fighters", "slave_orientation");
addEntityType("crAbjectgladiator", "Slave Gladiator", "Slave Gladiators", "gladiator_orientation");
addEntityType("crWarden", "Warden", "Wardens", "gladiator_orientation");
addEntityType("crDesperado", "Desperado", "Desperados", "ss04");													//deperados pack
addEntityType("crHashshashin", "Hashshashin", "Hashshashins", "ss05");		 //181		
addEntityType("crDesperadoLOW", "Desperado", "Desperados", "ss04");		
addEntityType("crHashshashinLOW", "Hashshashin", "Hashshashins", "ss05");
addEntityType("crOrcPillager", "Orc Pillager", "Orc Pillagers", "orc_pillager_orientation");								//berserkers pack
addEntityType("BarbarianKuangzhanshi", "Barbarian Rager", "Barbarian Ragers", "yemanren_01_orientation");
addEntityType("BarbarianKuangzhanshi02", "Barbarian Berserker", "Barbarian Berserkers", "yemanren_01_orientation");
addEntityType("crKnight", "Knight", "Knights", "knight_orientation");		 //187		
addEntityType("crHedgeKnight", "Hedge Knight", "Hedge Knights", "hedge_knight_orientation");		
addEntityType("crBarbhunter", "Barbarian Hunter", "Barbarian Hunters", "poacher_orientation");
addEntityType("crMercenary", "Mercenary", "Mercenaries", "mercenary_orientation");									//test_sellswords
addEntityType("crPeasantgravedigger", "Gravedigger", "Gravediggers", "ss11");										//professions pack
addEntityType("crPeasantherbalist", "Herbalist", "Herbalists", "ss12");
addEntityType("crPeasantblacksmith", "Blacksmith", "Blacksmiths", "blacksmith_orientation");		
addEntityType("crPeasantbutcher", "Butcher", "Butchers", "butcher_orientation");
addEntityType("crPeasantminstrel", "Minstrel", "Minstrels", "minstrel_orientation");
addEntityType("crPeasantjuggler", "Juggler", "Jugglers", "ss13");
addEntityType("crBanditleaderwolf", "Disguised Bandit Leader", "Disguised Bandit Leaders", "bandit_leader_orientation");
addEntityType("crDesperadohigh", "Desperado", "Desperados", "ss04");												//deperados rework
addEntityType("crHashshashinhigh", "Hashshashin", "Hashshashins", "ss05");
addEntityType("crBarbarianChampionhigh", "Barbarian Chosen", "Barbarian Chosens", "wildman_03_orientation");
addEntityType("crDesperadoverylow", "Desperado", "Desperados", "ss04");
addEntityType("crRetiredsoldier", "Retired Soldier", "Retired Soldiers", "orientation_retiredsoldier");
addEntityType("crRetiredsoldierpol", "Retired Soldier", "Retired Soldiers", "orientation_retiredsoldier");
addEntityType("crPeasantkiller", "Killer", "Killers", "ss14");
addEntityType("crZombieswordmaster", "Yaksha", "Yakshas", "ss15");
addEntityType("crOutlander", "Outlander", "Outlanders", "ss16");
addEntityType("crInfantry", "Infantry", "Infantries", "infantry_orientation");								//military pack
addEntityType("crGuardsman", "Gaurdsman", "Gaurdsmen", "ss03");		
addEntityType("crGuardsman_pol", "Gaurdsman", "Gaurdsmen", "ss03");
addEntityType("Solemner", "Mulathamin", "Mulathamun", "ss05");
addEntityType("crHonoraryknight", "Honorary Knight", "Honorary Knights", "knight_orientation");
addEntityType("crSquireFencer", "Squire", "Squires", "ss10");
addEntityType("crSellsword_pol", "Sellsword", "Sellswords", "ss06");												//sellswords rework
addEntityType("crSellsword_tank", "Sellsword", "Sellswords", "ss06");		
addEntityType("crSellswordveteran_pol", "Sellsword Veteran", "Sellsword Veterans", "ss09");
addEntityType("crSellswordveteran_tank", "Sellsword Veteran", "Sellsword Veterans", "ss09");
addEntityType("crSellswordveteranranger", "Sellsword Veteran", "Sellsword Veterans", "ss08");
addEntityType("crSellswordsergeant", "Sellsword Sergeant", "Sellsword Sergeants", "sergeant_orientation");
addEntityType("crSellswordlieutenant", "Sellsword Sergeant", "Sellsword Sergeants", "sergeant_orientation");
addEntityType("crSellswordstandardbearer", "Sellsword Standard Bearer", "Sellsword Standard Bearers", "standard_bearer_orientation");
addEntityType("crSquire_normal", "Squire", "Squires", "ss10");								
addEntityType("crImmortal", "Barbarian Chosen", "Barbarian Chosens", "wildman_03_orientation");						//monsters pack
addEntityType("crSkeleton", "Ancient Praetoriani", "Ancient Praetorianus", "skeleton_05_orientation");
addEntityType("crSkeleton_pol", "Ancient Praetoriani", "Ancient Praetorianus", "skeleton_05_orientation");
addEntityType("crGoblinwarrior", "Goblin Warrior", "Goblin Warriors", "kobold_fighter_orientation");
addEntityType("crKnight_guest", "Knight", "Knights", "knight_orientation");
addEntityType("crSquire_guest", "Squire", "Squires", "ss10");
addEntityType("crStandardBearer_guest", "Standard Bearer", "Standard Bearers", "standard_bearer_orientation");		//civil pack   228
addEntityType("crFootman_guest", "Footman", "Footmen", "footman_veteran_orientation");
addEntityType("crBillman_guest", "Billman", "Billmen", "billman_orientation");
addEntityType("crArbalester_guest", "Arbalester", "Arbalesters", "arbalester_orientation");
addEntityType("crZweihander_guest", "Greatsword", "Greatswords", "greatsword_orientation");		
addEntityType("crSergeant_guest", "Sergeant", "Sergeants", "sergeant_orientation");
addEntityType("crBanditFootman", "Footman", "Footmen", "footman_veteran_orientation");
addEntityType("crBanditBillman", "Billman", "Billmen", "billman_orientation");
addEntityType("crBanditArbalester", "Arbalester", "Arbalesters", "arbalester_orientation");
addEntityType("crBanditZweihander", "Greatsword", "Greatswords", "greatsword_orientation");		
addEntityType("crBanditSergeant", "Sergeant", "Sergeants", "sergeant_orientation");
addEntityType("crBarbarianFootman", "Footman", "Footmen", "footman_veteran_orientation");
addEntityType("crBarbarianBillman", "Billman", "Billmen", "billman_orientation");
addEntityType("crBarbarianArbalester", "Arbalester", "Arbalesters", "arbalester_orientation");
addEntityType("crBarbarianZweihander", "Greataxe", "Greataxes", "greatsword_orientation");		
addEntityType("crBarbarianSergeant", "Sergeant", "Sergeants", "sergeant_orientation");
addEntityType("crNomadFootman", "Footman", "Footmen", "footman_veteran_orientation");
addEntityType("crNomadBillman", "Billman", "Billmen", "billman_orientation");
addEntityType("crNomadArbalester", "Arbalester", "Arbalesters", "arbalester_orientation");
addEntityType("crNomadZweihander", "Grenadier", "Grenadiers", "greatsword_orientation");		
addEntityType("crNomadSergeant", "Sergeant", "Sergeants", "sergeant_orientation");
addEntityType("crZombieFootman", "Wiederganger", "Wiedergangers", "zombie_02_orientation");
addEntityType("crZombieBillman", "Wiederganger", "Wiedergangers", "zombie_02_orientation");
addEntityType("crZombieArbalester", "Wiederganger", "Wiedergangers", "zombie_02_orientation");
addEntityType("crZombieZweihander", "Wiederganger", "Wiedergangers", "zombie_02_orientation");		
addEntityType("crNecromancer", "Necromancer", "Necromancers", "human_01_orientation");
addEntityType("crPaladin_guest", "Paladin", "Paladins", "monk_orientation");
addEntityType("crOrcWarlock", "Orc Warlock", "Orc Warlocks", "orientation_orcwarlock");
addEntityType("crBarbarianKing", "Barbarian King", "Barbarian Kings", "wildman_06_orientation");
addEntityType("crSlayer", "Beast Slayer", "Beast Slayers", "orientation_slayer");                         //257
addEntityType("crDeathknight", "Death Knight", "Death Knights", "deathknight_orientation");
addEntityType("crKnightcommander", "Knight Commander", "Knight Commanders", "ss07");
addEntityType("crOrcGrunt", "Orc Grunt", "Orc Grunts", "orc_grunt_orientation");	
addEntityType("crOrcVanguard", "Orc Slaughterer", "Orc Slaughterers", "orc_slaughterer_orientation");	
addEntityType("crOrcPackleader", "Orc Packleader", "Orc Packleaders", "orc_packleader_orientation");
addEntityType("crAbjectgladiator02", "Slave Gladiator", "Slave Gladiators", "gladiator_orientation");      //rogue 23.04     263
addEntityType("crNomadScavenger", "Nomad Scavenger", "Nomad Scavengers", "gladiator_orientation");
addEntityType("crBaron02", "Baron", "Barons", "ss02");
addEntityType("crGoblinRider01", "Goblin Gendarme", "Goblin Gendarmes", "goblin_05_orientation");	
addEntityType("crGoblinRider02", "Goblin Chasseur", "Goblin Chasseurs", "goblin_05_orientation");	
addEntityType("crGoblinRider03", "Goblin Caballero", "Goblin Caballeros", "goblin_05_orientation");
addEntityType("crGoblinRider04", "Goblin Ranger", "Goblin Rangers", "goblin_05_orientation");
addEntityType("crGoblinRider00", "Goblin Fighter", "Goblin Fighters", "goblin_05_orientation");
addEntityType("crConqueror", "The Conqueror", "The Conquerors", "skeleton_05_orientation");