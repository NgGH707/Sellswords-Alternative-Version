::mods_hookExactClass("items/weapons/legend_tipstaff", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create()

		this.m.RegularDamage = 15;
		this.m.RegularDamageMax = 20;
	
		this.m.DirectDamageAdd = 0.0;
		this.m.DirectDamageMult = 0.95;
	}
});	