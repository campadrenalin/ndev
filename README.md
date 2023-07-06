ndev
====

Generic nix-based development environment.

### What's the concept here?

The host platform is the wild west, and we want to do as little there as
possible. Containers, on the other hand, can be a consistent and declarative
development environment, not just useful for production. If you could work in a
container, then most ops changes to your environment are just "rebuild a
container." Breaking your environment is almost consequence-free. You can
experiment in freedom. Your development experience is getting all those
benefits we love from Infrastructure As Code.

The `ndev` container is an attempt to make a specific kind of 'develop in
containers' workflow easy to work with. It allows your dev container to manage
other containers (by mounting the docker socket from the host OS), while also
being in the same docker network as those containers (allowing you to connect
to them by hostname). It's important to understand that this isn't nesting:
your dev container is structurally a peer of the containers it manages. This
makes it easy to expose ports on the host OS, since you're not having to
forward them through the dev container.

Your dev container should use a `shell.nix` file to declare its dependencies
and such. These will be installed as necessary on startup, and then cached in
persistent docker volumes. You can reuse this Nix data for building other
containers if you like, but you don't have to.

It's recommended that your dev container be a sort of kitchen sink of
dependencies, capable of running your full test suite. This doesn't just make
development life easier, it also makes it easier to use `ndev` in CI for a
consistent and dev-matching environment.

The `nd` script is self-contained and can be "installed" trivially:

```bash
INSTALL_LOCATION=~/bin/nd # Pick somewhere in your PATH
curl https://raw.githubusercontent.com/campadrenalin/ndev/main/nd > $INSTALL_LOCATION
chmod +x $INSTALL_LOCATION
```

And now you can run `nd` commands! Try `nd --usage` to see what's here.

### Why is this free? And tiny?

Because I love this way of developing, and I don't want to reinvent it on a
regular basis. It *should* be simple and portable.

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

# You would typically use .envrc or a wrapper script for config.
# We'll just do a quick and dirty demo here.
export NDEV_APP_SOURCE=./sample-app
export NDEV_NETWORK_NAME='sample-app-network'

./nd

# Wait for container to be ready
docker-compose up -d
redis-cli -h redis

# Poke around at http://localhost:8000/ in your browser :)
```
