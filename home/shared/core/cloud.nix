{ pkgs, ... }: {
  home.packages = with pkgs; [
    docker-compose
    dive
    lazydocker
    kubectl
    istioctl
    kubevirt
    kubernetes-helm
    fluxcd
    argocd
  ];

  programs = {
    k9s = {
      enable = true;
    };
  };
}
