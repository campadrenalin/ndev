FROM nixos/nix
RUN nix-channel --update

WORKDIR /app/
RUN mkdir -p /app/bin/

COPY ndev-shell /bin/
