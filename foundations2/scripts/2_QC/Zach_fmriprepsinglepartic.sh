#!/usr/bin/bash

#SBATCH -A p30954
#SBATCH -p normal
#SBATCH -t 48:00:00
#SBATCH --mem=64G
#SBATCH -J fmriprep_single_sub

module purge
module load singularity/latest
echo "modules loaded" 
echo "beginning preprocessing"

singularity run --cleanenv -B /projects/b1108:/projects/b1108 /projects/b1108/software/singularity_images/fmriprep-20.2.3.simg /projects/b1108/studies:q
/transitions/data/raw/neuroimaging/bids/derivatives /projects/b1108/studies/transitions/data/processed/neuroimaging/fmriprep participant --participant-label ${1} --fs-license-file /projects/b1108/software/freesurfer_license/license.txt --fs-no-reconall -w /projects/b1108/studies/transitions/data/processed/neuroimaging/work --skip_bids_validation
