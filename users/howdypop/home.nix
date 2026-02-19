# users/howdypop/home.nix

{ config, ... }:

let
  packageSettings = {
    nixpkgs.config.allowUnfree = true;
  };
in
{
  imports = [
    ./git.nix
    ./packages.nix
    ../../modules/desktops/wayland-home.nix
  ];

  # Set once per machine using the value from the installer-generated configuration. Once set, do not ever change it.
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
  // packageSettings
