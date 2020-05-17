#!/bin/bash$
this_dir=$(pwd)

cd ~
git clone git@github.com:filipeGuerreiro/zettelkasten.git

echo "Downloading neuron... This operation will take a long time."
nix-env -if https://github.com/srid/neuron/archive/master.tar.gz 

cd $this_dir
