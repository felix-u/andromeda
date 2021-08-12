## Description
Andromeda is a command line utility for Arch-based systems, written in bash. It installs packages separated by whitespace in a plain text file. Helpful for setting up OS installs.
## Dependencies
Andromeda uses [paru](https://github.com/Morganamilo/paru), though it can be easily modified to work with pacman or your package manager/AUR helper of choice. Install `paru-bin` with an AUR helper, or manually by following its official [installation instructions](https://github.com/Morganamilo/paru#installation).
## Installation
Clone this repo and execute `./andromeda` from its location, or alternatively, copy `./andromeda` into `/usr/bin/`.
## Usage
Separate package names by spaces, tabs, or newlines in a plain text file. Pass this file as an argument to andromeda:
```bash
andromeda ~/path/to/file.txt
```
