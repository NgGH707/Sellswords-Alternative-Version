::mods_hookNewObject("ambitions/ambition_manager", function(o) {
	local ws_isAvailable = o.isAvailable;
	o.isAvailable = function()
	{
		if (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{		
			return;
		}

		ws_isAvailable();
	}
});