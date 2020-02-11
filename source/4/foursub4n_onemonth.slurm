#!/bin/bash

#SBATCH --job-name=foursub4n_onemonth
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
#SBATCH --partition=high_mem
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=22000


python foursub4n_onemonth.py
