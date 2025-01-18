{
  project.name = "dns";
  networks.eden.driver = "bridge";
  networks.eden.name = "eden";
  networks.eden.ipam.config = [ { subnet = "172.21.0.0/16"; } ];

  services.coredns = {
    service.image = "coredns/coredns";
    service.ports = [ "53:53"];
    service.volumes = [ "../DNS:/coredns-config/" ];
    service.networks = [ "eden" ];
    service.command = "-conf coredns-config/Corefile";
  };
  services.dozzle = {
    service.image = "amir20/dozzle";
    service.ports = [ "8080:8080" ];
    service.networks = [ "eden" ];
    service.volumes = [ "/var/run/docker.sock:/var/run/docker.sock" ];
  };
}
