::mods_hookExactClass("items/supplies/dried_fish_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. Fish is a common and filling food in coastal regions. It is dried to preserve it. Can be eaten in battle to increase your Fatigue recovery, hitchance and initiative, based on amount of the food. Will be used as provisions if left in the company stash.";
		this.m.Value = 85;
		this.m.Amount = 25.0;
		this.m.GoodForDays = 10;
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