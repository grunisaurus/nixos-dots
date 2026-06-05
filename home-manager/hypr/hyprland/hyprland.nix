{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Lua-Config (Hyprland 0.55+). hyprland.lua hat Vorrang vor generierter
  # hyprland.conf, falls beide existieren.
  xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;

  # Config kommt aus hyprland.lua (siehe oben), nicht aus settings.
  wayland.windowManager.hyprland = {
    #   enable = true;
    xwayland.enable = true;
    #settings = {};
  };
}
