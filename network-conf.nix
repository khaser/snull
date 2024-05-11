{ config, pkgs, ... }:
{
  config = {
    networking = {
      firewall.enable = false;
      hosts = {
        "192.167.0.1" = [ "local0" ];
        "192.167.0.2" = [ "remote0" ];
        "192.167.1.2" = [ "local1" ];
        "192.167.1.1" = [ "remote1" ];
      };
      interfaces = {
        sn0 = {
          ipv4 = {
            addresses = [
              {
                address = "192.167.0.1";
                prefixLength = 24;
              }
            ];
          };
        };
        sn1 = {
          ipv4 = {
            addresses = [
              {
                address = "192.167.1.2";
                prefixLength = 24;
              }
            ];
          };
        };
      };
    };
    boot.kernelModules = [ "snull" ];
    boot.extraModulePackages = [ (pkgs.linuxPackages.callPackage ./default.nix {}) ];
  };
}
