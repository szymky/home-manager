{ pkgs, lib, ... }:

{

  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [

      nil
      nixfmt

      vscode-langservers-extracted
      bash-language-server
      marksman

      texlab
      rust-analyzer

      rustfmt
      clippy

      clang-tools

      taplo
      yaml-language-server
     
    ];
    
    settings = {
      theme = "dracula";

      editor = {

        line-number = "relative";
        mouse = true;
        scrolloff = 8;
        cursorline = true;
        auto-pairs = true;
        completion-trigger-len = 1;
        bufferline = "multiple";

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        file-picker = {
          hidden = false;
        };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        indent-guides = {
          render = true;
          character = "|";
        };
      };

      keys.normal = {
        "space" = {
          "w" = ":w";
          "q" = ":q";
        };

        "esc" = [ "collapse_selection" "keep_primary_selection" ];
      };
      
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.nixfmt;
          };
        }
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "cpp";
          auto-format = true;
        }
        {
          name = "c";
          auto-format = true;
        }
        {
          name = "markdown";
          auto-format = true;
        }
        {
          name = "latex";
          auto-format = true;
        }
      ];
    };
  };

}
