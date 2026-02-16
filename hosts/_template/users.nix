{ lib, ... }:

let
  users = {
    template-user = { extraGroups = [ "wheel" "networkmanager" ]; };
  };
in
{
  users.users = lib.mapAttrs (_username: user: {
    isNormalUser = true;
    extraGroups = user.extraGroups or [ ];
  }) users;

  home-manager.users = lib.mapAttrs (username: _user:
    import (../../home + "/${username}/home.nix")
  ) users;
}
