# constrained-docking

Overview 

Both Autodock Vina (ADV) and rDock are molecular docking programs useful for computer aided drug design.
In this tutorial we will learn how to run MCS and pharmacophore based constrained docking on vina and rDock. The aim of this work are to generate constrained docking poses using MCS or pharmacophore and determine whether the constraints modulate the socring function.


Requirements
rdkit,Openbabel, rDock and ADV.


1) Use rdkit Chem library againts your ligand library to determine maximum common substructure (MCS) shared between each fragments, by comparing one against the remaining 8.

2) Choose rationale pharmacophore in regard of your ligand features

#vina branch

3) Change path when it's necessary  exp: vinapath="/Users/veronicagueye/Desktop/autodock_vina_1_1_2_mac/bin"

4) Convert the target receptor (i.e., protein) and all ligands into pdbqt format (using any traditional tools such as utilities24 script "prepare_receptor4.py" and "prepare_ligand4.py").

5) Set up users define parmaters : size box using "vina.config", exhaustiveness and seed. In this example we use the default parameters.

6) Convert a dupe ligand, like water, in pdbqt format and use "--flex" implemenation to define ligand as part of receptor  and run the docking "constraint.sh"


#MCS-1 branch
3) Change path when it's necessary  exp: rdockpath="/home/v/Downloads/rDock_2013.1_src/bin"

4) Convert the target receptor (i.e., protein) in mol2 and all ligands into sdf format (using any traditional tools such as openbabel).

5/6) Configure .prm file with desireable features and run the docking "contraint_rdock.sh" 


7)Treat the output using corrplot from "R".

