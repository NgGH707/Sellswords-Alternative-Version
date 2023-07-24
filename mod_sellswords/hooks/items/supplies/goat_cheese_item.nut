::mods_hookExactClass("items/supplies/goat_cheese_item", function(o) {
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Description = "Provisions. Goat cheese is a tasty and rich food that is common and popular especially in the colder regions of the north. Can be eaten in battle to increase your HP recovery, Resolve and Defenses, based on the amount remaining.";
		this.m.Amount = 30.0;		
		this.m.IsAllowedInBag = true;	
	}

	o.onPutIntoBag <- function()
	{
		this.onEquip();
	}	
	
	o.onEquip <- function()
	{
		this.legend_usable_food.onEquip();
		local skill = this.new("scripts/skills/actives/legend_eat_pudding_skill");
		skill.setItem(this);
		skill.setAmount(this.m.Amount);
		this.addSkill(skill);
	}	

});