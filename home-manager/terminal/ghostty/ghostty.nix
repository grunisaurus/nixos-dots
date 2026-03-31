{ ... }:

{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      theme = "Idle Toes";
      font-size = 10;
      background-opacity = 0.8;
    };
  };

}
