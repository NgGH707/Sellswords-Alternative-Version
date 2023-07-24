::mods_hookExactClass("items/shields/named/named_undead_kite_shield", function(o) {
	::Mod_Chirutiru.HookHelper.hookNamedItemToChangeStats(o, function() {
		this.m.MeleeDefense = 16;
		this.m.RangedDefense = 27;
	});
})