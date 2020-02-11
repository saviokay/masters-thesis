#!/bin/bash

#SBATCH --job-name=12N1MonthTestRunSub3
#SBATCH --output=slurm_sub3_n12.out
#SBATCH --error=slurm_sub3_n12.err
#SBATCH --partition=batch
#SBATCH --nodes=12
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub3_CF.py
