this.rogue_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.rogue";
		this.m.Name = "Rogue";
		this.m.Description = "[p=c][img]gfx/ui/pics/pic_rogue_01.png[/img][/p][p] An endless rogue mode, focused on combat and character-building. It is significantly different from the normal game, so please be sure to carefully read the instructions at the beginning.\n\n[color=#c90000]Rogue Mode:[/color]\n!!! Make sure the *Mod Settings* - *Legends Mod* - *New Compaign* - *Rogue Mode* option is turned on before starting!!![/p]";
		this.m.Difficulty = 4;
		this.m.Order = 711;
		this.m.IsFixedLook = true;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(20);
		this.m.RosterTierMax = this.Const.Roster.getTierForSize(20);
		this.m.StartingBusinessReputation = 100;
		this.setRosterReputationTiers(this.Const.Roster.createReputationTiers(this.m.StartingBusinessReputation));
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();

		for( local i = 1; i < 5; i = i )
		{
			local bro = roster.create("scripts/entity/tactical/player");

			if (i != 0)
			{
				bro.fillTalentValues(3);
			}

			i = ++i;
		}

		local bros = roster.getAll();
		local items;
				
		bros[1].setStartValuesEx([
			"cr_rogue_specialist_background"
		], false);
		items = bros[1].getItems();	
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));			
		items.equip(this.new("scripts/items/weapons/two_handed_wooden_hammer"));		
		items.equip(this.Const.World.Common.pickHelmet([
			[1, "cr_rogue_helm_frontline"]
		]));			
		items.equip(this.Const.World.Common.pickArmor([
			[1, "cr_rogue_armor_frontline"]
		]));			
		bros[1].setPlaceInFormation(3);
		
		bros[2].setStartValuesEx([
			"cr_rogue_defender_background"
		], false);
		items = bros[2].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));			
		items.equip(this.new("scripts/items/weapons/boar_spear"));		
		items.equip(this.new("scripts/items/shields/oriental/metal_round_shield"));
		items.equip(this.Const.World.Common.pickHelmet([
			[1, "cr_rogue_helm_frontline"]
		]));			
		items.equip(this.Const.World.Common.pickArmor([
			[1, "cr_rogue_armor_frontline"]
		]));
		bros[2].setPlaceInFormation(4);
		bros[2].setVeteranPerks(2);		

		bros[3].setStartValuesEx([
			"cr_rogue_sniper_background"
		], false);	
		items = bros[3].getItems();	
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));		
		items.equip(this.new("scripts/items/weapons/light_crossbow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		items.addToBag(this.new("scripts/items/weapons/knife"));		
		items.equip(this.Const.World.Common.pickHelmet([
			[1, "cr_rogue_helm_light"]
		]));			
		items.equip(this.Const.World.Common.pickArmor([
			[1, "cr_rogue_armor_light"]
		]));
		bros[3].setPlaceInFormation(5);		
		bros[3].setVeteranPerks(2);

		bros[0].setStartValuesEx([
			"cr_rogue_supporter_background"			
		], false);
		items = bros[0].getItems();	
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));			
		items.equip(this.new("scripts/items/weapons/hooked_blade"));			
		items.equip(this.Const.World.Common.pickHelmet([
			[1, "cr_rogue_helm_light"]
		]));			
		items.equip(this.Const.World.Common.pickArmor([
			[1, "cr_rogue_armor_light"]
		]));		
		bros[0].setPlaceInFormation(14);
		bros[0].setVeteranPerks(2);
		
		local roster = this.World.getPlayerRoster().getAll();									
		foreach( bro in roster )
		{
			bro.getSkills().add(this.new("scripts/skills/traits/cr_rogue_trait"));			
			bro.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));	
			local traits = bro.getSkills().getAllSkillsOfType(this.Const.SkillType.Trait);
			foreach( t in traits )
			{
				if (!t.isType(this.Const.SkillType.Special) && !t.isType(this.Const.SkillType.Background))
				{
					bro.getSkills().remove(t);
				}
			}
			bro.m.PerkPoints = 2;
			bro.m.LevelUps = 2;
			bro.m.Level = 3;
			bro.setVeteranPerks(1);	
			//bro.getSkills().add(this.new("scripts/skills/traits/chirublessing"));			/////////////////////////////////////////	
		}	
		
		this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
		//this.World.Assets.getStash().resize(this.World.Assets.getStash().getCapacity() + 60);
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/dried_lamb_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/wine_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/tents/tent_train"));
		//this.World.Assets.getStash().add(this.new("scripts/items/tents/tent_craft"));
		//this.World.Assets.getStash().add(this.new("scripts/items/tents/tent_hunter"));		
		this.World.Assets.m.Money = 1000;
		this.World.Assets.m.ArmorParts = 30;
		this.World.Assets.m.Medicine = 30;
		this.World.Assets.m.Ammo = 300;
		
		this.World.Assets.m.ChampionChanceAdditional -= 100;		
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isIsolatedFromRoads() && randomVillage.isSouthern() && randomVillage.hasBuilding("building.arena"))
			{
				break;
			}

			i = ++i;
		}

		local randomVillageTile = randomVillage.getTile();


		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(16);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/worldmap_11.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.rogue_intro");
		}, null);
	}

	function onInit()
	{
		if (this.World.State.getPlayer() != null)
		{
			this.World.State.getPlayer().m.BaseMovementSpeed = 0;
		}	
		this.starting_scenario.onInit();
	}
	
	function onCombatFinished()
	{
		if (!::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{
			return false;
		}	
		local mn = this.World.Flags.get("RogueCount") ? this.World.Flags.get("RogueCount") : 0;
		if (this.World.Statistics.getFlags().get("LastCombatID") && this.World.Statistics.getFlags().get("LastCombatID") > mn)
		{
			return false;
		}
		if (this.World.getTime().Days > 2 && ((this.Time.getVirtualTimeF() - this.World.Events.getLastBattleTime()) / this.World.getTime().SecondsPerDay > 1.9))
		{
			return false;
		}		
		local roster = this.World.getPlayerRoster().getAll();
		foreach( bro in roster )
		{
			if (!bro.getSkills().hasSkill("trait.cr_rogue"))
			{
				return false;
			}					
		}
		return true;
	}	
	
	function onUpdateDraftList( _list, _gender = null )
	{
	}

	function onHiredByScenario( bro )
	{
		bro.getBaseProperties().DailyWage = 0;
		local traits = bro.getSkills().getAllSkillsOfType(this.Const.SkillType.Trait);
		foreach( t in traits )
		{
			if (!t.isType(this.Const.SkillType.Special) && !t.isType(this.Const.SkillType.Background))
			{
				bro.getSkills().remove(t);
			}
		}		
		bro.getSkills().add(this.new("scripts/skills/traits/cr_rogue_trait"));	
		bro.getSkills().add(this.new("scripts/skills/traits/cr_rogue_mark_trait"));			
	}

	function onUpdateHiringRoster( _roster )
	{
		local garbage = [];
		local bros = _roster.getAll();

		foreach( i, bro in bros )
		{
			if (bro.getBackground().getID() != "background.legend_donkey")
			{
				garbage.push(bro);
			}
			else
			{
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 0.0);
				bro.getBaseProperties().DailyWageMult *= 0.0;
				bro.getSkills().update();
			}
		}

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}
	
});

