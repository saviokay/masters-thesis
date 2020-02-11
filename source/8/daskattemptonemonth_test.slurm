#!/bin/bash

#SBATCH --job-name=daskonemonth_test
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
#SBATCH --partition=high_mem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=22000


python daskattemptonemonth_test.py
