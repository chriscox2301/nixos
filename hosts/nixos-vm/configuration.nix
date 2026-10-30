{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../common.nix
  ];

  # Bootloader (UEFI)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Moet gelijk zijn aan de mapnaam in hosts/
  networking.hostName = "nixos-vm";

  # Alleen voor de VM
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  # NIET aanpassen: de waarde uit stap 1 overnemen
  system.stateVersion = "26.05";
}

