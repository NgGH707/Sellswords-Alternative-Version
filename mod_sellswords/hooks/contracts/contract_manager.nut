::mods_hookNewObject("contracts/contract_manager", function(o) {
	local ws_addContract = o.addContract;
	o.addContract = function( _contract, _isNewContract = true )
	{
		if (::Legends.Mod.ModSettings.getSetting("RogueMode").getValue() && _contract.getType() != "contract.cr_rogue_arena")
		{
			return;
		}	

		ws_addContract(_contract, _isNewContract);
	}
})