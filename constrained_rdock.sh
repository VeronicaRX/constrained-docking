#!/bin/bash
#path to be modified
#Using phamacophore implementation
rdockpath="/home/v/Downloads/rDock_2013.1_src/bin"
${rdockpath}/rbcavity -d -was -r receptorp.prm
${rdockpath}/rbdock -i lignad_581.sdf -o S0 -r receptorp.prm -p dock.prm  -n 10
${rdockpath}/rbdock -i lignad_581.sdf -o S1 -r receptorp1.prm -p dock_solv.prm  -n 10
${rdockpath}/rbdock -i lignad_581.sdf -o S2 -r receptorp1.prm -p dock.prm  -n 100
${rdockpath}/rbdock -i lignad_581.sdf -o S3 -r receptorp.prm -p dock_solv.prm  -n 100
${rdockpath}/sdrmsd ligand_581.sdf S0.sd 
#using sdtether implementation 
${rdockpath}/sdtether ligand_581.sdf ligand_581.sdf ligand_r.sdf 'C(=O)'
${rdockpath}/rbcavity -d -was -r receptor.prm
${rdockpath}/rbdock -i lignad_581.sdf -o C5 -r receptorr.prm -p dock_solv.prm  -n 10
${rdockpath}/rbdock -i lignad_581.sdf -o C5s -r receptorr.prm -p dock.prm  -n 10
${rdockpath}/sdrmd ligand_581.sdf C5.sd
${rdockpath}/sdrmd ligand_581.sdf C5s.sd

#Same pattern for all MCS and pharmacophore 
${rdockpath}/sdtether ligand_581.sdf ligand_581.sdf ligand_r.sdf 'ccccccNC(=O)'
${rdockpath}/sdtether ligand_581.sdf ligand_581.sdf ligand_r.sdf 'ccccccNC(=O)N'
${rdockpath}/sdtether ligand_581.sdf ligand_581.sdf ligand_r.sdf 'CCCNC'
${rdockpath}/sdtether ligand_581.sdf ligand_581.sdf ligand_r.sdf 'NC(=O)N'
${rdockpath}/sdtether ligand_581.sdf ligand_581.sdf ligand_r.sdf 'C(O)'
#then rbdock 






