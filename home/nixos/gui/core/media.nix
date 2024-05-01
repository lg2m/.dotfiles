{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Audio control
    pavucontrol
    playerctl
    pulsemixer

    cava # Audio visualizer
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [pkgs.mpvScripts.mpris];
    };
  };

  services = {
    playerctld.enable = true;
  };
}
