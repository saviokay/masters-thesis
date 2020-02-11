#!/bin/bash

#SBATCH --job-name=1N1MonthTestRunSub1
#SBATCH --output=slurm_sub1_n1.out
#SBATCH --error=slurm_sub1_n1.err
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub1_CF.py
