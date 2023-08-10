::mods_hookExactClass("entity/world/settlement", function ( o )
{
	o.getPriceMult = function ()
	{
		if (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{
			return 1;
		}
		else
		{
			local p;
			if (this.m.Size <= 1)
			{
				p = 0.95 + this.getActiveAttachedLocations().len() * 0.03;
			}
			else if (this.m.Size == 2)
			{
				p = 1.02 + this.getActiveAttachedLocations().len() * 0.03;
			}
			else if (this.m.Size == 3)
			{
				p = 1.1 + this.getActiveAttachedLocations().len() * 0.03;
			}
			return p * this.m.Modifiers.PriceMult;
		}
	}	
	o.getBuyPriceMult = function ()
	{
		if (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{
			return 1;
		}
		else
		{
			local p = this.getPriceMult() * this.World.Assets.getBuyPriceMult();
			local r = this.World.FactionManager.getFaction(this.m.Factions[0]).getPlayerRelation();
			if (r < 50)
			{
				p = p + (50.0 - r) * 0.006;
			}
			else if (r > 50)
			{
				p = p - (r - 50.0) * 0.003;
			}
			local barterMult = this.World.State.getPlayer().getBarterMult();
			if (this.m.Modifiers.BuyPriceMult - barterMult >= 0.01)
			{
				p = p * (this.m.Modifiers.BuyPriceMult - barterMult);
			}
			return p;
		}
	}
	o.getSellPriceMult = function ()
	{
		if (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{
			return 2;
		}
		else
		{
			local p = this.getPriceMult() * this.World.Assets.getSellPriceMult();
			local r = this.World.FactionManager.getFaction(this.m.Factions[0]).getPlayerRelation();
			if (r < 50)
			{
				p = p - (50.0 - r) * 0.006;
			}
			else if (r > 50)
			{
				p = p + (r - 50.0) * 0.003;
			}
			local barterMult = this.World.State.getPlayer().getBarterMult();
			p = p * (this.m.Modifiers.SellPriceMult + barterMult);
			return p;
		}
	}	
	o.updateShop = function ( _force = false )
	{
		local time = this.World.getTime().TimeOfDay;			
		local daysPassed = (this.Time.getVirtualTimeF() - this.m.LastShopUpdate) / this.World.getTime().SecondsPerDay;			
		//if (!_force && this.m.LastShopUpdate != 0 && (daysPassed < 3 && !::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())|| (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue() && time != 2))
		local interval = ::Legends.Mod.ModSettings.getSetting("RogueMode").getValue ? 0.9 : 3;
		if (!_force && this.m.LastShopUpdate != 0 && daysPassed < interval)			
		{
			this.updateImportedProduce();
			return;
		}
		
		if (this.m.ShopSeed != 0)
		{
			this.Math.seedRandom(this.m.ShopSeed);
		}
		this.m.ShopSeed = this.Math.floor(this.Time.getRealTime() + this.Math.rand());
		this.m.LastShopUpdate = this.Time.getVirtualTimeF();
		foreach( building in this.m.Buildings )
		{
			if (building != null)
			{
				building.onUpdateShopList();
				if (building.getStash() != null)
				{
					foreach( s in this.m.Situations )
					{
						s.onUpdateShop(building.getStash());
					}
				}
			}
		}
		this.updateImportedProduce();
	}
	o.addSituation = function ( _s, _validForDays = 0 )
	{
		if (!_s.isStacking())
		{
			this.removeSituationByID(_s.getID());
		}
		if (this.m.Situations.len() >= 10)
		{
			this.m.Situations[0].onRemoved(this);
			this.m.Situations.remove(0);
		}
		this.m.Situations.push(_s);
		_s.setInstanceID(this.World.EntityManager.getNextSituationID());
		if (_validForDays != 0)
		{
			_s.setValidForDays(_validForDays);
		}
		else if (_s.getDefaultDays() != 0)
		{
			_s.setValidForDays(_s.getDefaultDays());
		}
		if (!::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{
			_s.onAdded(this);
		}						
		this.m.Modifiers.reset();
		foreach( s in this.m.Situations )
		{
			s.onUpdate(this.m.Modifiers);
		}
		return _s.getInstanceID();
	}
	o.updateProduce = function ()
	{
		if (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{
			return;
		}		
		this.m.Produce = [];
		foreach( a in this.m.AttachedLocations )
		{
			if (a.isActive())
			{
				a.onUpdateProduce(this.m.Produce);
			}
		}
	}
	o.onUpdateShopList = function ( _id, _list )
	{
		if (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{
			return;
		}
		
		foreach( loc in this.m.AttachedLocations )
		{
			if (loc.isActive())
			{
				loc.onUpdateShopList(_id, _list);
			}
		}
	}
	o.build = function( _settings = null )
	{
		if (!::Legends.Mod.ModSettings.getSetting("RogueMode").getValue() && this.m.IsCoastal && (this.m.Buildings[3] == null || this.m.Buildings[3].getID() != "building.port"))
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/port_building"), 3);
			this.m.UIBackgroundLeft = "ui/settlements/water_01";
		}
		this.onBuild(_settings);
		if (this.m.Size <= 1)
		{
			this.m.Resources = 100;
		}
		else if (this.m.Size == 2)
		{
			this.m.Resources = 150;
		}
		else if (this.m.Size == 3)
		{
			this.m.Resources = 200;
		}
		if (this.isMilitary())
		{
			this.m.Resources += 50;
		}
		if (this.isKindOf(this, "city_state"))
		{
			this.m.Resources += 100;
		}
		if (this.getHousesMax() > 0)
		{
			local tile = this.getTile();
			local candidates = [];
			local poorCandidates = [];
			for( local i = 0; i < 6; ++i )
			{
				if (!tile.hasNextTile(i))
				{
				}
				else
				{
					local nextTile = tile.getNextTile(i);

					if (nextTile.IsOccupied)
					{
					}
					else if (nextTile.Type == this.Const.World.TerrainType.Oasis || nextTile.Type == this.Const.World.TerrainType.Plains || nextTile.Type == this.Const.World.TerrainType.Tundra || nextTile.Type == this.Const.World.TerrainType.Steppe || nextTile.Type == this.Const.World.TerrainType.Snow)
					{
						candidates.push(nextTile);
					}
					else if (nextTile.Type == this.Const.World.TerrainType.Desert || nextTile.Type == this.Const.World.TerrainType.Hills || nextTile.Type == this.Const.World.TerrainType.Forest || nextTile.Type == this.Const.World.TerrainType.SnowyForest || nextTile.Type == this.Const.World.TerrainType.LeaveForest || nextTile.Type == this.Const.World.TerrainType.AutumnForest || nextTile.Type == this.Const.World.TerrainType.Swamp)
					{
						poorCandidates.push(nextTile);
					}
				}
			}

			local houses = this.Math.min(this.Math.rand(this.getHousesMin(), this.getHousesMax()), candidates.len() + poorCandidates.len());

			for( local c; houses != 0; --houses )
			{
				local c = candidates.len() != 0 ? candidates : poorCandidates;
				local i = this.Math.rand(0, c.len() - 1);
				local v = this.Math.rand(1, 2);
				this.m.HousesTiles.push({
					X = c[i].SquareCoords.X,
					Y = c[i].SquareCoords.Y,
					V = v
				});
				c[i].clear();
				c[i].IsOccupied = true;
				local d = c[i].spawnDetail("world_houses_0" + this.getHousesType() + "_0" + v, this.Const.World.ZLevel.Object - 3, this.Const.World.DetailType.Houses);
				d.Scale = 0.85;
				c.remove(i);
			}
		}
	}		
});		