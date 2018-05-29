#!/bin/bash
vinapath="/Users/veronicagueye/Desktop/autodock_vina_1_1_2_mac/bin"
babelpath="/usr/local/bin"
${vinapath}/vina --receptor receptor.pdbqt --flex flex_581_C3.pdbqt --ligand water.pdbqt --out C3.pdbqt --log C3.log --config vina.config 

${babelpath}/babel -ipdbqt C3.pdbqt -O C3.pdb