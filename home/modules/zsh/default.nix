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
    ".zshrc".source = ./zshrc;
    ".zprofile".source = ./zprofile;
  };

  xdg.configFile = {
    "zsh" = {
      source = ./zsh;
      recursive = true; # To be able to add more files using `xdg.configFile."zsh/rc.d/foo.zsh"`
    };
  };
}

