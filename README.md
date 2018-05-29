# constrained-docking

Overview 
Both Autodock Vina (ADV) and rDock are molecular docking program useful for computer aided drug design
In this tutorial we will learn how to run MCS and pharmacophore based constrained docking on vina and rDock.

Requirements
rdkit,Openbabel, rDock and ADV.


Usage
1) Selection of 9 ligands from high troughput screening 
2)Using rdkit Chem library, determined maximum common substructure (MCS) shared between each the fragments, by comparing  one selected fragments to the  remain 8.
Vina
3) Set up a new directory
4) Determined your vina, utilities and pythonsh path
5)Convert your target receptor (i.e., protein) and all ligands into pdbqt format format (using any traditional tools).
6) Determined configuration file "vina.config", exhaustiveness and seed. For this work you will use the default parameters.
7) First launch a non constrained docking 
8) Convert a dupe ligand like water in pdbqt format and "--flex" implemenation to define ligand as part of receptor

