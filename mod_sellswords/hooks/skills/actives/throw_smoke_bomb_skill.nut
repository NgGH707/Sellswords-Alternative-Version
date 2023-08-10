::mods_hookExactClass("skills/actives/throw_smoke_bomb_skill", function(o) {
	
	o.onAfterUpdate = function( _properties )
	{
		this.m.FatigueCostMult = (_properties.IsSpecializedInThrowing || _properties.IsSpecializedInNets) ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
		this.m.MaxRange = _properties.IsSpecializedInNets ? 4 : 3;
	}

})