#!/usr/bin/bash

#SBATCH -A p31995
#SBATCH -p normal
#SBATCH -t 48:00:00
#SBATCH --mem=35G
#SBATCH -J fno_fmap

module purge
module load singularity/latest
echo "modules loaded" 
echo "beginning preprocessing"


#WITHOUT FMAP
singularity run --cleanenv -B /projects/b1108:/projects/b1108 \
-B /projects/b1108/studies/foundations2/data/processed/neuroimaging/23_fmriprep_nodc:/out \
-B /projects/b1108/studies/foundations2/data/raw/neuroimaging/bids:/data \
-B /projects/b1108/studies/foundations2/data/processed/neuroimaging/23_fmriprep_nodc/work:/work \
/projects/b1108/software/singularity_images/fmriprep-23.0.1.simg \
/data /out participant \
--participant-label ${1}  \
--fs-license-file /projects/b1108/software/freesurfer_license/license.txt \
-w /work --ignore fieldmaps --skip_bids_validation