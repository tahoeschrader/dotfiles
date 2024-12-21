# dotfiles

A place to store all my home and system configurations.

Heavily borrowing ideas/formatting from my brother:

- https://github.com/schradert/dotfiles

## Tidy up repo

```text
nix fmt .
```

## After updating MacOS

Add the following to the top of `/etc/zshrc` with `sudo \vim /etc/zshrc`.

```text
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
```

## TODO

- [ ] add turing pi config
- [ ] add windows WSL config
- [ ] add nvidia jetson configs

