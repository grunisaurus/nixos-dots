{...}: {
  # creates a symlink to the nix store for the config file
  xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;

  wayland.windowManager.hyprland = {
    #   enable = true;
    xwayland.enable = true;
    #settings = {};
  };
}
