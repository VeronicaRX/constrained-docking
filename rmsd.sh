#!/bin/bash

obabel ligand.pdb -O ligand.xyz -d

head -2 ligand.xyz > ligand.header

tail -n+3 ligand.xyz | sed -e "s/[[:space:]]\+/ /g" | sort -t" " -k1,1 -k2,2n -k3,3n -k4,4n > ligand.coordinates

cat ligand.header ligand.coordinates > ligand_rearranged.xyz

obabel ligand_rearranged.xyz -O ligand.sdf

rm ligand.xyz ligand.header ligand.coordinates ligand_rearranged.xyz

for ligand in $(ls docking/*.pdbqt | rev | cut -d"/" -f1 | rev | cut -d"." -f1); do

obabel docking/${ligand}.pdbqt -O docking/${ligand}_.xyz -m -d

for pose in $(ls docking/${ligand}_*.xyz | rev | cut -d"/" -f1 | rev | cut -d"." -f1); do

head -2 docking/${pose}.xyz > docking/${pose}.header

tail -n+3 docking/${pose}.xyz | sed -e "s/[[:space:]]\+/ /g" | sort -t" " -k1,1 -k2,2n -k3,3n -k4,4n > docking/${pose}.coordinates

cat docking/${pose}.header docking/${pose}.coordinates > docking/${pose}_rearranged.xyz

obabel docking/${pose}_rearranged.xyz -O rmsd1/${pose}.sdf

rm docking/${pose}.xyz docking/${pose}.header docking/${pose}.coordinates docking/${pose}_rearranged.xyz

rmsd=$(python rmsd.py -r ligand.sdf rmsd1/${pose}.sdf)

echo "${pose} ${rmsd}" >> rmsd1/${ligand}_rmsd.txt

done

done

