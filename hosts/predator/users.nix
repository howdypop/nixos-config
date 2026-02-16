# hosts/predator/users.nix

{ lib, ... }:

let
  users = {
    howdypop = { extraGroups = [ "wheel" "networkmanager" ]; };
  };
in
{
  users.users = lib.mapAttrs (_username: user: {
    isNormalUser = true;
    extraGroups = user.extraGroups or [ ];
  }) users;

  home-manager.users = lib.mapAttrs (username: _user:
    import (../../users + "/${username}/home.nix")
  ) users;
}
