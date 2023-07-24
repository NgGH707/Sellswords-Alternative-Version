::mods_hookExactClass("items/weapons/legend_staff_vala", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create()

		this.m.RegularDamageMax = 25;
		this.m.ArmorDamageMult = 0.3;
		this.m.DirectDamageMult = 0.95;
	}
});	