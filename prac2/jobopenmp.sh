#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --partition=cpa

echo static chunk por defecto restore1
OMP_NUM_THREADS=16 OMP_SCHEDULE=static ./restore1 -i grande.ppm -o refkahan1.ppm -b 2
echo static chunk 1 restore1
OMP_NUM_THREADS=16 OMP_SCHEDULE=static,1 ./restore1 -i grande.ppm -o refkahan1.ppm -b 2
echo dynamic por defecto restore1
OMP_NUM_THREADS=16 OMP_SCHEDULE=dynamic ./restore1 -i grande.ppm -o refkahan1.ppm -b 2

echo static chunk por defecto restore2
OMP_NUM_THREADS=16 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o refkahan2.ppm -b 2
echo static chunk 1 restore2
OMP_NUM_THREADS=16 OMP_SCHEDULE=static,1 ./restore2 -i grande.ppm -o refkahan2.ppm -b 2
echo dynamic por defecto restore2
OMP_NUM_THREADS=16 OMP_SCHEDULE=dynamic ./restore2 -i grande.ppm -o refkahan2.ppm -b 2


OMP_NUM_THREADS=4 ./restore3 -i grande.ppm -o refkahan3.ppm -b 2
