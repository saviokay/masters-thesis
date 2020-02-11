#!/bin/bash

#SBATCH --job-name=1MonthTestRunSub3
#SBATCH --output=slurm_sub3.out
#SBATCH --error=slurm_sub3.err
#SBATCH --partition=batch
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub3_CF.py
