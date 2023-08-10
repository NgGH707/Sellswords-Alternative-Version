::mods_hookExactClass("entity/world/settlements/buildings/arena_building", function(o) {
	o.onClicked = function( _townScreen )
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		if ((this.World.Contracts.getActiveContract() == null || this.World.Contracts.getActiveContract().getType() == "contract.cr_rogue_arena" || this.World.Contracts.getActiveContract().getType() == "contract.arena" || this.World.Contracts.getActiveContract().getType() == "contract.arena_tournament") && this.World.getTime().Days >= this.m.CooldownUntil)
		{
			local f = this.World.FactionManager.getFactionOfType(this.Const.Faction.Arena);
			local contracts = f.getContracts();
			local c;

			if (this.World.Contracts.getActiveContract() != null && (this.World.Contracts.getActiveContract().getType() == "contract.cr_rogue_arena" || this.World.Contracts.getActiveContract().getType() == "contract.arena" || this.World.Contracts.getActiveContract().getType() == "contract.arena_tournament"))
			{
				c = this.World.Contracts.getActiveContract();
			}
			else if (contracts.len() == 0)
			{
				if (this.World.Assets.getOrigin().getID() == "scenario.rogue")
				{
					c = this.new("scripts/contracts/contracts/cr_rogue_arena_contract");
					c.setFaction(f.getID());
					c.setHome(this.World.State.getCurrentTown());
					this.World.Contracts.addContract(c);
				}			
				else if (this.World.State.getCurrentTown().hasSituation("situation.arena_tournament") && this.World.Assets.getStash().getNumberOfEmptySlots() >= 5)
				{
					c = this.new("scripts/contracts/contracts/arena_tournament_contract");
					c.setFaction(f.getID());
					c.setHome(this.World.State.getCurrentTown());
					this.World.Contracts.addContract(c);
				}
				else if (this.World.Assets.getStash().getNumberOfEmptySlots() >= 3)
				{
					c = this.new("scripts/contracts/contracts/arena_contract");
					c.setFaction(f.getID());
					c.setHome(this.World.State.getCurrentTown());
					this.World.Contracts.addContract(c);
				}
				else
				{
					return;
				}
			}
			else
			{
				c = contracts[0];
			}

			c.setScreenForArena();
			this.World.Contracts.showContract(c);
		}
	}
})