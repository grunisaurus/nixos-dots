{ config, pkgs, inputs, ... }:

{
	services.hyprpaper = {

		enable = true;
		
		settings = {

			wallpaper = [
                                {
                                
			                monitor = "";
                                        path = "/home/grunisaurus/wp/pokemon-emerald-waterfall-pixel-thumb.jpg"; 
                                        fit_mode = "cover";
                                }
                        ];
		};
	};
}
