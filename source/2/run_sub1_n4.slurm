#!/bin/bash

#SBATCH --job-name=1MonthTestRunSub1
#SBATCH --output=slurm_sub1.out
#SBATCH --error=slurm_sub1.err
#SBATCH --partition=batch
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub1_CF.py
