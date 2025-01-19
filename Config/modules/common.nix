{ lib, pkgs, ... }:

{
  system.stateVersion = "24.11"; # https://discourse.nixos.org/t/when-should-i-change-system-stateversion/1433/21?u=r3verse
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  #boot.loader.grub.device = "nodev";

  networking.firewall = {
    enable = false;
  };

  services.resolved = {
    # Disable local DNS stub listener on 127.0.0.53
    extraConfig = ''
      DNSStubListener=no
    '';
  };

  environment.systemPackages = [
    pkgs.lsof
  ];

  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    persistent = true;
    allowReboot = true;
    flake = "$PWD/config/";
  };

}
