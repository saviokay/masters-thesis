#!/bin/bash

#SBATCH --job-name=9N1MonthTestRunSub3
#SBATCH --output=slurm_sub3_n9.out
#SBATCH --error=slurm_sub3_n9.err
#SBATCH --partition=batch
#SBATCH --nodes=9
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub3_CF.py
