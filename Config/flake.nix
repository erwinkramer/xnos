{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/6a3ae7a5a12fb8cac2d59d7df7cbd95f9b2f0566"; # recent SHA from https://github.com/NixOS/nixpkgs/commits/nixos-24.11
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixos-wsl,
      self,
    }:

    {
      nixosConfigurations = {
        myhostyolo = nixpkgs.lib.nixosSystem {
          modules = [
            nixos-wsl.nixosModules.wsl
            ./modules/common.nix
            ./modules/arion.nix
            ./modules/wsl.nix
          ];
        };
      };
    };
}
