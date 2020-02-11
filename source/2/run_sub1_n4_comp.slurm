#!/bin/bash

#SBATCH --job-name=01MonthTestRunSub1
#SBATCH --output=slurm_sub01_comp.out
#SBATCH --error=slurm_sub01_comp.err
#SBATCH --partition=batch
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub1_CF_comp.py
