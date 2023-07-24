::mods_hookExactClass("crafting/blueprints/mod_legend/armor/chest/legend_mountain_armor_blueprint", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();

		this.m.PreviewCraftable = this.new("scripts/items/legend_armor/plate/cr_mountain_armor");
		this.m.PreviewComponents.clear();

		this.init([
			{
				Script = "scripts/items/misc/legend_rock_unhold_bones_item",
				Num = 2
			},
			{
				Script = "scripts/items/misc/legend_rock_unhold_hide_item",
				Num = 2
			},
			{
				Script = "scripts/items/misc/unhold_hide_item",
				Num = 4
			},
			{
				Script = "scripts/items/legend_armor/plate/legend_armor_plate_chest",
				Num = 1,
				LegendsArmor = true
			}
		]);

		this.initSkills([
			{
				Scripts = [
					"scripts/skills/backgrounds/legend_blacksmith_background"
				]
			}
		]);
	}

	o.onCraft = function( _stash )
	{
		_stash.add(this.new("scripts/items/legend_armor/plate/cr_mountain_armor"));
	}
})

