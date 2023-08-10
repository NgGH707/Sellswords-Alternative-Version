::mods_hookExactClass("items/ammo/legend_armor_piercing_arrows", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		this.m.Description = "A quiver of arrows with piercing tips, designed for punching through thick armor. Is automatically refilled after each battle if you have enough ammunition. Grants +15% armor piercing and -5% damage while wielding a bow.";
	}

	o.onUpdateProperties = function( _properties )
	{
		this.ammo.onUpdateProperties(_properties);
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item == null || !item.isWeaponType(this.Const.Items.WeaponType.Bow))
		{
			return;
		}
		
		_properties.DamageDirectMult *= 1.15;
		_properties.RangedDamageMult *= 0.95;
	}

});	