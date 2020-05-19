#!/bin/bash

set -ex

scripts/clean.sh

touch .gitmodules
git submodule add https://hub.spigotmc.org/stash/scm/spigot/bukkit.git modules/Bukkit
git submodule add https://hub.spigotmc.org/stash/scm/spigot/craftbukkit.git modules/CraftBukkit
git submodule add https://hub.spigotmc.org/stash/scm/spigot/builddata.git modules/BuildData
git submodule add https://hub.spigotmc.org/stash/scm/spigot/spigot.git modules/Spigot
git submodule add https://github.com/PaperMC/Paperclip.git modules/Paperclip
git submodule add https://github.com/PaperMC/Paper.git modules/Paper
git submodule update --init --force

( cd modules/Bukkit && git checkout 558fdf5f54b0f527cd48903daf9368ac4b862876 && git clean -d --force )
( cd modules/CraftBukkit && git checkout acbc348e925cbdbae41b2055d60bbe40031d470c && git clean -d --force )
( cd modules/BuildData && git checkout be360cc298a06b5355ecd057f5b1feb894a73f0f && git clean -d --force )
( cd modules/Spigot && git checkout 79a30d7d26b9078dbf6071cbbfa060673bf117b2 && git clean -d --force )
( cd modules/Paper && git checkout 77cce8236ff09d52730b66c7a146265ce3415185 && git clean -d --force )
git add modules

git submodule status