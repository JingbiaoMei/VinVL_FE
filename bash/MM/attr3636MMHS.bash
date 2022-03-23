#!/bin/bash
#! Name of the job:
#SBATCH -J attr3636HMCV1
#SBATCH --account GVDD-SL2-GPU
#SBATCH -p ampere
#SBATCH --nodes 1
#SBATCH --gres=gpu:4

#SBATCH --mail-type=ALL
#SBATCH --time=36:00:00
python -m torch.distributed.launch --nproc_per_node=4 ./tools/test_sg_net.py --config-file ./sgg_configs/vgattr/MM/vinvl_attr3636.yaml