# users/howdypop/git.nix

{ ... }:

{
  programs.git = {
    enable = true;
    userName = "howdypop";
    userEmail = "howdypop3000@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
