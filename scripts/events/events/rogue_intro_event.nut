this.rogue_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.rogue_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/pics/pic_rogue_02.png[/img]{Welcome to the Rogue Mode.\n\n\nHow to build a warband?\n\nAt the end of each battle, a new character will join your ranks whose level depends on the average level of the team.\n\nBuy supplies and equipment at the store.\n\nAfter every five victories, you will receive prizes. Additionally, a special tournament will become available, and participating in and winning it will be particularly rewarding.\n\n\n\nThe interval between participating in the competition cannot exceed three days.}",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "And that\'s what I\'ll do.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "Rogue Mode";
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});

