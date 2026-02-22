# users/howdypop/git.nix

{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "howdypop";
      user.email = "howdypop3000@gmail.com";
      init.defaultBranch = "main";
    };
  };
}
