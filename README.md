# constrained-docking

Overview 

Both Autodock Vina (ADV) and rDock are molecular docking programs useful for computer aided drug design.
In this tutorial we will learn how to run MCS and pharmacophore based constrained docking on vina and rDock.

Requirements
rdkit,Openbabel, rDock and ADV.


Usage
1) Select 9 ligands from high troughput screening

2) Use rdkit Chem library to determine maximum common substructure (MCS) shared between each fragments, by comparing one against the remaining 8.
