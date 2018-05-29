#!/bin/bash



mkdir -p ligands
mkdir -p docking



# Paths (to be modified)

pr4path="/Library/MGLTools/1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24"
vinapath="/Users/veronicagueye/Desktop/autodock_vina_1_1_2_mac/bin"
pythonpath="/Library/MGLTools/1.5.6/bin"
babelpath="/usr/local/bin"



python clean_receptor.py
rm recepteur.pdb


${pythonpath}/pythonsh ${pr4path}/prepare_receptor4.py -r receptor.pdb -A bonds_hydrogens -U nphs_lps_waters_deleteAltB -o receptor.pdbqt
# prepare_receptor4.py complains about not having charges for Zn but it does not matter because Autodock Vina ignores 
#user-supplied charges.

# Smiles to mol2

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

center_x =  15.8305
center_y = -8.952
center_z =  -10.2845

size_x = 11.687 
size_y = 11.746
size_z = 8.297

EOF
)"

echo  "${config}" > vina.config

for ligand in $(ls ligands/*.pdbqt | cut -d"/" -f2 | cut -d"." -f1); do

${vinapath}/vina --receptor receptor.pdbqt --ligand ligands/${ligand}.pdbqt --out docking/${ligand}.pdbqt --log docking/${ligand}.log --config vina.config

${babelpath}/babel -i pdbqt docking/${ligand}.pdbqt -o pdb docking/${ligand}.pdb

done

#After checking docking output using viewer like pymol we could proceed to the analyze
for ligand in $(ls docking/*.pdb | cut -d"/" -f2 | cut -d"." -f1); do

vina_energy=$( grep "^REMARK VINA RESULT:" docking/${ligand}.pdb | head -1 | sed -E "s/[ ]+/ /g" | cut -d " " -f4)

pm=$(obprop ligand.pdb| grep "^mol_weight"| head -1 | sed -E "s/[ ]+/ /g" | cut -d " " -f2)

echo "${ligand},${vina_energy},${pm}" >> energy.csv
done 


