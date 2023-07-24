::mods_hookExactClass("items/supplies/legend_fresh_fruit_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Value = 45;
		this.m.Amount = 20.0;
	}

});