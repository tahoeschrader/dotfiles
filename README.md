# dotfiles

A place to store all my home and system configurations.

Heavily borrowing ideas/formatting from my brother:

- https://github.com/schradert/dotfiles

## After updating MacOS

Add the following to the top of `/etc/zshrc` with `sudo \vim /etc/zshrc`.

```text
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
```

## TODO

- [ ] add on/off flags for modules
- [ ] add turing pi, PC, and jetson configs
- [ ] fix hardcoded naming dependences to work with mac and turing pi configs

