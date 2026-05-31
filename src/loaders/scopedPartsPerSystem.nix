# loaders/scopedPartsPerSystem.nix
{ ... }:
inputs: path: newCtx:
let
  imported = builtins.scopedImport (inputs // newCtx) path;
in
if builtins.isFunction imported then
  imported newCtx # function-style: { pkgs, ... }: ..., call it with perSystemArgs
else
  imported # free-variable style: pkgs already in scope via scopedImport
