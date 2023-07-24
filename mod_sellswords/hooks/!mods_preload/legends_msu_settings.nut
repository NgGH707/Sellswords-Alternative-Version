local config = ::Legends.Mod.ModSettings.getPage("Campaign Options");
//::Mod_Chirutiru.HookHelper.addNCSetting(config, ::MSU.Class.SettingsDivider("ConfigDivider_Sellswords"));
::Mod_Chirutiru.HookHelper.addNCSetting(config, ::MSU.Class.BooleanSetting("RogueMode", false, "Rogue Mode", "Make sure it is enabled before you start rogue mode."));
::Mod_Chirutiru.HookHelper.addNCSetting(config, ::MSU.Class.RangeSetting("RogueDifficulty", 100, 75, 120, 5, "Rogue Difficulty", "Simply multiply the default base difficulty in percentage."));
	

