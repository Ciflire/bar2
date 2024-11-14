# flake.nix
{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/master";
    };
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      #       ↑ Swap it for your system if needed
      #       "aarch64-linux" / "x86_64-darwin" / "aarch64-darwin"
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          # backend related
          cargo
          rustc
          rust-analyzer
          rustfmt
          # frontend related
          bun
          nodePackages.svelte-check
          nodePackages.svelte-language-server
          # helpers
          glow
        ];
        shellHook = "";
      };
    };
}
