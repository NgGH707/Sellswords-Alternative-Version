this.crknight_faction_helm_great_helm_faceplate_heavy_01 <- this.inherit("scripts/items/legend_helmets/hood/legend_helmet_enclave_bevor", {
	m = {},
	function create()
	{
		this.legend_helmet_enclave_bevor.create();
		this.m.ID = "armor.crknight_faction_helm_great_helm_faceplate_heavy_01";
		this.m.Name = "Bevor";
		this.m.Description = "A solid metal bevor.";
		this.m.Variants = [
			1
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 1200;
		this.m.Condition = 120;
		this.m.ConditionMax = 120;
		this.m.StaminaModifier = -8;
		this.m.Vision = 0;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_enclave_bevor" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_enclave_bevor" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_enclave_bevor" + "_" + variant + "_dead";
		this.m.IconLarge = "";		
		this.m.Icon = "legend_helmets/inventory_enclave_bevor" + "_" + variant + ".png";
	}

	function setupArmor( _variant )
	{
		local helm = this.new("scripts/items/legend_helmets/helm/legend_helmet_great_helm");
		helm.setVariant(1);
		this.setUpgrade(helm);
		local top;
		local r = this.Math.rand(0, 4);
		if (r == 0)
		{
			top = this.new("scripts/items/legend_helmets/top/legend_helmet_faceplate_curved");   //35,-2,300,-1
		}
		else if (r == 1)
		{
			top = this.new("scripts/items/legend_helmets/top/legend_helmet_faceplate_full_breaths");		//ss40,-2,375,-1
		}			
		else if (r == 2)
		{
			top = this.new("scripts/items/legend_helmets/top/legend_helmet_faceplate_snub_slit");		//45,-2,500,-1
		}
		else if (r == 3)
		{
			top = this.new("scripts/items/legend_helmets/top/legend_helmet_faceplate_long");		//ss45,-3,450,0
		}
		else if (r == 4)
		{
			top = this.new("scripts/items/legend_helmets/top/legend_helmet_faceplate_snub_nose");		//ss50,-3,550,-1
		}				
		this.setUpgrade(top);
		local flair = this.new("scripts/items/legend_helmets/vanity/legend_helmet_faction_helmet");
		flair.setVariant(_variant);
		this.setUpgrade(flair);
	}

});

