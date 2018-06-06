#path to be modified
#!/bin/bash
vinapath="/Users/veronicagueye/Desktop/autodock_vina_1_1_2_mac/bin"
babelpath="/usr/local/bin"
pr4path="/Library/MGLTools/1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24"
pythonpath="/Library/MGLTools/1.5.6/bin"

${pythonpath}/pythonsh ${pr4path}/prepare_ligand4.py -l ligand.mol2 -o lk.pdbqt -R 5
#lk.pdbqt output 

${vinapath}/vina --receptor receptor.pdbqt --flex flex_581_C3.pdbqt --ligand water.pdbqt --out C3.pdbqt --log C3.log --config vina.config 

${babelpath}/babel -ipdbqt C3.pdbqt -O C3.pdb
