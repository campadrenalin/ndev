ndev
====

Generic nix-based development environment.

### Goals

 - [x] Manage the network at the Host OS level.
 - [x] Allow the container to manage docker services.
 - [x] Preserve a persistent /nix/store/ across launches.
 - [x] Mount an app's source code
 - [x] Run nix-shell on launch
 - [ ] Handle file ownership correctly
 - [ ] Host launch script should use arguments instead of magic constants
 - [ ] Polish the experience of using ndev from another codebase
 - [ ] Optimize the process of building a shell derivation at runtime
