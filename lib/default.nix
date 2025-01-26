{
  libPre,
  inputs,
  ...
}: let
  lib =
    libPre.extend
    (self: _: {
      nebula = import ./nebula {
        inherit inputs;
        lib = self;
      };
    });
in {
  inherit lib;
}
