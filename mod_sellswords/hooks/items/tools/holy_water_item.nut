::mods_hookExactClass("items/tools/holy_water_item", function ( o )
{
	local ws_onEquip = o.onEquip;
	o.onEquip = function ()
	{
		ws_onEquip();

		local skill = ::new("scripts/skills/actives/throw_holy_water_pro");
		skill.setItem(this);
		this.addSkill(skill);		
		skill = ::new("scripts/skills/actives/throw_holy_water_focus");
		skill.setItem(this);
		this.addSkill(skill);		
	};
});