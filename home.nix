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
    less
    bat
    unzip
    tree
    htop
    fastfetch
    bc
    lsd
    btop
    gnupg
    brave
    qbittorrent
    fontconfig
    obsidian
    nil
    nixd
    xdg-utils
    halloy
    opencode
    lazygit
    zathura
    lunar-client
  ];

  home.activation.linkDesktopApplications = {
    after = [
      "writeBoundary"
      "createXdgUserDirectories"
    ];
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

  home.file = { };

  home.sessionVariables = {
    EDITOR = "hx";
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  programs.home-manager.enable = true;
}
