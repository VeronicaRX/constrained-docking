#non contrained docking pipeline
#!/bin/bash

workdir=$(pwd -P)

mkdir -p ligands
mkdir -p docking



# Paths (to be modified)

pr4path="/Library/MGLTools/1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24"
vinapath="/Users/veronicagueye/Desktop/autodock_vina_1_1_2_mac/bin"
pythonpath="/Library/MGLTools/1.5.6/bin"
babelpath="/usr/local/bin"




${pythonpath}/pythonsh ${pr4path}/prepare_receptor4.py -r receptor.pdb -A bonds_hydrogens -U nphs_lps_waters_deleteAltB -o receptor.pdbqt

i=0

while read smile; do

i=$((i+1))

j=$(printf "%02d\n" $i)

echo "${smile} ligand_${j}" > ligands/ligand_${j}.smi


${babelpath}/babel -i smi ligands/ligand_${j}.smi -o mol2 ligands/ligand_${j}.mol2 -p 7.4 --gen3d

babel ligands/ligand_${j}.mol2 -O ligands/ligand_${j}.png
 
${pythonpath}/pythonsh ${pr4path}/prepare_ligand4.py -l ligands/ligand_${j}.mol2 -o ligands/ligand_${j}.pdbqt

 
done < lig.txt



config="$(cat << EOF

exhaustiveness = 8
#default

center_x =  15.5585
center_y = -8.8355
center_z =  -10.289

size_x = 11.585
size_y = 10.715
size_z = 9.556

EOF
)"

echo  "${config}" > vina.config

for ligand in $(ls ligands/*.pdbqt | cut -d"/" -f2 | cut -d"." -f1); do

${vinapath}/vina --receptor receptor.pdbqt --ligand ligands/${ligand}.pdbqt --out docking/${ligand}.pdbqt --log docking/${ligand}.log --config vina.config --seed 100

${babelpath}/babel -i pdbqt docking/${ligand}.pdbqt -o pdb docking/${ligand}.pdb

done

