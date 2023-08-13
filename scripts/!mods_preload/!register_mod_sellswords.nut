::Mod_Sellswords <- {
	ID = "mod_sellswords",
	Name = "Sellswords Updated",
	Version = "5.4.9",
};

::mods_registerMod(::Mod_Sellswords.ID, ::Mod_Sellswords.Version, ::Mod_Sellswords.Name);
::mods_queue(::Mod_Sellswords.ID, "mod_legends, mod_msu(>=1.2.6), >mod_legends_PTR, !Chirutiru_balance, !mod_Chirutiru_enemies, !zChirutiru_equipment, !mod_reforged", function () // safeguard against running with other Sellswords version and Reforged
{
	::Mod_Sellswords.Mod <- ::MSU.Class.Mod(::Mod_Sellswords.ID, ::Mod_Sellswords.Version, ::Mod_Sellswords.Name);

	if (!("Is_PTR_Exist" in this.getroottable())) ::Is_PTR_Exist <- ::mods_getRegisteredMod("mod_legends_PTR") != null;
	if (!("Is_AC_Exist" in this.getroottable())) ::Is_AC_Exist <- ::mods_getRegisteredMod("mod_AC") != null;

	::include("mod_sellswords/load.nut");
});
