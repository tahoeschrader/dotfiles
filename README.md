# dotfiles
A place to store all my home and system configurations.

## After updating MacOS

Add the following to the top of `/etc/zshrc` with `sudo \vim /etc/zshrc`.

```
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
```

## Attributes
Heavily borrowing ideas/formatting from the following:
- https://github.com/schradert/dotfiles

## TODO
- SSH (secrets?)
- GIT (secrets?)
- Figure out how to get nix to ensure cargo installs `tpi` and `trunk` globally
- Make configurations for my other clients (thinkcentre, rasperry pi, etc.)
- Setup zellij templates
