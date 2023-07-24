::mods_hookBaseClass("factions/faction_action", function ( o )
{
	local tts = o.onExecute;
	o.onExecute = function ( _faction )
	{			
		if (!::Legends.Mod.ModSettings.getSetting("RogueMode").getValue())
		{		
			tts( _faction );
		}	                  	
	}
});