#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>

/* Funcion f(x) de la cual se quiere calcular la integral */
double f(double x)
{
//   return pow(10*x-14.0/3.0,3)-150*x+120;
   return M_PI/2.0*sin(x*M_PI);
}


/* Calculo de la integral de la funcion f. Variante 1 */
double calcula_integral1(double a, double b, int n)
{
   double h, s=0, result;
   int i;

   h=(b-a)/n;

   #pragma omp parallel for reduction(+:s) 
   for (i=0; i<n; i++) {
      s+=f(a+h*(i+0.5));
   }

   result = h*s;
   return result;
}

/* Calculo de la integral de la funcion f. Variante 2 */
double calcula_integral2(double a, double b, int n)
{
   double x, h, s=0, result;
   int i;

   h=(b-a)/n;

   #pragma omp parallel for reduction(+:s) private(x) 
   for (i=0; i<n; i++) {
      x=a;
      x+=h*(i+0.5);

      s+=f(x);
   }

   result = h*s;
   return result;
}

int main(int argc, char *argv[])
{
   double a, b, result;
   int n, variante;
   double t1, t2;

   

   if (argc<2) {
      fprintf(stderr, "Numero de argumentos incorrecto\n");
      return 1;
   }
   if (argc>2) n=atoi(argv[2]);
   else n=100000;
   a=0;
   b=1;

   //Para sacar el numero de hilos

   int myid;
   #pragma omp parallel private(myid)
   {
      int nhilos = omp_get_num_threads();
      myid = omp_get_thread_num();

      if (myid==0){
         printf("Numero de hilos: %d\n", nhilos);
      } 

   }   


   variante=atoi(argv[1]);
   t1 = omp_get_wtime();
   switch (variante) {
      case 1:
         result = calcula_integral1(a,b,n);
         break;
      case 2:
         result = calcula_integral2(a,b,n);
         break;
      default:
         fprintf(stderr, "Numero de variante incorrecto\n");
         return 1;
   }
   t2 = omp_get_wtime();
   printf("Valor de la integral = %.12f\n", result);
   printf("Tiempo: %f\n", t2-t1);
   return 0;
}
