::mods_hookExactClass("items/supplies/wine_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. Wine made from squashed and fermented grapes. Both elaborate to produce and expensive to buy. Can be drunk in battle to grant +15% damage, damage reduction and  +30% Resolve. At the expense of -10% initiative and hitchance, the effect lasts for ten turns. Will be used as provisions if left in the company stash";
		this.m.Value = 160;
		this.m.Amount = 20.0;
		this.m.GoodForDays = 12;
	}

});