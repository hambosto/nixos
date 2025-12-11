{ lib }:
{
  relativeToConfig = lib.path.append ../config/.;
  sourceLua =
    path:
    let
      name = builtins.baseNameOf path;
      sourcePath = "nvim/lua/plugins/extras/${path}";
      key = "nvim/lua/plugins/${name}";
    in
    {
      "${key}".source = lib.lazyvim.relativeToConfig sourcePath;
    };
}
