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
 - [x] Handle file ownership correctly (seems to work?)
 - [x] Host launch script should use customizable env variables
 - [ ] Polish the experience of using ndev from another codebase
  - [x] Primitive `$SSH_AUTH_SOCK` support (currently OS X only)
  - [ ] Ability to talk to custom Docker registries
  - [ ] Preserve command history
  - [ ] Possibly find a solution for global git config?

### Demo

```bash
git clone git@github.com:campadrenalin/ndev.git
cd ndev

export NDEV_APP_SOURCE=./sample-app

./nd

# Wait for container to be ready
docker-compose up -d
redis-cli -h redis

# Poke around at http://localhost:8000/ in your browser :)
```
