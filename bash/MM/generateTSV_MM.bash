#!/bin/bash
#! Name of the job:
#SBATCH -J generateTSVMM
#SBATCH --account GVDD-SL2-CPU
#SBATCH -p skylake-himem
#SBATCH -N1
#SBATCH -n16
#SBATCH --output=%x.%j.out

#SBATCH --mail-type=ALL
#SBATCH --time=12:00:00

python tools/mini_tsv/tsv_MM.py