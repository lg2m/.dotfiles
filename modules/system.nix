{ pkgs, ... }: let
  username = "zmeyer";
in {
  nix.settings = {
    trusted-users = [username];

    # Enable flakes globally
    experimental-features = ["nix-command" "flakes"];

    # Substituters that will be considered before the official ones (https://cache.nixos.org)
    substituters = [
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    builders-use-substitutes = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  fonts = {
    packages = with pkgs; [
      # Icon fonts
      material-design-icons

      # Normal fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      # Nerdfonts
      (nerdfonts.override { fonts = ["FiraCode" "JetBrainsMono"]; })
    ];

    # Use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };

  programs.dconf.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.picom.enable = true;
  
  # This needs to be moved to desktop stuff
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # KDE Plasma Desktop Environment
    desktopManager = {
      xterm.enable = false;
      wallpaper.mode = "fill";
    };
    # desktopManager.plasma5.enable = true;

    displayManager = {
      lightdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [i3status i3lock i3blocks];
    };
    
    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.displayManager = {
    autoLogin = {
      enable = true;
      user = username;
    };

    defaultSession = "none+i3";
  };

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
