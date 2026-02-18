# users/howdypop/git.nix

{ ... }:

{
  programs.git.settings = {
    enable = true;
    user.name = "howdypop";
    user.email = "howdypop3000@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
