{ pkgs, ... }:
{
  # Netwerk
  networking.networkmanager.enable = true;

  # Tijd en taal
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  # Gebruiker
  users.users.chris = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Systeempakketten
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
  ];

  # SSH
  services.openssh.enable = true;

  # Flakes aan
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
