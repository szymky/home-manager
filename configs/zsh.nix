{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      z = "zoxide";
      update = "home-manager switch";
      zed = "zeditor";
    };

    initContent = ''

      eval "$(ssh-agent -s)"

      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
    '';
  };
}
