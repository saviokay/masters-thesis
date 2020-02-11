#!/bin/bash

#SBATCH --job-name=12N1MonthTestRunSub1
#SBATCH --output=slurm_sub1_n12_test.out
#SBATCH --error=slurm_sub1_n12_test.err
#SBATCH --partition=batch
#SBATCH --nodes=12
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub3_CF_test.py
