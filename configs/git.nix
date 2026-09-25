{ ... }:
{
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
}
