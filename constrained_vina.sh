#!/bin/bash
pr4path="/Library/MGLTools/1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24"
vinapath="/Users/veronicagueye/Desktop/autodock_vina_1_1_2_mac/bin"
pythonpath="/Library/MGLTools/1.5.6/bin"
babelpath="/usr/local/bin"

${pythonpath}/pythonsh ${pr4path}/prepare_receptor4.py -r receptor.pdb -A bonds_hydrogens -U nphs_lps_waters_deleteAltB -o receptor.pdbqt
${vinapath}/vina --receptor receptor.pdbqt --flex ligand_constrained.pdbqt  --ligand water.pdbqt --out ligand_constrained.pdbqt --log ligand_constrained.log --config vina.config
