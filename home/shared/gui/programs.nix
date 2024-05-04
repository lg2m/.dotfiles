{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Chat
    slack
    discord

    # Development
    vscode

    # Music
    spotify

    # Productivity
    obsidian

    # Misc
    ffmpeg-full
  ];
}
