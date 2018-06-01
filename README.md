# constrained-docking

Overview 

Both Autodock Vina (ADV) and rDock are molecular docking programs useful for computer aided drug design.
In this tutorial we will learn how to run MCS and pharmacophore based constrained docking on vina and rDock.

Requirements
rdkit,Openbabel, rDock and ADV.


Vina

3) Determine vina, utilities and pythonsh path

4) Convert the target receptor (i.e., protein) and all ligands into pdbt format (using any traditional tools).

5) Determine configuration file "vina.config", exhaustiveness and seed. For this work you will use the default parameters.

6) Launch a non constrained docking

7) Convert a dupe ligand, like water, in pdbqt format and use "--flex" implemenation to define ligand as part of receptor

8) Run the docking. Using matplpotlib build scoring energy plot as a function of RMSD. RMSD is calculated between docked poses and the crystal pose. Then draw correlation line using Pearson coefficient for both constrained and non constrained docking. 

