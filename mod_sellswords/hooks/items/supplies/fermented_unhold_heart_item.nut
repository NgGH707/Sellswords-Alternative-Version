::mods_hookExactClass("items/supplies/fermented_unhold_heart_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Value = 275;
		this.m.Amount = 30.0;
	}

	o.onEquip = function()
	{
		this.legend_usable_food.onEquip();
		local skill = this.new("scripts/skills/actives/legend_eat_rations_skill");
		local skill = this.new("scripts/skills/actives/legend_eat_porridge_skill");
		skill.setItem(this);
		skill.setAmount(this.m.Amount);
		this.addSkill(skill);
	}

});