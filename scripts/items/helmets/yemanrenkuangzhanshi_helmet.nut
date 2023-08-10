this.yemanrenkuangzhanshi_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.yemanrenkuangzhanshi_helmet";
		this.m.Name = "Berserkers helmet";
		this.m.Description = "The helmet worn by the berserkers.";
		this.m.ShowOnCharacter = true;
		this.m.HideCharacterHead = false;
		this.m.HideCorpseHead = false;
		this.m.HideHair = false;
		this.m.HideBeard = false;
		this.m.IsDroppedAsLoot = true;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 1300;
		this.m.Condition = 130;
		this.m.ConditionMax = 130;
		this.m.StaminaModifier = -5;
		this.m.Vision = -1;
	}


	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "bust_yemanren_helmet_" + variant;
		this.m.SpriteDamaged = "bust_yemanren_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = "bust_yemanren_helmet_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "helmets/icon_bust_yemanren_helmet_" + variant + ".png";
	}

	
});

