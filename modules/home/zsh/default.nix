{ ... }:
{
  flake.modules.homeManager.zsh =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.zsh
        pkgs.zsh-completions
        pkgs.oh-my-zsh
        pkgs.zsh-autosuggestions
        pkgs.zsh-syntax-highlighting
        pkgs.nix-zsh-completions
      ];

      home.file = {
        ".zshrc".source = ./_config/zshrc;
        ".zprofile".source = ./_config/zprofile;
      };

      xdg.configFile = {
        "zsh" = {
          source = ./_config/zsh;
          recursive = true; # To be able to add more files using `xdg.configFile."zsh/rc.d/foo.zsh"`
        };
      };
    };
}
