{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, nixos-wsl, self }:

    {
      nixosConfigurations = {
        myhostyolo = nixpkgs.lib.nixosSystem {
          modules = [
            nixos-wsl.nixosModules.wsl
            ./modules/common.nix
            ./modules/podman.nix
            ./modules/wsl.nix
          ];
        };
      };
    };
}
