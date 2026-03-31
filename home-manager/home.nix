{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./terminal/nvf/nvf.nix
    ./terminal/kitty/kitty.nix
    ./terminal/tmux/tmux.nix
    ./hypr/hyprland/hyprland.nix
    ./hypr/hyprpaper/hyprpaper.nix
    ./hypr/waybar/waybar.nix
    ./hypr/hyprlock/hyprlock.nix
    ./terminal/ghostty/ghostty.nix
    ./launcher/fuzzel.nix
  ];
  home = {
    username = "grunisaurus";
    homeDirectory = "/home/grunisaurus";
    stateVersion = "24.11";
    #file.".config/ghostty/config".force = true;
  };

  programs.home-manager.enable = true;

  xdg.mimeApps = {
    enable = true;

    associations.added = {
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
    defaultApplications = {
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "grunisaurus";
        email = "nils24603@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    waybar
  ];
}
