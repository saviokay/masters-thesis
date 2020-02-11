#!/bin/bash

#SBATCH --job-name=6N1MonthTestRunSub1
#SBATCH --output=slurm_sub1_n6.out
#SBATCH --error=slurm_sub1_n6.err
#SBATCH --partition=batch
#SBATCH --nodes=6
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub1_CF.py
