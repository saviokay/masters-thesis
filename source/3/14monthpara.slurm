#!/bin/bash

#SBATCH --job-name=14paramonth
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
#SBATCH --partition=high_mem
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=22000


python 1monthpara.py
