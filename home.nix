{ config, pkgs, ... }:

{
  home.username = "mika";
  home.homeDirectory = "/home/mika";
  nixpkgs.config.allowUnfree = true;

  targets.genericLinux.enable = true;

  home.stateVersion = "26.05";
  home.packages = with pkgs; [

    curl
    wget
    ripgrep
    fd
    fzf
    jq
    zoxide
    bat
    unzip
    tree
    htop
    fastfetch
    bc
    lsd

    kdePackages.kdeconnect-kde

    brave
    firefox

    zed-editor

    qbittorrent

    rustdesk
    fontconfig
    spotify
    obsidian

    nil
    nixd

    xdg-utils
  ];

  home.activation.linkDesktopApplications = {
    after = [ "writeBoundary" "createXdgUserDirectories" ];
    before = [ ];
    data = ''
      rm -rf ${config.xdg.dataHome}/nix-desktop-files/applications
      mkdir -p ${config.xdg.dataHome}/nix-desktop-files/applications
      cp -Lr ${config.home.homeDirectory}/.nix-profile/share/applications/* ${config.xdg.dataHome}/nix-desktop-files/applications/
    '';
  };
  xdg.enable = true;
  xdg.systemDirs.data = [ "${config.xdg.dataHome}/nix-desktop-files" ];

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      format = "$directory$git_branch$git_status$character";

      character = {
        success_symbol = "->";
        error_symbol = "x>";
      };

      directory = {
        truncation_length = 3;
      };
    };
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      background-opacity = 0.97
      ;
      background-blur-radius = 32;
      font-size = 13;
      window-decoration = true;
      cursor-color = "#f5e0dc";
      cursor-text = "#1e1e2e";
      cursor-style-blink = true;

      theme = "Catppuccin Mocha";
    };
  };

  programs.neovim = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      z = "zoxide";
      update = "home-manager switch";
    };

    initContent = ''
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
    '';
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "szymky";
        email = "mikaroebers@proton.me";
      };
      init.defaultBranch = "main";
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      mgr = {
        show_hidden = true;
        show_symlink = true;
      };
    };

  };



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mika/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
}
