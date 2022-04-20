#!/bin/sh
#SBATCH --nodes=2
#SBATCH --ntasks=8
#SBATCH --time=5:00
#SBATCH --partition=cpa

echo Ciclica
mpiexec sistcf 2000
echo No ciclica
mpiexec sistbf 2000
