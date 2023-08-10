// load the hook helper
::include("mod_sellswords/hook_helper.nut")
// all folders below must be loaded in that order

// load the config folder which contains new Const added by this mod 
foreach (file in ::IO.enumerateFiles("mod_sellswords/config"))
{
	::include(file);
}

// load all hooks related to vanilla and legends
foreach (file in ::IO.enumerateFiles("mod_sellswords/hooks"))
{
	::include(file);
}

// load all hooks related to ptr 
if (::Is_PTR_Exist)
{
	foreach (file in ::IO.enumerateFiles("mod_sellswords/hooks_ptr"))
	{
		::include(file);
	}
}

// update the perk tooltips
::Const.Perks.updatePerkGroupTooltips();

// update new armor sets
::Const.LegendMod.Armors <- {};

foreach( i, v in ::Const.LegendMod.ArmorObjs )
{
	::Const.LegendMod.Armors[v.ID] <- v;
}

// update new helmet sets
::Const.LegendMod.Helmets <- {};

foreach( i, v in ::Const.LegendMod.HelmObjs )
{
	::Const.LegendMod.Helmets[v.ID] <- v;
}

