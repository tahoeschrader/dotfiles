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

- [ ] configure 'Home Manager Apps' folder to create in  `$home/アプリケーション` instead of `$home/Applications`
- [ ] learn how to deal with "secrets"
- [ ] configure SSH config profiles
- [ ] configure GIT config profiles
- [ ] declare nix to have cargo install `tpi` and `trunk` globally
- [ ] continuously update custom zellij templates for projects as I go and develop for them
- [ ] add on/off flags for modules
- [ ] add turing pi configs
- [ ] fix hardcoded naming dependences to work with mac and turing pi configs

