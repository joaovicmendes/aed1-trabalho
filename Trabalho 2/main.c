// Informações do estudante
// Nome: João Victor Mendes Freire
// Curso: BCC
// RA: 758943

#include <stdio.h>

int bubblesort(int *array, int array_size);

int main(int argc, char** argv)
{
    int size;
    scanf("%d", &size);

    int array[size];
    for (int i = 0; i < size; i++)
    {
        scanf("%d", &array[i]);
    }

    int operations = bubblesort(array, size);
    printf("%d\n", operations);
    
    return 0;
}

// @retorno inteiro que representa o número de operações realizadas para ordenar dada array
// @parametro array endereço inicial de uma array
// @parametro array_size tamanho total da array [0..(array_size - 1)]
int bubblesort(int *array, int array_size)
{
    int trocou = 0;

    for (int i = 0; i < array_size; i++)
    {
        for (int j = 0; j < (array_size - i - 1); j++)
        {
            if (array[j] > array[j + 1])
            {
                int aux = array[j];
                array[j] = array[j + 1];
                array[j + 1] = aux;
                trocou++;
            } 
        }
    }

    return trocou;
}