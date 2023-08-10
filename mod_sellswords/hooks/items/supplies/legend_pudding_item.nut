::mods_hookExactClass("items/supplies/legend_pudding_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. A huge pudding made from fresh ingredients. Can be eaten in battle to increase your HP recovery, Resolve and Defenses, based on the amount remaining.";
		this.m.Value = 135;
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