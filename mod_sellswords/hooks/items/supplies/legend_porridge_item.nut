::mods_hookExactClass("items/supplies/legend_porridge_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. A staple meal that can be made from whatever ingredients are to hand. Can be eaten in battle to increase your HP recovery, Resolve and Defenses, based on the amount remaining. Will be gradually used as provisions if left in the company stash.";
		this.m.Amount = 45.0;
	}

	o.onEquip = function()
	{
		this.legend_usable_food.onEquip();
		local skill = this.new("scripts/skills/actives/legend_eat_pudding_skill");
		skill.setAmount(this.m.Amount);		
		skill.setItem(this);
		this.addSkill(skill);
	}

});