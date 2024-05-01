{ config, ... }: let
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in
{
  home.homeDirectory = "/home/zmeyer";

  # env vars
  home.sessionVariables = {
    # clean up ~
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";

    # set default applications
    BROWSER = "firefox";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";
  };
}
