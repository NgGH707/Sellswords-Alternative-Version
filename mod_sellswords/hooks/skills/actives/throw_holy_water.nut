::mods_hookExactClass("skills/actives/throw_holy_water", function(o) {
	
	o.isHidden <- function()
	{
		return this.getContainer().getActor().getCurrentProperties().IsSpecializedInNets;
	}

	o.onAfterUpdate = function( _properties )
	{
		this.m.FatigueCostMult = (_properties.IsSpecializedInThrowing || _properties.IsSpecializedInNets) ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

})