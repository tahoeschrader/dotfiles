# dotfiles

A place to store all my home and system configurations.

Heavily borrowing ideas/formatting from my brother:
- https://github.com/schradert/dotfiles

## After updating MacOS

Add the following to the top of `/etc/zshrc` with `sudo \vim /etc/zshrc`.

```
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
```

## TODO

- SSH profiels (secrets?)
- GIT profiles (secrets?)
- Figure out how to get nix to ensure cargo installs `tpi` and `trunk` globally
- Setup custom zellij templates for projects as I go and develop for them

## Given up tasks for now

- Adding my other computers
- Moving other programs to home manager (Docker, LaTeX, Anki, Brave, etc.)

