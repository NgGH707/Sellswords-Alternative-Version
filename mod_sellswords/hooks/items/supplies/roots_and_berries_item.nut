::mods_hookExactClass("items/supplies/roots_and_berries_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. This fermented hop or barley drink is more durable and safer to drink than plain water. Can be drunk in battle to grant +9% damage, damage reduction and  +18% Resolve. At the expense of -6% initiative and hitchance, the effect lasts for ten turns. Can either be consumed as provisions or drunk in battle.";
		this.m.Value = 80;
		this.m.Amount = 25.0;
	}

});