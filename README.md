# .files
These are my personal dotfiles of my main arch-based machine. You probably shouldn't use these, as the configs are **very** specific to my PC usage.

## My routine for new machines
* Clone this repository and move all its files into your `$HOME` (including `.git`)
* Install the packages: `for x in $(cat packages.txt); do pacman -S $x; done`
