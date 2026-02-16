{ lib, pkgs, ... }:

let
  default = lib.mkDefault;
in
{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  environment.systemPackages = with pkgs; [
    git
  ];

  programs.zsh.enable = default true;
}
