#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=10:00
#SBATCH --partition=cpa

./restore0 -i grande.ppm -o refgrande.ppm -b 2
