::mods_hookExactClass("items/ammo/legend_armor_piercing_bolts", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		this.m.Description = "A large quiver of bolts with thin piercing tips, designed for piercing armor, but doing less damage to flesh. Is automatically refilled after each battle if you have enough global ammunition. Grants +15% armor piercing damage, but -5% damage";
	}

	o.onUpdateProperties = function( _properties )
	{
		this.ammo.onUpdateProperties(_properties);
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item == null || !item.isWeaponType(this.Const.Items.WeaponType.Crossbow))
		{
			return;
		}

		_properties.DamageDirectMult *= 1.15;
		_properties.RangedDamageMult *= 0.95;
	}

});	