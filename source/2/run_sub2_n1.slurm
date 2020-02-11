#!/bin/bash

#SBATCH --job-name=1N1MonthTestRunSub2
#SBATCH --output=slurm_sub2_n1.out
#SBATCH --error=slurm_sub2_n1.err
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub2_CF.py
