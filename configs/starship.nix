{ ... }:

{
  programs.starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        add_newline = false;

        format = "$os$username$hostname$directory$git_branch$git_status$cmd_duration$sudo$character";

        directory = {
          style = "bold cyan";
          truncation_length = 3;
          truncate_to_repo = true;
        };

        git_branch = {
          symbol = " ";
          style = "bold purple";
          format = "on [$symbol$branch]($style) ";
        };

        git_status = {
          style = "bold red";
          format = "([\\[$all_status$ahead_behind\\]]($style) )";
          conflicted = "=";
          ahead = "⇡\${count}";
          behind = "⇣\${count}";
          diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
          untracked = "?";
          stashed = "\\$";
          modified = "!";
          staged = "+";
          renamed = "»";
          deleted = "✘";
        };

        cmd_duration = {
          min_time = 2000;
          format = "took [$duration]($style) ";
          style = "yellow bold";
        };

        sudo = {
          symbol = "🧙 ";
          style = "bold red";
          disabled = false;
        };

        character = {
          success_symbol = "[❯](bold green)";
          error_symbol = "[❯](bold red)";
          vimcmd_symbol = "[❮](bold green)";
        };
      };
    };
}
