::mods_hookExactClass("skills/actives/legend_field_repairs", function(o) {
	
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		this.m.MaxTools = 20.0;
		this.m.FatigueCost = 30;
		this.m.MinRange = 0;
	}

})