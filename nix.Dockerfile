FROM nixos/nix:2.29.0

WORKDIR /workspace

# Define default env vars (can be overridden at build/run time)
ENV EXTRA_SUBSTITUTERS=""
ENV EXTRA_TRUSTED_KEYS=""

RUN mkdir -p /etc/nix && \
    cat > /etc/nix/nix.conf <<EOF
experimental-features = nix-command flakes
substituters = https://cache.nixos.org \$EXTRA_SUBSTITUTERS
trusted-public-keys = \
  cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= \
  \$EXTRA_TRUSTED_KEYS
EOF

COPY . .

RUN nix flake metadata
