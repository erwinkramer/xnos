{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # for vscode https://nix-community.github.io/NixOS-WSL/how-to/vscode.html
  environment.systemPackages = [
    pkgs.nixfmt-rfc-style # required for NIX IDE extension in vscode
    pkgs.nixd # language server for NIX IDE extension in vscode
    pkgs.opentofu
  ];

  programs.nix-ld = {
    enable = true;
  };

  programs.git.enable = true;
  programs.git.config = {
    user.name = "erwinkramer";
    user.email = "info@guanchen.nl";
  };
}
