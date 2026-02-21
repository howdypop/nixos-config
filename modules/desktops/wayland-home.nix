# modules/desktops/wayland-home.nix

{ config, pkgs, ... }:

let
  home.file."Pictures/Wallpapers" = {
    source = ../../users/${config.home.username}/wallpapers;
    recursive = true;
  };
in
{
  home.packages = with pkgs; [
    alacritty
    superfile

    waybar
    mako
    swww
    wofi
  ];

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
        "swww init"
        "swww img ${config.home.homeDirectory}/Pictures/Wallpapers/wallpaper.png"
      ];

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
  // wallpapersSettings
