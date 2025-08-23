{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { self, ... }@inputs:
    let
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
      };
    in
    {
      devShells.x86_64-linux = {
        default = pkgs.mkShell {
          packages = [
            pkgs.go
            pkgs.go-task
          ];
          shellHook = ''
            echo "tw, tk"
          '';
        };
      };
    };
}
