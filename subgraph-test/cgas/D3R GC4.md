#source #cgas #sirt3 

The 4th [[D3R challenge]]

## tasks & inputs
[[pose prediction]] - [[fasta]] and [[SMILES]] as input
[[affinity ranking]] & [[free energy simulations]] - [[crystal structure]] and [[SMILES]] as input


## targets 
* [[cathepsin]] - [[janssen]] pharma
	* 460 ligands for [[affinity ranking]]
	* 40 ligands for [[free energy simulations]]
* [[BACE1]] - [[beta secretase 1]] - [[Novartis]]
	* [[pose prediction]] for 20 ligands 
		* with [[fasta]] 
		* with [[crystal structure]]
	* [[affinity ranking]] 154 ligands
	* [[free energy simulations]] 34 ligands


## [[pose prediction]] (in these cases the [[pdb file]] was available)
### performance
both [[mean]] and [[median]] are sub 1 [[angstrom]] at this point

### winning methods
1. prepare [[ligand]] and [[notes/protein]] ([[antechamber]] and [[charmm]] 19 [[force field]])
2. search for most similar ligand [[co crystalstructure]] by [[Tanimoto Similarity]]
3. align ligand using [[common substructure alignment]] or matching points
4. perform [[molecular dynamics]] [[free minimization]] ie with [[macromodel]] by [[schroedinger]]
5. cluster the [[simulation snapshot]] and score with [[vina energy score]] 

## [[affinity ranking]]
### performance
* 0.5 - 0.7 [[spearman correlation]] is currently [[SOTA]] 
* 0.4 - 0.5 [[kendall tau]] is currently [[SOTA]]

### winning methods for [[combined affinity ranking]] 
the task is a [[few shot learning]] problem, as some prior receptors do exist
of note the winning methods do not show a strong recurring pattern. Below are some examples
* [[ligand based affinity ranking]]-  [[small molecule representation]] [[QSAR]]
	* [[ECFPL]] fingerprints (ECFP with 8192 bits) were used to learn [[binding affinity]] in [[chembl]] for the particular receptor in question - deepscafopt
	* [[deep learning]] based prediction of [[free energy simulations]] based on [[PDBind]] data topology scoring systems in [[schroedinger]]
	* generate [[RDKit]] descriptors, remove correlated features, calculate log of [[IC50]] and fit a simple [[MLP]] - [[jamal shamsara]] 
* [[structure based affinity ranking]] -  [[docking]] aka [[3D QSAR]]
	* [[schroedinger]] & [[math-dl]] - [[@nguyenMathDLMathematicalDeep2020]]
		* [[receptor preparation]]
		* [[ligand preparation]]
		* [[docking]] around known binding site
	* [[pl patchsurfer]] - [[zero shot learning]]
		* dock against all available [[pdb file]] poses and average the score
		* create poses of ligands 
		* rank ligands by their average docking score
	* [[molsoft]] docking - [[few shot learning]]
		* dock against a set of 2 [[pdb file]]
		* create poses of ligands in [[chembl]] data
		* learn a model to predict [[pKd]] from 3D post of the ligand for this one particular protein
	* [[autodock gpu]] docking (the method did not perform well) - followed the [[pl patchsurfer]] approach of simply used the [[autodock]] 4 [[scoring function]]

## people to reach out to
[[daisuke kihara]] & [[woong-hee shin]] - [[patchsurfer]

## interview questions
* describe process and get feedback - am I getting this right? 
* how do you think people would do this today?

## links
challenge: https://drugdesigndata.org/about/grand-challenge-4

3 winners of [[pose prediction]]
https://drugdesigndata.org/php/d3r/gc4/combined/spreadsheets/p-software.php?receipt=4x5a8
https://drugdesigndata.org/php/d3r/gc4/combined/spreadsheets/p-software.php?receipt=0invp
https://drugdesigndata.org/php/d3r/gc4/combined/spreadsheets/p-software.php?receipt=uq8b0

selected winners for [[affinity ranking]]
https://drugdesigndata.org/php/d3r/gc4/combined/spreadsheets/p-software.php?receipt=3c8nw
https://drugdesigndata.org/php/d3r/gc4/combined/spreadsheets/p-software.php?receipt=x4svd

