{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      background-opacity = 0.97;
      background-blur-radius = 32;
      font-size = 13;
      window-decoration = true;
      cursor-color = "#f5e0dc";
      cursor-text = "#1e1e2e";

      theme = "Catppuccin Mocha";
    };
  };
}
