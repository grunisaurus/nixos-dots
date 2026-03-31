{ input, pkgs, ... }:


{
	programs.kitty = {
		enable = true;
		font = {
			name = "Fira Code";
			size = 8;
		};
		settings = {
			mouse_hide_wait = "2.0";
			url_color = "#0087bd";
			url_style = "dotted";
			bold_font = "auto";
			italic_font = "auto";
			cursor_shape = "beam";
		};
	};
}

