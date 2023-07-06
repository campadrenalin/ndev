ndev
====

Generic nix-based development environment.

### Goals

 - [x] Manage the network at the Host OS level.
 - [x] Allow the container to manage docker services.
 - [x] Preserve a persistent /nix/store/ across launches.
 - [x] Mount an app's source code
 - [x] Run nix-shell on launch
 - [x] Optimize the process of building a shell derivation at runtime
 - [x] Standalone script that can be curl'd and used immediately
 - [ ] Handle file ownership correctly
 - [ ] Host launch script should use arguments instead of magic constants
 - [ ] Polish the experience of using ndev from another codebase

### Demo

```bash
git clone git@github.com:campadrenalin/ndev.git
cd ndev

./nd build && ./nd solo

# Wait for container to be ready
docker-compose up -d
redis-cli -h redis

# Poke around at http://localhost:8000/ in your browser :)
```
