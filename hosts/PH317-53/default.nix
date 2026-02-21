# hosts/PH317-53/default.nix

{ config, ... }:

let
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
    time.timeZone = "Europe/Stockholm";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "sv-latin1";
  };

  gpuSettings = {
    nixpkgs.config.allowUnfree = true;

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics.enable = true;
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
in
{
  imports = [
    # Copy over once per machine from the installer-generated hardware-configuration.nix. Update it only upon reinstall or hardware changes.
    ./hardware-configuration.nix
    ./users.nix
    ../../modules/desktops/wayland-system.nix
  ];

  # Set once per machine using the value from the installer-generated configuration.nix. Once set, do not ever change it.
  system.stateVersion = "25.11";
}
  // bootSettings
  // servicesSettings
  // networkingSettings
  // regionalSettings
  // gpuSettings
  
