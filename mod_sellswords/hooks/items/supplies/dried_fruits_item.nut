::mods_hookExactClass("items/supplies/dried_fruits_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Value = 120;
		this.m.Amount = 35.0;
	}

});