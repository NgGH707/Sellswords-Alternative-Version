::mods_hookExactClass("entity/world/attached_location/fishing_huts_oriental_location", function(o) {
	local ws_onUpdateShopList = o.onUpdateShopList;
	o.onUpdateShopList = function( _id, _list )
	{
		local before = _list.len();

		ws_onUpdateShopList(_id, _list);

		local after = _list.len();

		if (before < after)
		{
			for (local i = after - 1; i >= before; --i)
			{
				if (_list[i].S != "supplies/dried_fish_item") continue;

				_list[i].P += 1.1;
			}
		}
	}
})
