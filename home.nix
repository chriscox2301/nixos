{ pkgs, ... }:
{
  home.username = "chris";
  home.homeDirectory = "/home/chris";
  home.stateVersion = "26.05";   # zelfde als je eerste install, daarna nooit meer wijzigen

  home.packages = with pkgs; [
    fastfetch
    ripgrep
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
      update  = "nix flake update --flake ~/nixos-config";
    };
  };
}
