#!/bin/bash
#! Name of the job:
#SBATCH -J attr5050MMDownV1single
#SBATCH --account GVDD-SL2-GPU
#SBATCH -p ampere
#SBATCH --nodes 1
#SBATCH --gres=gpu:4
#SBATCH --output=%x.%j.out

#SBATCH --mail-type=ALL
#SBATCH --time=36:00:00
python ./tools/test_sg_net.py --config-file ./sgg_configs/vgattr/MM_Down/vinvl_attr5050.yaml