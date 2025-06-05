FROM nixos/nix:2.29.0

# Enable flakes
ENV NIX_CONFIG="experimental-features = nix-command flakes\n\
substituters = https://cache.nixos.org https://rishabh5321.cachix.org https://hyprland.cachix.org https://nixpkgs-wayland.cachix.org https://nix-gaming.cachix.org\n\
trusted-public-keys = rishabh5321.cachix.org-1:mxfBIH2XElE6ieFXXYBA9Ame4mVTbAf1TGR843siggk= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc= nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA= nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="

# Copy your flake and source code
WORKDIR /workspace
COPY . .

# Run develop shell (entrypoint could vary depending on what you want)
CMD ["nix", "develop", "--command", "bash"]
