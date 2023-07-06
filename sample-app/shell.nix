{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  buildInputs = [
    pkgs.bash
    pkgs.docker
    pkgs.docker-compose
    pkgs.git
    pkgs.htop
    pkgs.redis # For redis-cli
    pkgs.vim
  ];

  shellHook = ''
    echo "git:  $(git  --version)"
    echo "htop: $(htop --version)"
  '';
}
