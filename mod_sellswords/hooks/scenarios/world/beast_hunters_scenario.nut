::mods_hookExactClass("scenarios/world/beast_hunters_scenario", function ( o )
{
	local create = o.create;
	o.create = function()
	{
		create();
		this.m.Description = "[p=c][img]gfx/ui/events/event_122.png[/img][/p][p]You and your kind make your living by hunting down the many beasts that beset villages on the fringes of civilization. It is dangerous work, but it pays well enough and there is always a bigger beast to slay and more crowns to earn.\n\n[color=#bcad8c]Beast Slayers:[/color] Start with three beast slayers and decent equipment, as well as some beast trophies.\n[color=#bcad8c]Expert Trackers:[/color] See tracks from further away.\n[color=#bcad8c]Expert Skinners:[/color] Each beast you slay has a 50% chance to drop an additional trophy.\n[color=#bcad8c]Prejudice:[/color] Most people do not trust your kind, so you get 10% worse prices.[/p]";
		this.m.Difficulty = 3;			
	}	
	o.onSpawnAssets = function()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 3; i = i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.improveMood(1.0, "Has slain a dangerous witch");
			bro.worsenMood(2.5, "Lost most of the company in a betrayal");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
			i = ++i;
			i = i;
			i = i;
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"beast_hunter_background"
		]);
		bros[0].getBackground().m.RawDescription = "%name% saved you in the brigand\'s ambush that destroyed your band of slayers. The mercenary does not hang this fact over you, for you have saved %name% many a times yourself. The beast hunter suffers no emotion that does not bid well in this world and that alone makes for a sound slayer.";
		bros[0].setPlaceInFormation(3);
		bros[0].addLightInjury();
		bros[0].m.Talents = [];
		//bros[0].setVeteranPerks(2);
		local talents = bros[0].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.MeleeDefense] = 2;
		talents[this.Const.Attributes.Fatigue] = 2;
		local items = bros[0].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
		items.equip(this.new("scripts/items/weapons/boar_spear"));
		items.equip(this.new("scripts/items/tools/throwing_net"));
		bros[1].setStartValuesEx([
			"beast_hunter_background"
		]);
		bros[1].getBackground().m.RawDescription = "A young whelp from the city, %name% got a start in beast slaying by rooting out the warrens of \'vicious rabbits\', as one puts it. You are not sure how true that is, but regardless %name% has demonstrated greats feats of arms on the battlefield more times than you can count.";
		bros[1].setPlaceInFormation(4);
		bros[1].addLightInjury();
		//bros[1].setVeteranPerks(2);
		bros[1].m.Talents = [];
		local talents = bros[1].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Fatigue] = 2;
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.Bravery] = 2;
		local items = bros[1].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
		items.equip(this.new("scripts/items/weapons/spetum"));
		bros[2].setStartValuesEx([
			"beast_hunter_background"
		]);
		bros[2].getBackground().m.RawDescription = "Grizzled vets are a rarity in beast slaying, and %name% sure ain\'t one. Instead, the \'slayer\' started the foray into monster hunting by reading books instead of training the sword. Still a good enough warrior at heart, it is the study and preparation that gives %name% the edge in battle.";
		bros[2].setPlaceInFormation(5);
		bros[2].addInjury(this.Const.Injury.Brawl);
		//bros[2].setVeteranPerks(2);
		bros[2].m.Talents = [];
		local talents = bros[2].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.RangedSkill] = 2;
		talents[this.Const.Attributes.RangedDefense] = 2;
		talents[this.Const.Attributes.Fatigue] = 2;
		local items = bros[2].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
		items.equip(this.new("scripts/items/weapons/hunting_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		items.equip(this.new("scripts/items/accessory/wardog_item"));

		foreach( bro in bros )
		{
			bro.m.PerkPoints = 1;
			bro.m.LevelUps = 1;
			bro.m.Level = 2;
		}

		this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
		this.World.Flags.set("HasLegendCampCrafting", true);
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/witch_hair_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/werewolf_pelt_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/werewolf_pelt_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/tools/legend_broken_throwing_net"));
		this.World.Assets.getStash().add(this.new("scripts/items/accessory/night_vision_elixir_item"));
		this.World.Assets.m.Money = this.Math.round(this.World.Assets.m.Money * 0.75);
	}
	local ws_onInit = o.onInit;
	o.onInit = function()
	{
		ws_onInit();
		this.World.Assets.m.BuyPriceMult = 1.1;
		this.World.Assets.m.SellPriceMult = 0.9;
	}	

});	