::mods_hookExactClass("skills/actives/legend_field_triage", function(o) {
	
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		this.m.FatigueCost = 15;
		this.m.MinRange = 0;
	}

})