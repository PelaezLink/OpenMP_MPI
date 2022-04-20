#include <stdio.h>
#include <math.h>
#include <limits.h>
#include <omp.h>

typedef unsigned long long Entero_grande;
#define ENTERO_MAS_GRANDE  ULLONG_MAX

int primo(Entero_grande n)
{
  volatile int p;
  Entero_grande i, s;

  p = (n % 2 != 0 || n == 2);

  if (p) {
    s = sqrt(n);

int myid;    
    
#pragma omp parallel private(myid, i) 
{    
    int nhilos = omp_get_num_threads();
    myid = omp_get_thread_num();
    
    for (i = 3 + myid*2; p && i <= s; i += 2*nhilos)
      if (n % i == 0) p = 0;
}
  }

  return p;
}

int main()
{
  double t1 = omp_get_wtime();
  Entero_grande n;

  for (n = ENTERO_MAS_GRANDE; !primo(n); n -= 2) {
    /* NADA */
  }

  double t2 = omp_get_wtime();
  printf("El mayor primo que cabe en %lu bytes es %llu.\n",
         sizeof(Entero_grande), n);
  printf("Tiempo: %lf\n", t2-t1);

  return 0;
}
