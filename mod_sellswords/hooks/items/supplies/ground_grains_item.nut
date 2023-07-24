::mods_hookExactClass("items/supplies/ground_grains_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. Various kinds of grounded grain that will be cooked up with water or milk for a daily meal. It is satiating but tasteless. Can be eaten in battle to increase your HP recovery, Resolve and Defenses, based on the amount remaining. Will be gradually used as provisions if left in the company stash.";
		this.m.Amount = 20.0;
	}

	o.onEquip = function()
	{
		this.legend_usable_food.onEquip();
		local skill = this.new("scripts/skills/actives/legend_eat_rations_skill");
		local skill = this.new("scripts/skills/actives/legend_eat_pudding_skill");
		skill.setItem(this);
		skill.setAmount(this.m.Amount);
		this.addSkill(skill);
	}

});