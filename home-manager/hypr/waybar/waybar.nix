{ input, pkgs, ... }:

{
	programs.waybar = {
		enable = true;
		style = ''${builtins.readFile ./waybar.css}'';
		
		settings = [
			{
				layer = "top";
				position = "top";
				height = 30;


				mod = "dock";

				modules-left = [
					"hyprland/workspaces"
				];

				modules-center = [
					"hyprland/window"
				];

				modules-right = [
					"network"
					"battery"
					"clock"
				];

				# declaration of modules

				"hyprland/workspaces" = {
					disable-scroll = true;
					all-outputs = true;
					on-click = "activate";
				};

				"hyprland/window" = {
					format = "{}";
					max-length = 30;
					tooltip = false;
				};

				network = {
					interval = 5;
					format-wifi = "ᯤ {essid} - {signalStrength}%";
					format-no-connection = "Not connected!";
					format-alt = " {ipaddr}/{cidr}";
					tooltip = false;
				};

				battery = {
					interval = 10;
					status = {
						warning = 20;
						critical = 10;
					};
					format = "🪫 {capacity}%";
					format-charging = "🔋 {capacity}%";
					tooltip = false;
				};

				clock = {
					interval = 10;
					format = "{:%H: %M   %d %m %Y}";
					tooltip = false;
				};

			}
		
		];
	};


}
