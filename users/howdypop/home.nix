# users/howdypop/home.nix

{ ... }:

{
  imports = [ ./git.nix ];

  # Set once per machine using the value from the installer-generated configuration. Once set, do not ever change it.
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
