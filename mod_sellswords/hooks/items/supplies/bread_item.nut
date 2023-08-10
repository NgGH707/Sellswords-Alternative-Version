::mods_hookExactClass("items/supplies/bread_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. Light bread made from wheat makes for a filling meal. Can be eaten in battle to increase your HP recovery, Resolve and Defenses, based on amount of the food. Will be gradually used as provisions if left in the company stash.";
		this.m.Value = 120;
		this.m.Amount = 35.0;
		this.m.IsAllowedInBag = true;
		this.m.IsDroppedAsLoot = true;	
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