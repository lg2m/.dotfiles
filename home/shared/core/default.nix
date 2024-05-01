{
  imports = [
    ./core.nix
    ./cloud.nix
    ./editors
    ./git.nix
    # This must come before shells
    ./starship.nix
    ./shells
    ./zellij.nix
  ];
}
