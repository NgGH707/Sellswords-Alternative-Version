::mods_hookExactClass("items/weapons/named/named_two_handed_flail", function(o) {
	::Mod_Chirutiru.HookHelper.hookNamedItemToChangeStats(o, function() {
		this.m.DirectDamageMult = 0.4;
	});
});