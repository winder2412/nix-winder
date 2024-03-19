{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    eww.url = "github:elkowar/eww";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux = {
        python = pkgs.mkShell {
          nativeBuildInputs = with pkgs.python312Packages;
            [
              django
              openpyxl
              pandas
              jdatetime
              pillow
            ];

          shellHook = ''
            echo "welcome to the python shell"
          '';
        };
      };
      nixosConfigurations = {
        winder = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };
    };
}
