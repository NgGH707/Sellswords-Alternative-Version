::mods_hookExactClass("items/weapons/barbarians/heavy_throwing_axe", function ( o ) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create()

		this.m.WeaponType = this.m.WeaponType | this.Const.Items.WeaponType.Axe;
		this.setupWeaponType();
	}
});	