foreach(script in [
	"warwolf",
	"warhound",
	"wardog",
])
{
	::mods_hookExactClass("entity/tactical/" + script, function(o) {
		local onInit = o.onInit;
		o.onInit = function()
		{
			onInit();

			if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 50)
			{
				b.MeleeSkill += 2;
				b.Bravery += 5;

				if (this.World.getTime().Days >= 100)
				{	
					b.MeleeDefense += 2;
					b.Hitpoints += 5;

					if (::Is_PTR_Exist)
					{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_strength_in_numbers"));	
					}		

					if (this.World.getTime().Days >= 150)
					{										
						b.MeleeSkill += 3;			
						b.MeleeDefense += 3;			
						b.Bravery += 5;
						if (this.World.getTime().Days >= 200)
						{
							if (::Is_PTR_Exist)
							{
								this.m.Skills.add(this.new("scripts/skills/perks/perk_ptr_pattern_recognition"));	
							}		
							
							b.Hitpoints += 5;													
						}		
					}
				}
			}				
		}
	});
}