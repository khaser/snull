fork of snull module from https://github.com/martinezjavier/ldd3 repo

As a bonus in network-conf.nix provide NixOS module which loads module and setups
network devices created by it.

Non NixOs users can use snull_[un]load bash scripts, but only after some
/etc/hosts and /etc/networks setup.
