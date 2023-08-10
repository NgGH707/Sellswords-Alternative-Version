::mods_hookExactClass("items/supplies/cured_rations_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. These rations consist of assorted, well cured meats and vegetables that are sealed in small boxes. The ideal provision to take with you on long journeys and expeditions. Can be eaten in battle to increase your HP recovery, Resolve and Defenses, based on the amount remaining. Will be used as provisions if left in the company stash.";
		this.m.Value = 250;
		this.m.Amount = 60.0;
	}

	o.onEquip = function()
	{
		this.legend_usable_food.onEquip();
		local skill = this.new("scripts/skills/actives/legend_eat_pudding_skill");
		skill.setItem(this);
		skill.setAmount(this.m.Amount);
		this.addSkill(skill);
	}

});