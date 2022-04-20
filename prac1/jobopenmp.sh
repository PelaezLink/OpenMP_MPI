#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --partition=cpa
OMP_NUM_THREADS=16 ./primo_grande

OMP_NUM_THREADS=16 OMP_SCHEDULE=static ./primo_numeros
OMP_NUM_THREADS=16 OMP_SCHEDULE=static,1 ./primo_numeros
OMP_NUM_THREADS=16 OMP_SCHEDULE=dynamic ./primo_numeros
