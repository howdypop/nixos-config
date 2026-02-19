# users/howdypop/packages.nix

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    bat
    eza
  ];
}
