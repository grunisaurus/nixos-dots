# NixOS & Home-Manager Configuration

## First of all: What is NixOS?

NixOS is a Linux derivation which is built around the Nix Package-Manager. It is configured in the Nix programming language and follows a functional, declarative approach.  
It stores its packages the nix store which enables many powerful features like rolling back to older versions if you accidentally break something or having multiple versions of the same package, identified by a unique hash, installed which removes dependecy hell problems, etc..  
[For further information check out the amazing docs!](https://nixos.org/guides/how-nix-works/)

## Tech-Stack :)

**OS:** NixOS (Unstable Channel)  
**WM**: Hyprland - [Fast, tiling wayland compositor with amazing looks](https://hypr.land/)  
**Terminal**: Ghostty - [It's fast and native and simply an amazing terminal emulator!](https://ghostty.org/)  
**Editor**: NVF - [Neovim but Nix flavoured :)](https://nvf.notashelf.dev/index.html) 

## What's next?

- Restructure the projects files:
    - Use default.nix files for imports
    - Split files like the configuration.nix into multiple modules
    - Create the classical hosts folder to support multiple different host configurations
    - Create more dev environments
- Add a new host (desktop)

