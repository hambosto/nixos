{ lib }:
rec {
  deepMerge =
    attrs:
    let
      merge =
        path:
        builtins.zipAttrsWith (
          n: values:
          if builtins.tail values == [ ] then
            builtins.head values
          else if builtins.all builtins.isList values then
            lib.unique (lib.concatLists values)
          else if builtins.all builtins.isAttrs values then
            merge (path ++ [ n ]) values
          else
            lib.last values
        );
    in
    merge [ ] attrs;
  types.attrs.merge =
    _: definitions:
    let
      values = builtins.map (definition: definition.value) definitions;
    in
    deepMerge values;
}
