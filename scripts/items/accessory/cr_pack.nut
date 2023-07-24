this.cr_pack <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.cr_pack";
		this.m.Name = "Portabal Bag";
		this.m.Description = "A backpack worn by merchants to carry many more supplies";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "accessory/cr_pack.png";
		this.m.Icon = "accessory/cr_pack.png";
		this.m.Sprite = "bust_ac_cr_1";
		this.m.IconLarge = "accessory/legend_pack_large.png";
		this.m.Icon = "accessory/legend_pack_large.png";
		this.m.Sprite = "legend_pack_large";		
		this.m.StaminaModifier = -3;
		this.m.Value = 1500;		
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];

		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] Bag Slot"
		});

		return result;
	}
			
	function onEquip()
	{
		this.accessory.onEquip();
		if (!this.getContainer().getActor().getSkills().hasSkill("perk.bags_and_belts"))
		{
			this.getContainer().getActor().getItems().setUnlockedBagSlots(3);
		}					
	}	

	function onUnequip()
	{
		this.accessory.onUnequip();		
		//this.getContainer().getActor().getSkills().removeByID("effects.cr_bag");
		if (!this.getContainer().getActor().getSkills().hasSkill("perk.bags_and_belts"))
		{
			this.getContainer().getActor().getItems().setUnlockedBagSlots(2);
		}		
	}
	
	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/cloth_01.wav", this.Const.Sound.Volume.Inventory);
	}

});

