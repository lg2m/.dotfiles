{ pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neofetch
    helix
    wget
    curl
    git
    sysstat
    scrot
    xfce.thunar
    nnn
    udiskie
  ];

  # replace default editor with helix
  environment.variables.EDITOR = "hx";
}
