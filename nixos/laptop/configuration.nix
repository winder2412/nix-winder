{ pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../modules
    ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ##  Set your time zone.
  time.timeZone = "Asia/Tehran";

  ## Home-manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "winder" = import ../../user/home.nix; };
  };
}
