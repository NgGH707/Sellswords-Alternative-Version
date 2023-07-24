::mods_hookExactClass("items/supplies/beer_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. An alcoholic beverage made from honey. Both durable and tasty. Can be drunk in battle to grant +12% damage, damage reduction and  +24% Resolve. At the expense of -8% initiative and hitchance, the effect lasts for ten turns. Will be used as provisions while travelling if left in the company stash.";
		this.m.Value = 140;
		this.m.Amount = 20.0;		
		this.m.GoodForDays = 12;
	}

});