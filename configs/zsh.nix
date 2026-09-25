{ ... }:

{

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      update = "home-manager switch";
      zed = "zeditor";
    };

    initContent = ''

      eval "$(ssh-agent -s)"
      eval "$(starship init zsh)"
    '';
  };
}
