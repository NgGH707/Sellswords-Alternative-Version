::mods_hookExactClass("items/supplies/preserved_mead_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. This ashen liquid has small sparkles of silver swirrling about. The taste is off, but it hardly ever spoils. Can be drunk in battle to grant +12% damage, damage reduction and  +24% Resolve. At the expense of -8% initiative and hitchance, the effect lasts for ten turns. Will be used as provisions while travelling if left in the company stash.";
		this.m.Value = 150;
	}

});