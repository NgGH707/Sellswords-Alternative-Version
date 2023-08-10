::mods_hookExactClass("items/ammo/legend_large_broad_head_arrows", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		this.m.Description = "A large quiver of arrows with broad tips, designed for tearing flesh, but easily stopped by armor. Is automatically refilled after each battle if you have enough global ammunition. Grants +20% hitpoints damage but has a -10% modification apply to both armor piercing damage and damage against armor while wielding a bow.";
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

		_properties.DamageDirectMult *= 0.75;
		_properties.DamageArmorMult *= 0.75;				
		_properties.RangedDamageMult *= 1.2;
	}

});	