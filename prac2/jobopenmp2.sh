#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --partition=cpa

echo restore1 2 hilos
OMP_NUM_THREADS=2 OMP_SCHEDULE=static ./restore1 -i grande.ppm -o refkahan1.ppm -b 2
echo restore1 4 hilos
OMP_NUM_THREADS=4 OMP_SCHEDULE=static ./restore1 -i grande.ppm -o refkahan1.ppm -b 2
echo restore1 8 hilos
OMP_NUM_THREADS=8 OMP_SCHEDULE=static ./restore1 -i grande.ppm -o refkahan1.ppm -b 2
echo restore1 16 hilos
OMP_NUM_THREADS=16 OMP_SCHEDULE=static ./restore1 -i grande.ppm -o refkahan1.ppm -b 2
echo restore1 32 hilos
OMP_NUM_THREADS=32 OMP_SCHEDULE=static ./restore1 -i grande.ppm -o refkahan1.ppm -b 2
echo restore1 64 hilos
OMP_NUM_THREADS=64 OMP_SCHEDULE=static ./restore1 -i grande.ppm -o refkahan1.ppm -b 2

echo ###########################################################################

echo restore2 2 hilos
OMP_NUM_THREADS=2 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o refkahan2.ppm -b 2
echo restore2 4 hilos
OMP_NUM_THREADS=4 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o refkahan2.ppm -b 2
echo restore2 8 hilos
OMP_NUM_THREADS=8 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o refkahan2.ppm -b 2
echo restore2 16 hilos
OMP_NUM_THREADS=16 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o refkahan2.ppm -b 2
echo restore2 32 hilos
OMP_NUM_THREADS=32 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o refkahan2.ppm -b 2
echo restore2 64 hilos
OMP_NUM_THREADS=64 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o refkahan2.ppm -b 2

