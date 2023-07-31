::Mod_Chirutiru <- {
	ID = "mod_Chirutiru",
	Name = "Sellswords",
	Version = "5.4.0-alt.9",
};

::mods_registerMod(::Mod_Chirutiru.ID, ::Mod_Chirutiru.Version, ::Mod_Chirutiru.Name);
::mods_queue(::Mod_Chirutiru.ID, "mod_legends, mod_msu(>=1.2.4), >mod_legends_PTR", function()
{
	// define mod class of this mod
	::Mod_Chirutiru.Mod <- ::MSU.Class.Mod(::Mod_Chirutiru.ID, ::Mod_Chirutiru.Version, ::Mod_Chirutiru.Name);

	// important consts and objects
	if (!("Is_PTR_Exist" in this.getroottable())) ::Is_PTR_Exist <- ::mods_getRegisteredMod("mod_legends_PTR") != null;

	// load hook files
	::include("mod_sellswords/load.nut");
});
