::mods_hookExactClass("items/supplies/smoked_ham_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. There are many ways to preserve food. This piece of ham has been treated in a smoking hut. Can be eaten in battle to increase your Fatigue recovery, hitchance and initiative, based on the amount remaining. Will be gradually used as provisions if left in the company stash.";
	}

	o.onEquip = function()
	{
		this.legend_usable_food.onEquip();
		
		local skill = this.new("scripts/skills/actives/legend_eat_pie_skill");
		skill.setItem(this);
		skill.setAmount(this.m.Amount);
		this.addSkill(skill);
	}

});