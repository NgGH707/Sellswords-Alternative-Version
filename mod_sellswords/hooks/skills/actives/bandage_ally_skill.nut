::mods_hookExactClass("skills/actives/bandage_ally_skill", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create()

		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 10;
	}

});