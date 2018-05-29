# constrained-docking

Overview 
Both Autodock Vina (ADV) and rDock are molecular docking program useful for computer aided drug design
In this tutorial we will learn how to run MCS and pharmacophore based constrained docking on vina and rDock.

Requirements
rdkit,Openbabel, rDock and ADV.

Rdock

3) Determine rDock bin path

4) Convert the target receptor (i.e., protein) in mol2 and all ligands into sdf format (using any traditional tools).

5) Configure .prm file 

6) Launch a non constrained docking

7) Used both pharmacophore and sdtheter implementation for launch constrained docking

8) Run the docking. Using matplpotlib built scoring energy plot a function of RMSD. RMSD is calculated between docked poses and crystal pose. Then draw correlation line using Pearson coefficient for both constrained and non constrained docking. 


