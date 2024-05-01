{ config, ... }: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;

    settings = {
      add_newline = false;
      command_timeout = 1000;
      scan_timeout = 3;
      character = {
        error_symbol = "[›](bold red)";
        success_symbol = "[›](bold green)";
        vicmd_symbol = "[›](bold yellow)";
        format = "$symbol [|](bold bright-black) ";
      };
      git_commit = {commit_hash_length = 7;};
      line_break.disabled = false;
      lua.symbol = "[](blue) ";
      python.symbol = "[](blue) ";
      aws = {
        symbol = "🅰  ";
      };
      hostname = {
        ssh_only = true;
        format = "[$hostname](bold blue) ";
        disabled = false;
      };
    };
  };
}
