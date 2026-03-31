{input, pkgs, inputs, ...}:

let
	wallpaper = pkgs.fetchurl {
		url = "https://images4.alphacoders.com/135/1354019.png";
		hash = "sha256-FMKDZ4/X8B4wMtkxV0YBlZCICE5sYBZvAEAVdsaS5jc=";
	};
in
{
	programs.hyprlock = {
		enable = true;
		
		package = inputs.hyprlock.packages.${pkgs.system}.default;
		settings = {
			general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          monitor = "";
          path = "${ builtins.toString wallpaper }";
          color = "rgb(36, 39, 58)";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''$TIME'';
          text_align = "center";
          color = "rgb(202, 211, 245)";
          font_size = "35";
          position = "0, -80";
          halign = "center";
          valign = "top";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "200, 50";
          position = "0, 5";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = 
              ''<span foreground="##cad3f5">Password...</span>'';
          shadow_passes = 2;
        }
      ];
		};
	};

}
