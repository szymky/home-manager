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

    btop

    gnupg

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


  imports = [
    ./configs/configs.nix
  ];




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
