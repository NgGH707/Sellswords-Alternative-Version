::mods_hookNewObject("events/event_manager", function(o) {
	local ws_update = o.update;
	o.update = function()
	{
		if (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{
			return;
		}

		ws_update();
	}
})