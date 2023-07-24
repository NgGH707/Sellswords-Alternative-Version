foreach (b in [
	"legend_rune_poison_blueprint",
	"legend_rune_feeding_blueprint",
	"legend_rune_bleeding_blueprint",
])
{
	::mods_hookExactClass("crafting/blueprints/mod_legend/runes/" + b, function(o) {
		// Overwrite create function to remove this rune from blueprints
		o.create = function ()
		{
		}
	});	
}