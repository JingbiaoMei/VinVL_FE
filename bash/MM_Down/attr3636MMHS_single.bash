#!/bin/bash
#! Name of the job:
#SBATCH -J attr3636HMCV1singlegpu
#SBATCH --account GVDD-SL2-GPU
#SBATCH -p ampere
#SBATCH --nodes 1
#SBATCH --gres=gpu:1
#SBATCH --output=%x.%j.out

#SBATCH --mail-type=ALL
#SBATCH --time=36:00:00
python ./tools/test_sg_net.py --config-file ./sgg_configs/vgattr/MM/vinvl_attr3636.yaml