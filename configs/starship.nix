{ ... }:

{
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
}
