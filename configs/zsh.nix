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

    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "git -C ~/.config/home-manager pull && home-manager switch";
      zed = "zeditor";
      cat = "bat --plain";
    };

    initContent = ''
      if [ -z "$SSH_AUTH_SOCK" ]; then
        eval "$(ssh-agent -s)" > /dev/null
      fi
      ssh-add -q ~/.ssh/id_* 2>/dev/null || true
    '';
  };
}
