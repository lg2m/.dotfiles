let
  shellAliases = {
    urldecode =
      "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    urlencode =
      "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    work = "cd ~/Development/repository/gitlab.com/syntiant-all";
    personal = "cd ~/Development/repository/github.com/lg2m";
    docs = "cd ~/Documents";
    dls = "cd ~/Downloads";
    g = "git";
    cls = "clear";
    ll = "ls -l";
    la = "ls -la";
  };
in {
  # only works in bash/zsh, not nushell
  home.shellAliases = shellAliases;

  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    inherit shellAliases;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
