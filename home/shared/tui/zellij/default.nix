let
  shellAliases = {
    "zj" = "zellij";
  };
in {
  programs.zellij = {
    enable = true;
  };

  # Auto start zellij nushell
  programs.nushell.extraConfig = ''
    # Auto start zellij
    # Except in cases where we are in zellij
    if (not ("ZELLIJ" in $env)) {
      if "ZELLIJ_AUTO_ATTACH" in $env and $env.ZELLIJ_AUTO_ATTACH == "true" {
        ^zellij attach -c
      } else {
        ^zellij
      }

      # Auto exit the shell session when zellij exits
      $env.ZELLIJ_AUTO_EXIT = "false"
      if "ZELLIJ_AUTO_EXIT" in $env and $env.ZELLIJ_AUTO_EXIT == "true" {
        exit
      }
    }
  '';

  # only works in bash/zsh, not nushell
  home.shellAliases = shellAliases;
  programs.nushell.shellAliases = shellAliases;
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
