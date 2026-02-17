# hosts/_template/default.nix

{ ... }:

let
  # bootSettings are configured to use systemd-boot for systems using UEFI.
  bootSettings = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };

  servicesSettings = {
    services.openssh.enable = false;
  };

  networkingSettings = {
    networking.networkmanager.enable = true;
  };

  regionalSettings = {
    time.timeZone = "UTC";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "us";
  };
in
{
  imports = [
    # Copy over once per machine from the installer-generated hardware-configuration.nix. Update it only upon reinstall or hardware changes.
    ./hardware-configuration.nix
    ./users.nix
  ];

  # Set once per machine using the value from the installer-generated configuration.nix. Once set, do not ever change it.
  system.stateVersion = "xx.xx";
}
  // bootSettings
  // servicesSettings
  // networkingSettings
  // regionalSettings
