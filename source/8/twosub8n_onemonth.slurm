#!/bin/bash

#SBATCH --job-name=twosub8n_onemonth
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
#SBATCH --partition=high_mem
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=22000


python twosub8n_onemonth.py
