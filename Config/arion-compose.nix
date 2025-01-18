{
  project.name = "dns";
  services.coredns = {
    service.image = "coredns/coredns";
    service.volumes = [ "../DNS:/coredns-config/" ];
    service.command = "-conf coredns-config/Corefile";
  };
}
