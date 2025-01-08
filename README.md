# NixOS VSCode Speedrun

![xnos](.images/xnos.png)

## Introduction

Get up to speed with NixOS on WSL2 with the VSCode [Nix IDE](https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide).

In principle very similar to [nixos-wsl-starter](https://github.com/LGUG2Z/nixos-wsl-starter?tab=readme-ov-file#nixos-wsl-starter), but this one is focused on VSCode development.

## Basics

🏃 Clone this repo.

🏃 Download the WSL compatible `tar.gz` at [NixOS-WSL](https://github.com/nix-community/NixOS-WSL/releases).

🏃 Import the  `tar.gz` into the OS folder in this repo:

```powershell
wsl --install
wsl --import NixOS ./OS nixos-wsl.tar.gz --version 2
```

🏃 Set as default distro and get the shell:

```powershell
wsl -s NixOS #default distribution
wsl -d NixOS #get a shell
```

🏃 Rebuild with the included flake (using this path notation to support git integration):

```
sudo nixos-rebuild --flake path://$PWD/config/.#myhostyolo switch -L --upgrade
```

The first time you rebuild you get a `Error: Failed to open dbus connection` message because it actually upgraded NixOS as well, this is expected.

🏃 Enter your IDE environment in NixOS with Command Palette: `WSL: Reopen Folder in WSL`.

🏃 Install the recommended VSCode extensions as requested in the pop-up message. (this is a one time install, it actually preserves the extensions on reboot/rebuilds)

🏁🏁🏁 You're done (or ready for action) ! 🏁🏁🏁

🏃 Go back with Command Palette: `WSL: Reopen Folder in Windows`.

🏃 Clean up old generations and artifacts:

```powershell
sudo nix-collect-garbage --delete-old
```

🏃 Complete teardown:

```powershell
wsl --unregister NixOS
```

## Considerations

VSCode extensions ideally should be installed via NixOS itself, but no native way is found. Please see [discussion @ discourse.nixos.org](https://discourse.nixos.org/t/nixos-in-wsl-how-to-install-vscode-extensions/55445/4) as well.