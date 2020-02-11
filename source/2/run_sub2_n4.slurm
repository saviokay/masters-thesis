#!/bin/bash

#SBATCH --job-name=1MonthTestRunSub2
#SBATCH --output=slurm_sub2.out
#SBATCH --error=slurm_sub2.err
#SBATCH --partition=batch
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub2_CF.py
