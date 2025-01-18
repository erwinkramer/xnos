{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.arion
  ];

  # Arion works with Docker, but for NixOS-based containers, you need Podman
  # since NixOS 21.05.
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = false;
  virtualisation.podman.dockerSocket.enable = false;

  # Use your username instead of `nixos`
  users.extraUsers.nixos.extraGroups = ["podman"];
}