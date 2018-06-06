# constrained-docking

Overview 

Both Autodock Vina (ADV) and rDock are molecular docking programs useful for computer aided drug design.
In this tutorial we will learn how to run MCS and pharmacophore based constrained docking on vina and rDock. The aim of this work are to sucessfully constrained the docking poses using MCS or pharmacophore and apprehend the modification on scoring function of each constraints, if there any.

Requirements
rdkit,Openbabel, rDock and ADV.


[Vina

3) Change path when it's required  exp: vinapath="/Users/veronicagueye/Desktop/autodock_vina_1_1_2_mac/bin"

4) Convert the target receptor (i.e., protein) and all ligands into pdbqt format (using any traditional tools such as utilities24 script "prepare_receptor4.py" and "prepare_ligand4.py").

5) Set up users define parmaters : size box using "vina.config", exhaustiveness and seed. In this example we use the default parameters.

6) Launch a non constrained docking, and check the output

7) Convert a dupe ligand, like water, in pdbqt format and use "--flex" implemenation to define ligand as part of receptor

8) Run the docking. Use corrplot from "R".]
