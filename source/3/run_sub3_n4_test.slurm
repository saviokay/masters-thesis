#!/bin/bash

#SBATCH --job-name=3N4MonthTestRun
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
#SBATCH --partition=batch
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python Sub3_CF_test.py
