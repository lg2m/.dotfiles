{ pkgs, ... }: {
  home.packages = with pkgs; [
    docker-compose
    dive
    lazydocker
    kubectl
    istioctl
    kubevirt
    kubernetes-helm
  ];

  programs = {
    k9s = {
      enable = true;
    };
  };
}
