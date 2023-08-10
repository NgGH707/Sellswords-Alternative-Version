::mods_hookExactClass("items/supplies/legend_yummy_sausages", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. These sausages sure look yummy! Can be eaten in battle to increase your Fatigue recovery, hitchance and initiative, based on the amount remaining. Will be gradually used as provisions if left in the company stash.";
		this.m.Value = 55;
		this.m.Amount = 20.0;
	}

	o.onEquip = function()
	{
		this.legend_usable_food.onEquip();
		local skill = this.new("scripts/skills/actives/legend_eat_rations_skill");
		local skill = this.new("scripts/skills/actives/legend_eat_pie_skill");
		skill.setItem(this);
		skill.setAmount(this.m.Amount);
		this.addSkill(skill);
	}

});