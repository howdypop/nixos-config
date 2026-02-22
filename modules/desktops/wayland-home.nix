# modules/desktops/wayland-home.nix

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    superfile

    waybar
    mako
    swww
    wofi
  ];

  home.file."Pictures/Wallpapers" = {
    source = ../../users/${config.home.username}/wallpapers;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$menu" = "wofi --show drun";
      "$fm" = "alacritty -e superfile";

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      "exec-once" = [
        "mako"
        "waybar"
        "swww-daemon"
        "swww img ${config.home.homeDirectory}/Pictures/Wallpapers/wallpaper.png"
      ];

      input = {
        kb_layout = "se";
      };

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod, R, exec, $menu"
        "$mod, E, exec, $fm"
        "$mod, Q, killactive"
        "$mod SHIFT, Q, exit"
      ];
    };
  };
}
