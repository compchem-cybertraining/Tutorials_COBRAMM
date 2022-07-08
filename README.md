# Tutorials_COBRAMM

Information about the files used in this tutorial.

In the COBRAMM folder you can find the files for 3 different exercises

1) solvate a chromophore and prepare the QM/MM partition

- the only file needed is a geometry file in xyz format. This will be the starting point to use COBRAMM's script and setup the system. 

2) setup the QM/MM calculation for a retinal chromophore embedded in rhodopsine 

- 4EFG.pdb is the initial geometry of the protein in PDB format
- Prepare_cobramm_input.pl is the cobramm script
- RET.frcmod and RET.lib contain the information about the non standard residue

In the SHARC_COBRAMM folder, inside input_files, you can find:

- SHARC template for MOLCAS and COBRAMM 
- MOLCAS and COBRAMM resources files
- molden file containing the frequencies of the fulvene
- auxiliary scritps (extract_xyz.sh and combine_initconds.py)
- initial orbital for CASSCF calculation
- slurm submission script
