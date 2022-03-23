#!/bin/bash
#! Name of the job:
#SBATCH -J vg10100HMCV1
#SBATCH --account GVDD-SL2-GPU
#SBATCH -p ampere
#SBATCH --nodes 1
#SBATCH --gres=gpu:4
#SBATCH --output=%x.%j.out

#SBATCH --mail-type=ALL
#SBATCH --time=1:00:00
python -m torch.distributed.launch --master_port 12345 --nproc_per_node=4 ./tools/test_sg_net.py --config-file ./sgg_configs/vgattr/HMC/vinvl_vg10100.yaml