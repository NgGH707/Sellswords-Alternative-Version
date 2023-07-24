::mods_hookExactClass("skills/perks/perk_battle_forged", function ( o )
{
	o.getDescription = function()
	{
		return "Specialize in heavy armor! Armor damage taken is reduced by a percentage equal to [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.ArmorPercentageAsReduction + "[/color] of the current total armor value of both body and head armor, while the value is capped as [color=" + this.Const.UI.Color.NegativeValue + "]10[/color] times as the armor\'s total weight, the bonus is increased to two times when the value is between [color=" + this.Const.UI.Color.PositiveValue + "]400[/color] and [color=" + this.Const.UI.Color.PositiveValue + "]600[/color] whereas decreased to half after that, all benefits are cumulative. The heavier your armor and helmet, the more you benefit.";
	}

	o.getReductionPercentage = function()
	{
		local fat = this.getContainer().getActor().getItems().getStaminaModifier([::Const.ItemSlot.Body, ::Const.ItemSlot.Head]);
		local armor = this.getContainer().getActor().getArmor(this.Const.BodyPart.Head) + this.getContainer().getActor().getArmor(this.Const.BodyPart.Body);
		armor = this.Math.min(-6 * fat + 400, armor);
		return this.Math.max(this.Math.floor(armor * 0.05), this.Math.min(this.Math.floor((armor + 1000) * 0.025), this.Math.floor((armor - 200) * 0.1)));
	}

});	