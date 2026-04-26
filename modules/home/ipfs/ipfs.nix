{ ... }:
{
  flake.modules.homeManager.ipfs =
    { ... }:
    {
      programs.zsh.initContent = ''
        export IPFS_PATH="$XDG_DATA_HOME/ipfs"
      '';
    };
}
