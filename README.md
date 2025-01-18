# NixOS VSCode Speedrun 🏁

[![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/erwinkramer/xnos)

![xnos](.images/xnos.png)

## Introduction

Get up to speed with NixOS on WSL2 with the VSCode [Nix IDE](https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide).

In principle very similar to [nixos-wsl-starter](https://github.com/LGUG2Z/nixos-wsl-starter?tab=readme-ov-file#nixos-wsl-starter), but this one is focused on VSCode development.

## Basics

🏃 Clone this repo.

🏃 Download the WSL compatible `tar.gz` at [NixOS-WSL](https://github.com/nix-community/NixOS-WSL/releases) to the root of the cloned repo.

🏃 Install WSL (if not installed yet):

```powershell
wsl --install
```

🏃 Import the  `tar.gz` into the OS folder in this repo:

```powershell
wsl --import NixOS ./OS nixos-wsl.tar.gz --version 2
```

🏃 Set as default distro and get the shell:

```powershell
wsl -s NixOS #default distribution
wsl -d NixOS #get a shell
```

🏃 Rebuild with the included flake (using this path notation to support git integration):

```
sudo nixos-rebuild --flake path://$PWD/Config/.#myhostyolo switch -L
```

The first time you rebuild you get a `Error: Failed to open dbus connection` message because it actually upgraded NixOS as well, this is expected.

🏃 Enter your IDE environment in NixOS with Command Palette: `WSL: Reopen Folder in WSL` and select `NixOS`.

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

## Arion

🏃 Configure WSL globally to [free up port 53 (DNS)](https://github.com/microsoft/WSL/issues/9095#issuecomment-2317768443), use the following configuration:

```powershell
[wsl2]
localhostForwarding = true
networkingMode = NAT
dnsProxy = true
firewall = true
dnsTunneling = false
```

🏃 Reboot NixOS and start the container(s):

```powershell
cd ./config
sudo arion up -d
sudo arion logs -f
```

🏃 Open dozzle:

<http://127.0.0.1:8080/>

🏃 Do a lookup on TCP, since [UDP traffic isn't supported on WSL2](https://github.com/microsoft/WSL/issues/9095#issuecomment-1299227600). Run this on your host:

```powershell
nslookup -vc nu.locali 127.0.0.1
```

This should return the following, as specified by [the Corefile](/DNS/Corefile):

```powershell
Name:    nu.locali
Address:  127.0.0.1
```

## To Azure

🏃 Get the WSL2 shell again:

```powershell
wsl -d NixOS #get a shell
```

🏃 Clone [nixos-on-azure](https://github.com/erwinkramer/nixos-on-azure).

🏃 Follow the steps specified in the README of `nixos-on-azure`.

🏃 Now manage your fleet! Try:

- OpenTofu with the [nixos-anywhere/nixos-rebuild](https://github.com/nix-community/nixos-anywhere/blob/main/terraform/nixos-rebuild.md) module to rebuild and update your VMs.
- Or try [comin](https://github.com/nlewo/comin?tab=readme-ov-file#comin---gitops-for-nixos-machines) for GitOps ([supports](https://github.com/nlewo/comin/blob/main/docs/authentication.md#authentication-for-private-repositories) private GitHub and GitLab repo's).
- Or choose any other [deployment tool](https://nix-community.github.io/awesome-nix/#deployment-tools).

## Considerations

VSCode extensions ideally should be installed via NixOS itself, but no native way is found. Please see [discussion @ discourse.nixos.org](https://discourse.nixos.org/t/nixos-in-wsl-how-to-install-vscode-extensions/55445/4) as well.

## License

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg