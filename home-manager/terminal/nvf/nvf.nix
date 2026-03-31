{
  pkgs,
  ...
}: let
  spellfiles = builtins.path {
    name = "spellfiles";
    path = builtins.toString ./spell;
  };
in {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        vimAlias = true;
        options = {
            foldenable = false;
            # indentation options
            tabstop = 2;
            softtabstop = 2;
            expandtab = true;
            smartindent = true;
            shiftwidth = 2;
            # window options
            scrolloff = 10; # 10 lines will stay visible, top & bottom
            sidescrolloff = 10; # 10 cols will stay visible while scrolling left/right
        };

        additionalRuntimePaths = [
          spellfiles
        ];

        debugger.nvim-dap = {
          enable = true;
          ui.enable = true;
        };

        diagnostics = {
          enable = true;
          nvim-lint = {
            linters_by_ft = {
              javascript = [
                "eslint_d"
                "prettier"
              ];
              nix = [ "nix" ];
            };
          };
        };

        mini = {
          ai.enable = true; # around inside, not artificial intelligence :D
          icons.enable = true;
          comment.enable = true; # better commenting out a single line or code block
          indentscope.enable = true; # simple visual indentation marker, helpful for e.g. python
          cursorword.enable = true; # simply highlights the word where the cursor is at
          surround.enable = true; # add, delete or replace surroundings such as brackets
          move.enable = true; # moving lines or selections around in visual/normal mode
          pairs.enable = true; # always adds a closing bracket, etc.
          trailspace.enable = true; # highlights trailing spaces
        };

        spellcheck = {
          enable = true;
          languages = [
            "en"
            "de"
          ];
        };

        extraPlugins = with pkgs.vimPlugins; {
          vimtex = {
            package = vimtex;
            setup = ''
              vim.g.vimtex_compiler_enabled = 1
              vim.g.vimtex_compiler_method = latexmk
            '';
          };
        };

        autocomplete = {
          nvim-cmp.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        languages = {
          #general settings
          enableDAP = true; # enables debugger adapter for the enabled languages by default
          enableFormat = true;
          enableTreesitter = true; # enables treesitter by default for all the languages
          enableExtraDiagnostics = true;

          #languages
          assembly.enable = true;
          zig.enable = true;
          go.enable = true;
          python.enable = true;
          ts = {
                enable = true;
                extensions.ts-error-translator.enable = true;
          };
          css.enable = true;
          bash.enable = true;
          nix = {
            enable = true;
            lsp.servers = [ "nixd" ];
          };
          java.enable = true;
        };

        treesitter = {
          context.enable = true;
          fold = true;
        };

        # fuzzy finding in files, etc.
        telescope = {
          enable = true;
          setupOpts.defaults.color_devicons = true;
        };

        theme = {
          enable = true;
          name = "everforest";
          style = "hard";
        };

        visuals = {
          nvim-web-devicons.enable = true;
        };
      };
    };
  };
}
