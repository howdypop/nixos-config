# modules/desktops/wayland-system.nix

{ pkgs, ... }:

let
  servicesSettings = {
    services.dbus.enable = true;
  };

  audioSettings = {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };

  portalSettings = {
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };
  };
in
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
  // servicesSettings
  // audioSettings
  // portalSettings
