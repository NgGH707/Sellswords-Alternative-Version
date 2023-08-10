::Mod_Sellswords <- {
	ID = "mod_sellswords",
	Name = "Sellswords Updated",
	Version = "5.4.9",
};

::mods_registerMod(::Mod_Sellswords.ID, ::Mod_Sellswords.Version, ::Mod_Sellswords.Name);
::mods_queue(::Mod_Sellswords.ID, "mod_legends, mod_msu(>=1.2.4), >mod_legends_PTR", function()
{
	// define mod class of this mod
	::Mod_Sellswords.Mod <- ::MSU.Class.Mod(::Mod_Sellswords.ID, ::Mod_Sellswords.Version, ::Mod_Sellswords.Name);

	// important consts and objects
	if (!("Is_PTR_Exist" in this.getroottable())) ::Is_PTR_Exist <- ::mods_getRegisteredMod("mod_legends_PTR") != null;
	if (!("Is_AC_Exist" in this.getroottable())) ::Is_AC_Exist <- ::mods_getRegisteredMod("mod_AC") != null;

	// load hook files
	::include("mod_sellswords/load.nut");
});
