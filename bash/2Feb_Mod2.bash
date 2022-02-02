#!/bin/bash
#! Name of the job:
#SBATCH -J 2FebMod2
#SBATCH --account GVDD-SL2-GPU
#SBATCH -p ampere
#SBATCH --nodes 1
#SBATCH --gres=gpu:1

#SBATCH --mail-type=ALL
#SBATCH --time=1:00:00
python ./tools/test_sg_net.py --config-file ./sgg_configs/vgattr/vinvl_attr3636Mod2.yaml