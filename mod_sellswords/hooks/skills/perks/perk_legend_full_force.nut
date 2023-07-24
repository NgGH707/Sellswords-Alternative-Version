::mods_hookExactClass("skills/perks/perk_legend_full_force", function ( o )
{
	local ws_create = o.create;
	o.create = function()
	{
		ws_create();
		this.m.Name = "Immovable Object";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
	}

	o.getDescription <- function()
	{
		return "Put your full weight into defending every blow and gain [color=" + this.Const.UI.Color.PositiveValue + "]+10%[/color] of the combined fatigue modifier from body, head, main hand and off hand as Damage output bonus.\n• You will also have the weak steadfast effect if the combined fatigue modifier from body, head and off hand is above 50.\n• Besides, the weak steadfast effect upgrades to steadfast if it is above 65. \n• Additionally, you will grant immue to stun if it is above 80.";
	}		

	o.getTooltip <- function()
	{
		local tooltip = this.skill.getTooltip();

		local fat = 0;
		local crfat = 0;
		local body = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local head = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local offhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (body != null)
		{
			fat = fat + body.getStaminaModifier();
			crfat = crfat - body.getStaminaModifier();
		}

		if (head != null)
		{
			fat = fat + head.getStaminaModifier();
			crfat = crfat - head.getStaminaModifier();			
		}

		if (mainhand != null)
		{
			fat = fat + mainhand.getStaminaModifier();
		}

		if (offhand != null)
		{
			fat = fat + offhand.getStaminaModifier();
			crfat = crfat - offhand.getStaminaModifier();			
		}

		local bonus = this.Math.abs(fat / 10);		
		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "[/color] Melee Damage"
		});
		tooltip.push({
			id = 10,
			type = "text",
			icon = "ui/icons/fatigue.png",
			text = "Current effective armor wight is [color=" + this.Const.UI.Color.PositiveValue + "]" + crfat + "[/color] ."			
		});		
		return tooltip;
	}
	
	o.onUpdate = function( _properties )
	{
		local fat = 0;
		local crfat = 0;
		local body = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local head = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		local mainhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local offhand = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (body != null)
		{
			fat = fat + body.getStaminaModifier();
			crfat = crfat - body.getStaminaModifier();
		}

		if (head != null)
		{
			fat = fat + head.getStaminaModifier();
			crfat = crfat - head.getStaminaModifier();			
		}

		if (mainhand != null)
		{
			fat = fat + mainhand.getStaminaModifier();
		}

		if (offhand != null)
		{
			fat = fat + offhand.getStaminaModifier();
			crfat = crfat - offhand.getStaminaModifier();			
		}

		local bonus = this.Math.abs(fat / 10);
		_properties.DamageRegularMin += this.Math.floor(bonus);	
		_properties.DamageRegularMax += this.Math.floor(bonus);		
		
		if (crfat >= 50)
		{
			_properties.FatigueReceivedPerHitMult *= 0.334;
			_properties.FatigueLossOnBeingMissedMult *= 0.334;			
		}
		
		if (crfat >= 65)
		{
			_properties.FatigueReceivedPerHitMult *= 0.3;
			_properties.FatigueLossOnBeingMissedMult *= 0.3;			
		}

		if (crfat >= 80)
		{
			_properties.IsImmuneToStun = true;			
		}		
	}

});	