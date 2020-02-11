#!/bin/bash

#SBATCH --job-name=P13MonthTestRun
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.err
#SBATCH --partition=high_mem
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=3
#SBATCH --qos=medium+
#SBATCH --mem=16000


python P13Sub_CF_test.py
