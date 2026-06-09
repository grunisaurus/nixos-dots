{...}: {
  imports = [
    # terminals
    ./ghostty
    ./kitty
    # terminal multiplexer for sessions and windows
    ./tmux
    # Nvim wrapper with nix flavour
    ./nvf
  ];
}
