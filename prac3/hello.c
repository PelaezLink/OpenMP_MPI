#include <stdio.h>
#include <mpi.h>
int main (int argc, char *argv[])
{
    MPI_Init(&argc, &argv);
    int id;
    MPI_Comm_rank(MPI_COMM_WORLD, &id);
    int num;
    MPI_Comm_size(MPI_COMM_WORLD, &num);
    printf("Hello world. Soy el proceso %d de %d procesis\n", id, num);
    MPI_Finalize();
    return 0;
}
