local gt = this.getroottable();

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_default", function ( o )
{
	o.m.PossibleSkills.push("actives.kuangzhanshishuangfu01_01");
	o.m.PossibleSkills.push("actives.pseudohack");	
	o.m.PossibleSkills.push("actives.kuangzhanshishuangkandao01_01");
	o.m.PossibleSkills.push("actives.kuangzhanshishuangkandao01_02");
	o.m.PossibleSkills.push("actives.pseudomince");	
	o.m.PossibleSkills.push("actives.fangxuezhe_01");           //barbarian named axe
	o.m.PossibleSkills.push("actives.crcudgel_skill");			//barbarian named sword  blunt attack
	o.m.PossibleSkills.push("actives.crdecapitate");		  //barbarian named cleaver
	o.m.PossibleSkills.push("actives.crstrike");		  //spontoon	
});

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_swing", function ( o )
{
	o.m.PossibleSkills.push("actives.kuangzhanshishuangfu01_02");
	o.m.PossibleSkills.push("actives.zcroverwhelming");	
});

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_split", function ( o )
{
	o.m.PossibleSkills.push("actives.jab");	
	o.m.PossibleSkills.push("actives.zcroverwhelming");	
});

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_knock_out", function ( o )
{
	o.m.PossibleSkills.push("actives.canpodajian_01");	//barbarian named sword  stun attack
});

::mods_hookNewObject("ai/tactical/behaviors/ai_attack_bow", function ( o )
{
	o.m.PossibleSkills.push("actives.legend_piercing_bolt");	
});

::mods_hookNewObject("ai/tactical/behaviors/ai_warcry", function ( o )
{
	o.m.PossibleSkills.push("actives.kuangzhanshinuhou");	
});

::mods_hookNewObject("ai/tactical/behaviors/ai_boost_morale", function ( o )
{
	o.m.PossibleSkills.push("actives.crwhip");	
});


