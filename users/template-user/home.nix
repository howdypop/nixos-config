# users/template-user/home.nix

{ ... }:

{
  # Set once per machine using the value from the installer-generated configuration. Once set, do not ever change it.
  home.stateVersion = "xx.xx";
  programs.home-manager.enable = true;
}
