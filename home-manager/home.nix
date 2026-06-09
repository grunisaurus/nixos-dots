{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./terminal
    ./hypr
    ./applications
    ./utilities
  ];
  home = {
    username = "grunisaurus";
    homeDirectory = "/home/grunisaurus";
    stateVersion = "26.05";
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
