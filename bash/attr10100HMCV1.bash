#!/bin/bash
#! Name of the job:
#SBATCH -J attr10100HMCV1
#SBATCH --account GVDD-SL2-GPU
#SBATCH -p ampere
#SBATCH --nodes 1
#SBATCH --gres=gpu:4

#SBATCH --mail-type=ALL
#SBATCH --time=4:00:00
python -m torch.distributed.launch --nproc_per_node=4 ./tools/test_sg_net.py --config-file ./sgg_configs/vgattr/HMC/vinvl_attr10100.yaml