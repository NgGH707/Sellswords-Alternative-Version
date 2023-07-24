::mods_hookExactClass("items/weapons/legend_staff", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create()

		this.m.DirectDamageAdd = 0.0;
		this.m.RegularDamage = 15;
		this.m.RegularDamageMax = 20;
		this.m.ArmorDamageMult = 0.2;
		this.m.DirectDamageMult = 0.95;	
	}
});	