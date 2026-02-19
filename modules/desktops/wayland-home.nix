# modules/desktops/wayland-home.nix

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    rofi
    mako
  ];

  wayland.windowManager.hyprland.enable = true;
}
