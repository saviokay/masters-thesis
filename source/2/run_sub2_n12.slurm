#!/bin/bash

#SBATCH --job-name=12N1MonthTestRunSub2
#SBATCH --output=slurm_sub2_n12.out
#SBATCH --error=slurm_sub2_n12.err
#SBATCH --partition=batch
#SBATCH --nodes=12
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub2_CF.py
